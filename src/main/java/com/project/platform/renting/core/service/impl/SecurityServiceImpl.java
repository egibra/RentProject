package com.project.platform.renting.core.service.impl;

import com.project.platform.renting.core.model.MyUserDetails;
import com.project.platform.renting.core.model.User;
import com.project.platform.renting.core.service.SecurityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Service;

@Service
public class SecurityServiceImpl implements SecurityService {

    private UserDetailsService userDetailsService;

    @Autowired
    public SecurityServiceImpl(UserDetailsService userDetailsService) {
        this.userDetailsService = userDetailsService;
    }

    // Used to find user who is currently logged in
    @Override
    public User findLoggedInUser() {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();

        if (!(auth instanceof AnonymousAuthenticationToken)) {
            return ((MyUserDetails) auth.getPrincipal()).getUser();
        }

        return null;
    }

    @Override
    public UserDetails getUserDetails(){
        if(findLoggedInUser() != null)
            return (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        else return null;
    }

    // Used after registration for automatic login
    @Override
    public void autoLogin(String email, String password) {
        UserDetails userDetails = userDetailsService.loadUserByUsername(email);
        UsernamePasswordAuthenticationToken usernamePasswordAuthenticationToken =
                new UsernamePasswordAuthenticationToken(userDetails, password, userDetails.getAuthorities());

        if (((MyUserDetails)userDetails).getUser().isVerified()) {
            SecurityContextHolder.getContext().setAuthentication(usernamePasswordAuthenticationToken);
        }
    }
}
