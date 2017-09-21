package com.project.platform.renting.web.controller;

import com.project.platform.renting.core.model.User;
import com.project.platform.renting.core.service.EmailNotificationService;
import com.project.platform.renting.core.service.UserService;
import com.project.platform.renting.web.component.CustomValidation;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.mail.MessagingException;
import java.util.ArrayList;
import java.util.List;

@Controller
public class UserRegistrationController {

    private UserService userService;

    private CustomValidation userValidator;

    private EmailNotificationService emailService;

    @Autowired
    public UserRegistrationController(UserService userService, CustomValidation userValidator, EmailNotificationService emailService) {
        this.userService = userService;
        this.userValidator = userValidator;
        this.emailService = emailService;
    }

    private static Logger logger = LoggerFactory.getLogger(UserRegistrationController.class);

    private User user;

    @RequestMapping("${com.project.platform.renting.login-url}")
    public String showRegistrationForm(){
        return "user-form";
    }

    @RequestMapping("${com.project.platform.renting.user-url}"+"/profile")
    public String showLogonUser()
    {
        return "profile-main";
    }


    @RequestMapping(value = "/user-form/registration", method = RequestMethod.POST)
    public String registration(@ModelAttribute("username") String email, @ModelAttribute("passwordConfirm") String passConfirm,
                               @ModelAttribute("userForm") User userForm, BindingResult bindingResult, Model model) {

        userForm.setEmail(email);
        user = userForm;
        userValidator.validate(user, bindingResult);

        //if there are errors
        if (bindingResult.hasErrors() || !user.getPassword().equals(passConfirm)) {

            //get all error messages
            List<String> errors = new ArrayList<>(); //error messages
            List<String> fieldErrors = new ArrayList<>(); //fields that have errors

            for (Object o : bindingResult.getAllErrors()){

                if(o instanceof FieldError) {
                    errors.add(((FieldError) o).getCode());
                    if (!fieldErrors.contains(((FieldError) o).getField())) {
                        fieldErrors.add(((FieldError) o).getField());
                    }
                }
            }

            // this error is checked here, not in validator
            if (!user.getPassword().equals(passConfirm))
                errors.add("Slaptažodžiai nesutampa.");

            model.addAttribute("regFieldErrors", fieldErrors); //gives all error fields (password, email...)
            model.addAttribute("regErrors", errors); //gives all errors
            model.addAttribute("userForm", user); //gives a user
            model.addAttribute("isRegistration", "registrationCheck"); //checks if this is coming from registration
            return "user-form";
        }

        //if no errors
        userService.save(user);

        return "redirect:/registration/success";
    }

    @RequestMapping(value = "/user-form/registration", method = RequestMethod.GET)
    public String showRegistration(Model model){
        model.addAttribute("isRegistration", "registrationCheck"); //checks if this is coming from registration
        return "user-form";
    }


    @RequestMapping(value = "/registration/success", method = RequestMethod.GET)
    public String registrationSuccess() {

        try {
            emailService.sendSuccessRegNotification(user);
        } catch (MailException | MessagingException e){
            logger.error(e.getMessage());
        } finally {
            user = null;
        }

        return "registration-success";
    }

}
