package com.project.platform.renting.web.component;

import com.project.platform.renting.core.model.User;
import com.project.platform.renting.core.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;

import java.util.ArrayList;
import java.util.List;

@Component
public class UserProfileProcessing {

    private UserService userService;
    private CustomValidation customValidation;

    @Autowired
    public UserProfileProcessing(UserService userService, CustomValidation customValidation) {
        this.userService = userService;
        this.customValidation = customValidation;
    }

    public boolean processProfile(User user, User loggedInUser, String newPassword, String newPasswordConfirm, Model model){
        List<String> errors = new ArrayList<>();
        boolean passChanged = true;

        // password changes
        if (!user.getPassword().isEmpty()){
            if (newPassword.equals(newPasswordConfirm) &&
                    new BCryptPasswordEncoder().matches(user.getPassword(), loggedInUser.getPassword())) {
                user.setPassword(newPassword);
            }
            else {
                errors.add("Netinkamas slaptažodis arba naujo slaptažodžio laukai nesutampa.");
                model.addAttribute("errors", errors);
                return false;
            }
        }
        else {
            passChanged = false;
            user.setPassword(loggedInUser.getPassword());
        }

        user.setRole(loggedInUser.getRole());
        user.setVerified(loggedInUser.isVerified());

        errors.addAll(customValidation.validateUserFields(user, passChanged));

        //if there are errors
        if (!errors.isEmpty()) {
            model.addAttribute("errors", errors);
            return false;
        }

        //else user updated
        userService.update(user, passChanged);

        return true;
    }
}
