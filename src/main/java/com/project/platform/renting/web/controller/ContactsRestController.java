package com.project.platform.renting.web.controller;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.project.platform.renting.core.service.EmailNotificationService;
import com.project.platform.renting.web.component.CustomValidation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.MailException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.mail.MessagingException;
import java.io.IOException;

@Controller
public class ContactsRestController {

    private EmailNotificationService emailNotificationService;

    private CustomValidation customValidation;

    @Autowired
    public ContactsRestController(EmailNotificationService emailNotificationService, CustomValidation customValidation){
        this.emailNotificationService = emailNotificationService;
        this.customValidation = customValidation;
    }

    @RequestMapping(value="/contacts/send-letter", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public ResponseEntity sendLetter(@RequestBody String json) throws IOException {

        ObjectMapper mapper = new ObjectMapper();
        JsonNode jsonNode = mapper.readTree(json);
        String email = jsonNode.get("email").asText();
        String subject = jsonNode.get("subject").asText();
        String message = jsonNode.get("message").asText();

        if (!customValidation.validateEmail(email)) {
            return new ResponseEntity("Blogas email formatas.", HttpStatus.BAD_REQUEST);
        }

        try {
            emailNotificationService.sendHelpRequest(email, subject, message);
            System.out.println("success");
        } catch ( MailException | MessagingException e) {
            return new ResponseEntity("Problema siunčiant laišką.", HttpStatus.BAD_REQUEST);
        }

        return new ResponseEntity(HttpStatus.OK);
    }

}
