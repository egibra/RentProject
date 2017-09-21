package com.project.platform.renting.web.component;

import com.project.platform.renting.core.model.User;
import com.project.platform.renting.core.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

@Component
@PropertySource("classpath:/messages.properties")
public class CustomValidation implements Validator{

    @Value("#{'${com.project.platform.renting.validation-password}'.split(';')}")
    private String[] passMessages;

    @Value("#{'${com.project.platform.renting.validation-other}'.split(';')}")
    private String[] otherMessages;

    private UserService userService;

    @Autowired
    public CustomValidation(UserService userService) {
        this.userService = userService;
    }

    @Override
    public boolean supports(Class clazz) {
        return User.class.equals(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {
        User user = (User) target;

        ValidationUtils.rejectIfEmpty(errors, "firstName", otherMessages[0]);
        ValidationUtils.rejectIfEmpty(errors, "lastName", otherMessages[1]);

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email", otherMessages[4]);
        if (userService.getUserByEmail(user.getEmail()) != null) {
            errors.rejectValue("email", otherMessages[3]);
        }
        if (!validateEmail(user.getEmail())){
            errors.rejectValue("email", otherMessages[5]);
        }

        List<String> passErrors = validatePassword(user.getPassword());

        for (String er : passErrors){
            errors.rejectValue("password", er);
        }
    }


    public List<String> validateUserFields(User user, boolean passChanged){
        List<String> errors = new ArrayList<>();

        if (user.getFirstName().isEmpty())
            errors.add(otherMessages[0]);

        if (user.getLastName().isEmpty())
            errors.add(otherMessages[1]);


        if (!user.getPhoneNumber().matches("^[+]?[0-9]+$") && !user.getPhoneNumber().isEmpty())
            errors.add(otherMessages[2]);

        if (passChanged) {
            errors.addAll(validatePassword(user.getPassword()));
        }

        return errors;
    }

    public List<String> validatePassword(String password){
        List<String> errors = new ArrayList<>();

        if (password.isEmpty() || password.matches(".*[\\s]+.*"))
            errors.add(passMessages[0]);

        if (password.length() < 6 || password.length() > 30) {
            errors.add(passMessages[1]);
        }

        if (!password.matches(".*[A-Z]+.*")) {
            errors.add(passMessages[2]);
        }

        if (!password.matches(".*[0-9]+.*")) {
            errors.add(passMessages[3]);
        }

        if (password.matches(".*[^A-Za-z0-9]+.*")) {
            errors.add(passMessages[4]);
        }

        return errors;
    }

    public boolean validateEmail(String email){
        Pattern pattern = Pattern.compile("[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,4}");

        return pattern.matcher(email.toUpperCase()).matches();
    }



}
