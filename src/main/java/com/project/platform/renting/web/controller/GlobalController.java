package com.project.platform.renting.web.controller;

import com.project.platform.renting.core.model.User;
import com.project.platform.renting.core.service.SecurityService;
import com.project.platform.renting.core.service.ShoppingCartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import javax.servlet.http.HttpSession;

// Adds this to every Controller
@ControllerAdvice(basePackages = "com.project.platform.renting.web.controller")
public class GlobalController {

    private SecurityService securityService;
    private ShoppingCartService shoppingCartService;

    @Autowired
    public GlobalController(SecurityService securityService, ShoppingCartService shoppingCartService) {
        this.shoppingCartService = shoppingCartService;
        this.securityService = securityService;
    }

    @ModelAttribute
    public void globalAttributes(Model model, HttpSession session){
        User user = securityService.findLoggedInUser();
        model.addAttribute("loggedInUser", user);
        if (user != null)
            session.setAttribute("shoppingCart", shoppingCartService.findByEmail(user.getEmail()));
    }
}
