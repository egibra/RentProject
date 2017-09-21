package com.project.platform.renting.web.controller;

import com.project.platform.renting.core.model.ShoppingCart;
import com.project.platform.renting.core.model.User;
import com.project.platform.renting.core.service.ProductService;
import com.project.platform.renting.core.service.SecurityService;
import com.project.platform.renting.core.service.ShoppingCartService;
import com.project.platform.renting.web.component.ShoppingCartProcessing;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.List;

@Controller
public class ShoppingCartController {
    private SecurityService securityService;

    private ShoppingCartProcessing shoppingCartProcessing;

    @Autowired
    public ShoppingCartController(SecurityService securityService, ShoppingCartProcessing shoppingCartProcessing) {
        this.securityService = securityService;
        this.shoppingCartProcessing = shoppingCartProcessing;
    }

    @RequestMapping(value = "/shopping-cart", method = RequestMethod.GET)
    public String showShoppingCart(){
        return "shopping-cart";
    }


    @RequestMapping(value = {"/cart-add", "{type}/cart-add"}, method = RequestMethod.POST,  consumes = MediaType.TEXT_PLAIN_VALUE)
    public ResponseEntity addToCart(@RequestBody String id, HttpSession session){
        try {
            User user = securityService.findLoggedInUser();
            shoppingCartProcessing.addToCart(user, session, id);

            return new ResponseEntity(HttpStatus.OK);
        }
        catch (Exception e){
            return new ResponseEntity(HttpStatus.BAD_REQUEST);
        }
    }


    @RequestMapping(value = {"/cart-remove-item"}, method = RequestMethod.POST,  consumes = MediaType.TEXT_PLAIN_VALUE)
    public ResponseEntity deleteFromCart(@RequestBody String id, HttpSession session) {
        try {
            User user = securityService.findLoggedInUser();

            int totalQuantity = shoppingCartProcessing.deleteFromCart(user, session, id);

            return new ResponseEntity(totalQuantity, HttpStatus.OK);
        }
        catch (Exception e){
            return new ResponseEntity(HttpStatus.BAD_REQUEST);
        }

    }

    @RequestMapping(value = {"/cart-update-item"}, method = RequestMethod.POST,  consumes = MediaType.TEXT_PLAIN_VALUE)
    public ResponseEntity updateCartItem(@RequestBody String idAndQuant, HttpSession session) {
        try {
            User user = securityService.findLoggedInUser();

            int totalQuantity = shoppingCartProcessing.updateCart(user, session, idAndQuant);

            if (totalQuantity == -1)
                throw new Exception();

            return new ResponseEntity(totalQuantity, HttpStatus.OK);
        }
        catch (Exception e){
            return new ResponseEntity(HttpStatus.BAD_REQUEST);
        }
    }

    @RequestMapping(value = {"/cart-total-price"}, method = RequestMethod.GET,
            produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity getTotalPriceByRentalPeriod(@RequestParam String dateFrom, @RequestParam String dateTo, HttpSession session){
        LocalDate rentDateFrom = LocalDate.parse(dateFrom);
        LocalDate rentDateTo = LocalDate.parse(dateTo);
        if(rentDateFrom.isAfter(rentDateTo)){
            return new ResponseEntity<>("Illegal rental period", HttpStatus.BAD_REQUEST);
        }
        BigDecimal totalPrice = shoppingCartProcessing.getTotalPrice(rentDateFrom, rentDateTo, session);
        return new ResponseEntity<>(totalPrice, HttpStatus.OK);
    }

}
