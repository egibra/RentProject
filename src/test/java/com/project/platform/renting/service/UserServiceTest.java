package com.project.platform.renting.service;

import com.project.platform.renting.config.TestConfiguration;
import com.project.platform.renting.core.config.Application;
import com.project.platform.renting.core.model.MyUserDetails;
import com.project.platform.renting.core.model.User;
import com.project.platform.renting.core.model.UserRole;
import com.project.platform.renting.core.model.VerificationToken;
import com.project.platform.renting.core.service.impl.UserServiceImpl;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.ImportAutoConfiguration;
import org.springframework.boot.autoconfigure.flyway.FlywayAutoConfiguration;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.test.context.jdbc.Sql;
import org.springframework.test.context.junit4.SpringRunner;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

@RunWith(SpringRunner.class)
@SpringBootTest(classes = {Application.class, TestConfiguration.class})
@DataJpaTest
@ImportAutoConfiguration(exclude = FlywayAutoConfiguration.class)
@Sql(executionPhase = Sql.ExecutionPhase.BEFORE_TEST_METHOD,
        scripts = {"classpath:db/users.sql", "classpath:db/verificationTokens.sql"})
public class UserServiceTest {

    @Autowired
    private UserServiceImpl userService;

    private User newUser;

    @Before
    public void setUp() {
        newUser = new User();
        newUser.setEmail("test2@test.com");
        newUser.setFirstName("testName");
        newUser.setLastName("testLastName");
        newUser.setPassword("password123");
        newUser.setRole(new UserRole(1, "vartotojas"));
    }

    @Test
    public void testGetExistingUser(){
        User user = userService.getUserByEmail("test@test.com");
        assertEquals("Wrong Name. ", "firstName", user.getFirstName());
        assertEquals("Wrong Last Name.", "lastName", user.getLastName());
        assertEquals("Wrong Email.", "test@test.com", user.getEmail());
    }

    @Test
    public void testGetNonExistingUser(){
        User user = userService.getUserByEmail("dontexist@test.com");
        assertNull(user);
    }

    @Test
    public void testSaveUserWithHashPassword(){
        String password = newUser.getPassword();
        userService.save(newUser);
        User user = userService.getUserByEmail(newUser.getEmail());

        assertEquals(newUser.getEmail(), user.getEmail());
        assertTrue(new BCryptPasswordEncoder().matches(password, user.getPassword()));
    }

    @Test
    public void testGetExistingVerificationToken(){
        VerificationToken token = userService.getVerificationToken("token1");
        assertEquals("token1", token.getToken());
        assertEquals("test@test.com", token.getUser().getEmail());
        assertEquals("2017-05-07 20:24:13.0", token.getExpiryDate().toString());
    }

    @Test
    public void testGetNonExistingVerificationToken(){
        VerificationToken token = userService.getVerificationToken("dont exist");
        assertNull(token);
    }

    @Test
    public void testCreateVerificationTokenExistingUser_ShouldDeleteCurrentToken(){
        //looking for current token
        VerificationToken token = userService.getVerificationToken("token1");
        assertEquals("token1", token.getToken());

        //saving new token
        User user = userService.getUserByEmail("test@test.com");
        userService.createVerificationToken(user, "new token");

        //looking for new token
        token = userService.getVerificationToken("new token");
        assertEquals("new token", token.getToken());

        //looking for old token
        token = userService.getVerificationToken("token1");
        assertNull(token);
    }
    }
