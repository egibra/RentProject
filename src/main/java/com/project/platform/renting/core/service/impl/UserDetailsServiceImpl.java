package com.project.platform.renting.core.service.impl;

import com.project.platform.renting.core.repository.UserRepository;
import com.project.platform.renting.core.model.MyUserDetails;
import com.project.platform.renting.core.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.Collections;

@Service
public class UserDetailsServiceImpl implements UserDetailsService {

    private UserRepository userRepository;

    @Autowired
    public UserDetailsServiceImpl(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        try {
            User user = userRepository.findByEmail(email);
            SimpleGrantedAuthority userAuthority = new SimpleGrantedAuthority(user.getRole().toString());
            MyUserDetails myUserDetails = new MyUserDetails(
                    user.getEmail(),
                    user.getPassword(),
                    user.isVerified(),
                    true, true, true,
                    Collections.singletonList(userAuthority));
            myUserDetails.setUser(user);
            return myUserDetails;
        } catch (Exception ex) {
            throw new UsernameNotFoundException("User not found");
        }
    }
}
