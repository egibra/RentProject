package com.project.platform.renting.core.service;

import com.project.platform.renting.core.model.User;
import org.springframework.security.core.userdetails.UserDetails;

public interface SecurityService {
    User findLoggedInUser();
    void autoLogin(String email, String password);
    UserDetails getUserDetails();
}
