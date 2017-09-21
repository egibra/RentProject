package com.project.platform.renting.core.service;

import com.project.platform.renting.core.model.User;
import com.project.platform.renting.core.model.VerificationToken;

public interface UserService {
    User getUserByEmail(String email);
    void save(User user);
    void createVerificationToken(User user, String token);
    VerificationToken getVerificationToken(String token);
    void update(User user, boolean passChanged);
}
