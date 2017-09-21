package com.project.platform.renting.web.config;

import com.project.platform.renting.core.model.ShoppingCart;
import com.project.platform.renting.core.model.User;
import com.project.platform.renting.core.service.SecurityService;
import com.project.platform.renting.core.service.ShoppingCartService;
import com.project.platform.renting.web.component.ShoppingCartProcessing;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.*;

@Component
public class AuthenticationSuccessHandlerConfig implements AuthenticationSuccessHandler {

    @Value("${com.project.platform.renting.admin-url}")
    private String adminPath;

    @Value("${com.project.platform.renting.user-url}")
    private String userPath;

    private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();

    private ShoppingCartProcessing shoppingCartProcessing;

    private SecurityService securityService ;

    @Autowired
    public AuthenticationSuccessHandlerConfig(ShoppingCartProcessing shoppingCartProcessing, SecurityService securityService) {
        this.redirectStrategy = new DefaultRedirectStrategy();
        this.shoppingCartProcessing = shoppingCartProcessing;
        this.securityService = securityService;
    }

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
        Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
        if(authorities.contains(new SimpleGrantedAuthority("vartotojas"))){
            shoppingCartProcessing.loadShoppingCart(request.getSession(), securityService.findLoggedInUser());
            redirectStrategy.sendRedirect(request, response, "/");
        }
        else if(authorities.contains(new SimpleGrantedAuthority("adminas"))){
            redirectStrategy.sendRedirect(request, response, adminPath+"/products");
        }
    }


}
