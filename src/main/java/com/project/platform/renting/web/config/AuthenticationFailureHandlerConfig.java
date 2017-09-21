package com.project.platform.renting.web.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Component
public class AuthenticationFailureHandlerConfig extends SimpleUrlAuthenticationFailureHandler{

    @Value("${com.project.platform.renting.failure.url}")
    private String errorUrl;

    @Value("#{'${com.project.platform.renting.failure.login.errors}'.split(';')}")
    private String[] loginErrors;

    @Override
    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException exception) throws IOException, ServletException {

        setDefaultFailureUrl(errorUrl);

        super.onAuthenticationFailure(request, response, exception);

        String errorMessage = loginErrors[0];

        if (exception.getMessage().equalsIgnoreCase("User is disabled")) {
            errorMessage =  loginErrors[1];
        }

        request.getSession().setAttribute("errorMessage", errorMessage);
    }
}
