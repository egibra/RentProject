package com.project.platform.renting.web.controller;

import com.project.platform.renting.core.model.User;
import com.project.platform.renting.core.service.EmailNotificationService;
import com.project.platform.renting.core.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.MailException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.mail.MessagingException;

@Controller
public class UserVerificationRestController {

    private UserService userService;
    private EmailNotificationService emailNotificationService;

    @Value("#{'${com.project.platform.renting.verification.error.messages}'.split(';')}")
    private String[] errorMessages;

    @Autowired
    private UserVerificationRestController(UserService userService, EmailNotificationService emailNotificationService) {
        this.userService = userService;
        this.emailNotificationService = emailNotificationService;
    }

    @RequestMapping(value = "/user-form/resent", method = RequestMethod.POST, consumes = MediaType.TEXT_PLAIN_VALUE)
    public ResponseEntity resendVerification(@RequestBody String email) throws Exception{

        User resendUser = userService.getUserByEmail(email);

        if(resendUser == null)
            return new ResponseEntity(errorMessages[0], HttpStatus.BAD_REQUEST);

        if (resendUser.isVerified())
            return new ResponseEntity(errorMessages[1], HttpStatus.BAD_REQUEST);

        try {
            emailNotificationService.sendSuccessRegNotification(resendUser);
        } catch (MailException | MessagingException e){
            return new ResponseEntity(errorMessages[2], HttpStatus.BAD_REQUEST);
        }

        return new ResponseEntity(HttpStatus.OK);
    }

    @RequestMapping(value = "/user-form/recovery", method = RequestMethod.POST, consumes = MediaType.TEXT_PLAIN_VALUE)
    public ResponseEntity recoveryEmail(@RequestBody String email) throws Exception{

        User recoveryUser = userService.getUserByEmail(email);

        if(recoveryUser == null)
            return new ResponseEntity(errorMessages[0], HttpStatus.BAD_REQUEST);

        try {
            emailNotificationService.sendRecoveryNotification(recoveryUser);
        } catch (MailException | MessagingException e){
            return new ResponseEntity(errorMessages[2], HttpStatus.BAD_REQUEST);
        }

        return new ResponseEntity(HttpStatus.OK);
    }

}
