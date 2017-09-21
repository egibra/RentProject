package com.project.platform.renting.service;

import com.icegreen.greenmail.util.GreenMail;
import com.icegreen.greenmail.util.GreenMailUtil;
import com.icegreen.greenmail.util.ServerSetupTest;
import com.project.platform.renting.core.config.Application;
import com.project.platform.renting.core.model.User;
import com.project.platform.renting.core.model.UserRole;
import com.project.platform.renting.core.service.UserService;
import com.project.platform.renting.core.service.impl.EmailNotificationServiceImpl;
import com.project.platform.renting.config.TestConfiguration;
import freemarker.template.Configuration;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.ImportAutoConfiguration;
import org.springframework.boot.autoconfigure.flyway.FlywayAutoConfiguration;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.test.context.jdbc.Sql;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.util.ReflectionTestUtils;

import javax.annotation.Resource;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;


@RunWith(SpringRunner.class)
@SpringBootTest(classes = {Application.class, TestConfiguration.class})
@DataJpaTest
@ImportAutoConfiguration(exclude = FlywayAutoConfiguration.class)
@Sql(executionPhase = Sql.ExecutionPhase.BEFORE_TEST_METHOD,
        scripts = "classpath:db/users.sql")
public class EmailTest {

    private JavaMailSenderImpl javaMailSender;

    @Autowired
    private UserService userService;

    @Autowired
    private Configuration freemarkerConfiguration;

    private EmailNotificationServiceImpl emailNotificationService;

    private GreenMail greenMail;

    @Before
    public void setUp() {
        javaMailSender = new JavaMailSenderImpl();
        emailNotificationService = new EmailNotificationServiceImpl(javaMailSender, userService, freemarkerConfiguration);

        greenMail = new GreenMail(ServerSetupTest.SMTP);
        greenMail.start();

        //greenmail port
        javaMailSender.setPort(3025);
        javaMailSender.setHost("localhost");
    }

    @After
    public void stop() {
        greenMail.stop();
    }

    //testing MimeMessage class
    @Test
    public void testJavaMailSenderMimeMessage() throws MessagingException {
        MimeMessage mail = javaMailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(mail, true, "UTF-8");

        helper.setTo("test@receiver.com");
        helper.setFrom("test@sender.com");
        helper.setSubject("test subject");
        helper.setText("<p>Test HTML content</p>", true);

        javaMailSender.send(mail);
        Message[] messages = greenMail.getReceivedMessages();

        assertEquals(1, messages.length);
        assertEquals("test subject", messages[0].getSubject());
        assertEquals("test@receiver.com", messages[0].getAllRecipients()[0].toString());
        assertEquals("test@sender.com", messages[0].getFrom()[0].toString());
        assertTrue(GreenMailUtil.getBody(messages[0]).contains("<p>Test HTML content</p>"));
    }

    //testing SimpleMailMessage class
    @Test
    public void testJavaMailSenderSimpleMessage() throws MessagingException {
        SimpleMailMessage message = new SimpleMailMessage();

        message.setFrom("test@sender.com");
        message.setTo("test@receiver.com");
        message.setSubject("test subject");
        message.setText("test message");

        javaMailSender.send(message);
        Message[] messages = greenMail.getReceivedMessages();

        assertEquals(1, messages.length);
        assertEquals("test subject", messages[0].getSubject());
        assertEquals("test@receiver.com", messages[0].getAllRecipients()[0].toString());
        assertEquals("test@sender.com", messages[0].getFrom()[0].toString());
        assertEquals("test message", GreenMailUtil.getBody(messages[0]));
    }

    //testing message sent on successful registration
    @Test
    public void testSuccessRegNotification() throws MessagingException {
        User user = new User();
        user.setEmail("test@test.com");
        user.setFirstName("firstName");
        user.setLastName("lastName");
        user.setPassword("password");
        user.setRole(new UserRole(1, "vartotojas"));

        ReflectionTestUtils.setField(emailNotificationService, "adminEmail", "teletubbies322@gmail.com");

        emailNotificationService.sendSuccessRegNotification(user);

        Message[] messages = greenMail.getReceivedMessages();

        assertEquals(1, messages.length);
        assertEquals("BeHero.lt Registracija", messages[0].getSubject());
        assertEquals("test@test.com", messages[0].getAllRecipients()[0].toString());
        assertEquals("teletubbies322@gmail.com", messages[0].getFrom()[0].toString());
    }

    @Test
    public void testContactsHelpMessage() throws  MessagingException {

        String email = "test@test.com";
        String subject = "subject";
        String message = "test";

        ReflectionTestUtils.setField(emailNotificationService, "adminEmail", "teletubbies322@gmail.com");

        emailNotificationService.sendHelpRequest(email, subject, message);

        Message[] messages = greenMail.getReceivedMessages();

        assertEquals(1, messages.length);
        assertEquals("subject", messages[0].getSubject());
        assertEquals("teletubbies322@gmail.com", messages[0].getAllRecipients()[0].toString());
        assertEquals("teletubbies322@gmail.com", messages[0].getFrom()[0].toString());
    }

}
