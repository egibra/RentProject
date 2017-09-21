package com.project.platform.renting.core.service.impl;

import com.project.platform.renting.core.model.User;
import com.project.platform.renting.core.service.EmailNotificationService;
import com.project.platform.renting.core.service.UserService;
import freemarker.ext.util.IdentityHashMap;
import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.MailException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;
import org.springframework.ui.freemarker.FreeMarkerTemplateUtils;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import java.io.IOException;
import java.util.Map;
import java.util.UUID;

@Service
public class EmailNotificationServiceImpl implements EmailNotificationService {

    private JavaMailSender javaMailSender;

    private Configuration freemarkerConfiguration;

    private UserService userService;

    @Value("${spring.mail.username}")
    private String adminEmail;

    @Autowired
    public EmailNotificationServiceImpl(JavaMailSender javaMailSender, UserService userService, Configuration freemarkerConfiguration){
        this.javaMailSender = javaMailSender;
        this.userService = userService;
        this.freemarkerConfiguration = freemarkerConfiguration;
    }

    @Async
    @Override
    public void sendHelpRequest(String email, String subject, String message) throws MailException, MessagingException {
        SimpleMailMessage simpleMailMessage = new SimpleMailMessage();

        simpleMailMessage.setFrom(adminEmail);
        simpleMailMessage.setTo(adminEmail);
        simpleMailMessage.setSubject(subject);
        simpleMailMessage.setText("SENT BY: " + email + "\n\n" + message);

        javaMailSender.send(simpleMailMessage);
    }

    @Async
    @Override
    public void sendSuccessRegNotification(User user) throws MailException, MessagingException{
        sendUserMail(user, "BeHero.lt Registracija", "registrationMailTemplate.ftl");

    }

    @Async
    @Override
    public void sendRecoveryNotification(User user) throws MailException, MessagingException {
        sendUserMail(user, "BeHero.lt Slaptažodžio keitimas", "recoveryMailTemplate.ftl");
    }

    @Async
    @Override
    public void sendOrderConfirmation(User user) throws MailException, MessagingException {
        sendUserMail(user, "BeHero.lt užsąkymas", "orderMailTemplate.ftl");
    }

    private void sendUserMail(User user, String subject, String template) throws MailException, MessagingException{
        String token = UUID.randomUUID().toString();
        userService.createVerificationToken(user, token);

        MimeMessage mail = javaMailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(mail, true, "UTF-8");

        helper.setTo(user.getEmail());
        helper.setFrom(adminEmail);
        helper.setSubject(subject);

        String content = generateRegistrationContent(user, token, template);
        helper.setText(content, true);

        javaMailSender.send(mail);
    }

    private String generateRegistrationContent(User user, String token, String htmlTemplate) throws MessagingException{

        try {
            Map<String,Object> context = new IdentityHashMap();
            context.put("user", user);
            context.put("token", token);
            Template template = freemarkerConfiguration.getTemplate(htmlTemplate, "UTF-8");
            return FreeMarkerTemplateUtils.processTemplateIntoString(template, context);

        } catch (IOException e) {
            throw new MessagingException("FreeMarker template not exist", e);
        } catch (TemplateException e) {
            throw new MessagingException("FreeMarker process failed", e);
        }
    }
}
