package com.project.platform.renting.component;

import com.project.platform.renting.config.TestConfiguration;
import com.project.platform.renting.core.config.Application;
import com.project.platform.renting.core.model.User;
import com.project.platform.renting.web.component.CustomValidation;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

@RunWith(SpringRunner.class)
@SpringBootTest(classes = {Application.class, TestConfiguration.class})
public class CustomValidationTest {

    @Autowired
    private CustomValidation customValidation;

    @Test
    public void testValidateEmailCorrect(){
        assertTrue(customValidation.validateEmail("test@test.com"));
        assertTrue(customValidation.validateEmail("t1@t1.co"));
        assertTrue(customValidation.validateEmail("221@121.ru"));
    }

    @Test
    public void testValidateEmailWrong(){
        assertFalse(customValidation.validateEmail("wrong-email"));
        assertFalse(customValidation.validateEmail("123"));
        assertFalse(customValidation.validateEmail("email@email"));
        assertFalse(customValidation.validateEmail("1@1.1"));
        assertFalse(customValidation.validateEmail("email@email.email"));
        assertFalse(customValidation.validateEmail("#@!$@gmail.com"));
        assertFalse(customValidation.validateEmail("test@$##%.com"));
        assertFalse(customValidation.validateEmail("test@test.@$@!"));
    }

    @Test
    public void testValidatePasswordCorrect(){
        assertEquals(0, customValidation.validatePassword("12345E").size());
        assertEquals(0, customValidation.validatePassword("Password123").size());
        assertEquals(0, customValidation.validatePassword("1Pa5WoRd").size());
    }

    @Test
    public void testValidatePasswordWrong(){
        assertTrue(customValidation.validatePassword("").size() > 0);
        assertTrue(customValidation.validatePassword("      ").size() > 0);
        assertTrue(customValidation.validatePassword("password123").size() > 0);
        assertTrue(customValidation.validatePassword("123456").size() > 0);
        assertTrue(customValidation.validatePassword("123").size() > 0);
        assertTrue(customValidation.validatePassword("pass1").size() > 0);
        assertTrue(customValidation.validatePassword("Password").size() > 0);
        assertTrue(customValidation.validatePassword("Passw@rd123").size() > 0);
    }

    @Test
    public void testValidateUserFields(){
        User user = new User();
        user.setFirstName("");
        user.setLastName("");
        user.setPhoneNumber("");

        assertTrue(customValidation.validateUserFields(user, false).size() > 0);

        user.setFirstName("e");
        user.setLastName("e");
        user.setPhoneNumber("e");

        assertTrue(customValidation.validateUserFields(user, false).size() == 1);

        user.setPhoneNumber("+370612345678");

        assertTrue(customValidation.validateUserFields(user, false).size() == 0);

        user.setPhoneNumber("+123");

        assertTrue(customValidation.validateUserFields(user, false).size() == 0);
    }

}
