package com.project.platform.renting.web.controller;

import com.project.platform.renting.core.model.Order;
import com.project.platform.renting.core.model.User;
import com.project.platform.renting.core.service.OrderService;
import com.project.platform.renting.core.service.UserService;
import com.project.platform.renting.core.service.impl.SecurityServiceImpl;
import com.project.platform.renting.web.component.CustomValidation;
import com.project.platform.renting.web.component.UserProfileProcessing;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@Controller
public class UserProfileController {

    private SecurityServiceImpl securityService;

    private UserProfileProcessing userProfileProcessing;

    private OrderService orderService;

    @Autowired
    public UserProfileController(SecurityServiceImpl securityService, UserProfileProcessing userProfileProcessing, OrderService orderService) {
        this.securityService = securityService;
        this.userProfileProcessing = userProfileProcessing;
        this.orderService = orderService;
    }

    @RequestMapping(value = "/user/profile/settings", method = RequestMethod.GET)
    public String showProfileSettings(){
        return "profile-settings";
    }

    @RequestMapping(value = "/user/profile/orders", method = RequestMethod.GET)
    public String showCurrentOrders(Model model){
        User loggedInUser = securityService.findLoggedInUser();
        model.addAttribute("orders", orderService.getCurrentOrdersByUser(loggedInUser));
        return "profile-orders";
    }

    @RequestMapping(value = "/user/profile/history", method = RequestMethod.GET)
    public String showOrdersHistory(Model model){
        User loggedInUser = securityService.findLoggedInUser();
        model.addAttribute("orders", orderService.getPastOrdersByUser(loggedInUser));
        return "profile-history";
    }

    @RequestMapping(value = "/user/profile/settings", method = RequestMethod.POST)
    public String changeProfileSettings(Model model, @ModelAttribute("changedUser") User user,
                                        @ModelAttribute("newPassword") String newPassword,
                                        @ModelAttribute("newPasswordConfirm") String newPasswordConfirm){

        User loggedInUser = securityService.findLoggedInUser();
        user.setEmail(loggedInUser.getEmail());

        if (userProfileProcessing.processProfile(user, loggedInUser, newPassword, newPasswordConfirm, model)){
            return "redirect:/user/profile/settings?success";
        }
        else
            return "profile-settings";
    }



}
