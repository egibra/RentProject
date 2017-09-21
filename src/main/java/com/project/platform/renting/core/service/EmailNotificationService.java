package com.project.platform.renting.core.service;

import com.project.platform.renting.core.model.User;
import org.springframework.mail.MailException;

import javax.mail.MessagingException;

public interface EmailNotificationService {
    void sendSuccessRegNotification(User user) throws MailException, MessagingException;
    void sendRecoveryNotification(User user) throws MailException, MessagingException;
    void sendOrderConfirmation(User user) throws MailException, MessagingException;
    void sendHelpRequest(String email, String subject, String message) throws MailException, MessagingException;
}
