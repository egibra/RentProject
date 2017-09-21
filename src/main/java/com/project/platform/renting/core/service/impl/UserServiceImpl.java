package com.project.platform.renting.core.service.impl;

import com.project.platform.renting.core.model.MyUserDetails;
import com.project.platform.renting.core.repository.VerificationTokenRepository;
import com.project.platform.renting.core.model.User;
import com.project.platform.renting.core.model.VerificationToken;
import com.project.platform.renting.core.repository.UserRepository;
import com.project.platform.renting.core.repository.UserRoleRepository;
import com.project.platform.renting.core.service.SecurityService;
import com.project.platform.renting.core.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {

    private UserRepository userRepository;

    private UserRoleRepository userRoleRepository;

    private VerificationTokenRepository verificationTokenRepository;

    private SecurityService securityService;

    @Autowired
    public UserServiceImpl(UserRepository userRepository, UserRoleRepository userRoleRepository,
                           VerificationTokenRepository verificationTokenRepository, SecurityService securityService) {
        this.userRepository = userRepository;
        this.userRoleRepository = userRoleRepository;
        this.verificationTokenRepository = verificationTokenRepository;
        this.securityService = securityService;
    }

    @Value("${com.project.platform.renting.default-role-id}")
    private int defaultRoleId;

    @Override
    public User getUserByEmail(String email) {
        return userRepository.findByEmail(email);
    }

    @Override
    public void save(User user) {
        user.setPassword(new BCryptPasswordEncoder().encode(user.getPassword()));
        user.setRole(userRoleRepository.findOne(defaultRoleId));
        userRepository.save(user);
    }

    @Override
    public void createVerificationToken(User user, String token) {
        VerificationToken newToken = new VerificationToken(user, token);
        newToken.setExpiryDate(newToken.calculateExpiryDate(1440));
        verificationTokenRepository.deleteVerification(user);
        verificationTokenRepository.save(newToken);
    }

    @Override
    public VerificationToken getVerificationToken(String token) {
        return verificationTokenRepository.findByToken(token);
    }

    @Override
    public void update(User user, boolean passChanged) {
        if (passChanged) {
            user.setPassword(new BCryptPasswordEncoder().encode(user.getPassword()));
        }
        userRepository.save(user);
        MyUserDetails userDetails = (MyUserDetails) securityService.getUserDetails();
        if (userDetails != null)
            userDetails.setUser(user);
    }
}
