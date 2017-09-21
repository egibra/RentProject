package com.project.platform.renting.web.controller;

import com.project.platform.renting.core.model.User;
import com.project.platform.renting.core.model.VerificationToken;
import com.project.platform.renting.core.repository.VerificationTokenRepository;
import com.project.platform.renting.core.service.SecurityService;
import com.project.platform.renting.core.service.UserService;
import com.project.platform.renting.web.component.CustomValidation;
import com.project.platform.renting.web.component.UserVerificationProcessing;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

@Controller
public class UserVerificationController {

    private UserService userService;

    private SecurityService securityService;

    private VerificationTokenRepository verificationTokenRepository;

    private UserVerificationProcessing userVerificationProcessing;

    @Value("#{'${com.project.platform.renting.verification.success.messages}'.split(';')}")
    private String[] successMessages;

    @Autowired
    public UserVerificationController(UserService userService, SecurityService securityService,
                                      VerificationTokenRepository verificationTokenRepository,
                                      UserVerificationProcessing userVerificationProcessing) {
        this.userService = userService;
        this.securityService = securityService;
        this.verificationTokenRepository = verificationTokenRepository;
        this.userVerificationProcessing = userVerificationProcessing;
    }

    // account verification
    @RequestMapping(value = "/registration-confirm", method = RequestMethod.GET)
    public String confirmRegistration(Model model, @RequestParam("token") String token){

        VerificationToken verificationToken = userService.getVerificationToken(token);
        if (userVerificationProcessing.tokenExistsNot(verificationToken) || userVerificationProcessing.tokenExpired(verificationToken))
            return "redirect:/bad-user";

        User user = verificationToken.getUser();

        user.setVerified(true);
        userService.update(user, false);
        verificationTokenRepository.deleteVerification(user);
        securityService.autoLogin(user.getEmail(), user.getPassword());
        userVerificationProcessing.setMessage(successMessages[0]);
        return "redirect:/verification-successful";
    }

    @RequestMapping(value = {"/verification-successful", "/recovery-successful"}, method = RequestMethod.GET)
    public String successVerification(Model model){
        model.addAttribute("message", userVerificationProcessing.getMessage());
        return "registration-verified";
    }

    @RequestMapping(value = "/bad-user", method = RequestMethod.GET)
    public String failedVerification(Model model){
        model.addAttribute("message", userVerificationProcessing.getMessage());
        return "registration-error-verifying";
    }

    @RequestMapping(value = "/recovery-error", method = RequestMethod.GET)
    public String failedRecovery(Model model){
        model.addAttribute("message", userVerificationProcessing.getMessage());
        return "recovery-error";
    }


    // password recovery
    @RequestMapping(value = "/password-recovery", method = RequestMethod.GET)
    public String recoverPassword(Model model, @RequestParam("token") String token){

        VerificationToken verificationToken = userService.getVerificationToken(token);
        if (userVerificationProcessing.tokenExistsNot(verificationToken) || userVerificationProcessing.tokenExpired(verificationToken))
            return "redirect:/recovery-error";

        User user = verificationToken.getUser();

        model.addAttribute("user", user);
        model.addAttribute("errors", userVerificationProcessing.getErrors());

        return "password-recovery";
    }

    @RequestMapping(value = "/password-recovery", method = RequestMethod.POST)
    public String recoverPassword(Model model, @ModelAttribute("token") String token,
                                  @ModelAttribute("newPassword") String newPassword,
                                  @ModelAttribute("passwordConfirm") String passwordConfirm, @ModelAttribute("email") String email){

        VerificationToken verificationToken = userService.getVerificationToken(token);

        if (userVerificationProcessing.tokenExistsNot(verificationToken) || userVerificationProcessing.tokenExpired(verificationToken))
            return "redirect:/recovery-error";

        User user = verificationToken.getUser();

        if(!userVerificationProcessing.recoverPasswordCheck(newPassword, passwordConfirm)){
            return "redirect:/password-recovery?token=" + token;
        }

        user.setVerified(true);
        verificationTokenRepository.deleteVerification(user);
        user.setPassword(newPassword);
        userService.update(user, true);
        userVerificationProcessing.setMessage(successMessages[1]);
        return "redirect:/recovery-successful";
    }
}
