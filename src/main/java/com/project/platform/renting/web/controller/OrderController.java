package com.project.platform.renting.web.controller;

import com.project.platform.renting.core.model.*;
import com.project.platform.renting.core.service.*;
import com.project.platform.renting.web.component.ShoppingCartProcessing;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;

@Controller
public class OrderController {

    private SecurityService securityService;

    private ShoppingCartProcessing shoppingCartProcessing;

    private ShoppingCartService shoppingCartService;

    private OrderService orderService;

    private OrderLineService orderLineService;

    private OrderUserDetailsService orderUserDetailsService;

    private EmailNotificationService emailNotificationService;

    @Autowired
    public OrderController(SecurityService securityService,ShoppingCartProcessing shoppingCartProcessing,
                           ShoppingCartService shoppingCartService,
                           OrderService orderService, OrderLineService orderLineService,
                           OrderUserDetailsService orderUserDetailsService, EmailNotificationService emailNotificationService) {
        this.securityService = securityService;
        this.shoppingCartProcessing = shoppingCartProcessing;
        this.shoppingCartService = shoppingCartService;
        this.orderService = orderService;
        this.orderLineService = orderLineService;
        this.orderUserDetailsService = orderUserDetailsService;
        this.emailNotificationService = emailNotificationService;
    }

    @RequestMapping(value = "/order", method = RequestMethod.POST, consumes = MediaType.APPLICATION_FORM_URLENCODED_VALUE)
    public String submitOrder(String rentalPeriod, Order order, OrderUserDetails orderUserDetails, HttpSession session){
        LocalDate startDate = LocalDate.parse(rentalPeriod.substring(0, 10));
        LocalDate endDate = LocalDate.parse(rentalPeriod.substring(13));
        order.setStartDate(startDate);
        order.setReturnDate(endDate);
        BigDecimal totalPrice = shoppingCartProcessing.getTotalPrice(startDate, endDate, session);
        order.setTotalPrice(totalPrice);
        OrderState orderState = new OrderState();
        orderState.setId(1);
        order.setState(orderState);

        User user = securityService.findLoggedInUser();
        if(user != null){
            order.setUser(user);
        }
        orderService.save(order);
        if(user == null){
            orderUserDetails.setOrder(order);
            orderUserDetailsService.save(orderUserDetails);
        }

        List<ShoppingCart> cartProducts = (List<ShoppingCart>) session.getAttribute("shoppingCart");
        for(ShoppingCart product : cartProducts){
            OrderLine orderLine = new OrderLine();
            orderLine.setOrder(order);
            orderLine.setProduct(product.getProduct());
            orderLine.setQuantity(product.getQuantity());
            orderLineService.save(orderLine);
        }

        session.setAttribute("shoppingCart", null);  // clear cart?
        if(user != null) {
            shoppingCartService.delete(user);
        }

        try {
            if(user == null){
                user = new User();
                user.setEmail(orderUserDetails.getEmail());
            }
            emailNotificationService.sendOrderConfirmation(user);
        }
        catch(Exception ex){} // lol
        return "redirect:order-confirmation";
    }

    @RequestMapping(value = "/order-confirmation")
    public String showOrderConfirmationPage() {
        return "order-confirmation";
    }
}
