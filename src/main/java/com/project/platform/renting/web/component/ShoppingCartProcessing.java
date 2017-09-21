package com.project.platform.renting.web.component;

import com.project.platform.renting.core.model.ShoppingCart;
import com.project.platform.renting.core.model.User;
import com.project.platform.renting.core.service.ProductService;
import com.project.platform.renting.core.service.ShoppingCartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.math.MathContext;
import java.math.RoundingMode;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.List;

@Component
public class ShoppingCartProcessing {

    private ProductService productService;
    private ShoppingCartService shoppingCartService;

    @Autowired
    public ShoppingCartProcessing(ProductService productService, ShoppingCartService shoppingCartService) {
        this.productService = productService;
        this.shoppingCartService = shoppingCartService;
    }

    public void addToCart(User user, HttpSession session, String id) throws Exception{

        int idInt = Integer.parseInt(id);
        List<ShoppingCart> cart = (List<ShoppingCart>) session.getAttribute("shoppingCart");

        if(user != null){
            ShoppingCart c = shoppingCartService.findByEmailAndProductId(user.getEmail(), idInt);

            if (c != null){
                c.setQuantity(c.getQuantity() + 1);
                shoppingCartService.save(c);
            }
            else {
                ShoppingCart newOrder = new ShoppingCart(productService.getById(idInt), user, 1);
                shoppingCartService.save(newOrder);

            }
            session.setAttribute("shoppingCart", shoppingCartService.findByEmail(user.getEmail()));
        }
        else {

            if (cart == null) {
                cart = new ArrayList<>();
            }

            boolean duplicate = false;
            for (ShoppingCart c : cart) {
                if (c.getProduct().getId() == idInt) {
                    c.setQuantity(c.getQuantity() + 1);
                    duplicate = true;
                    break;
                }
            }
            if (!duplicate) {
                ShoppingCart newOrder = new ShoppingCart(productService.getById(idInt), null, 1);
                cart.add(newOrder);
            }

            session.setAttribute("shoppingCart", cart);
        }
    }

    public int deleteFromCart(User user, HttpSession session, String id) throws Exception{
        int idInt = Integer.parseInt(id);
        List<ShoppingCart> cart = (List<ShoppingCart>) session.getAttribute("shoppingCart");

        if (user != null) {
            shoppingCartService.delete(shoppingCartService.findByEmailAndProductId(user.getEmail(), idInt).getId());
            cart = shoppingCartService.findByEmail(user.getEmail());
        }
        else {
            for (int i = 0; i < cart.size(); i++) {
                if (cart.get(i).getProduct().getId() == idInt) {
                    cart.remove(i);
                    break;
                }
            }
        }

        session.setAttribute("shoppingCart", cart);

        return countTotalQuantity(cart);
    }

    public int updateCart(User user, HttpSession session, String idAndQuant) throws Exception{
        List<ShoppingCart> cart = (List<ShoppingCart>) session.getAttribute("shoppingCart");

        String[] idAndQ = idAndQuant.split("[+]");
        int id = Integer.parseInt(idAndQ[0]);

        if (!idAndQ[1].matches("^[1-9]\\d*$") || idAndQ[1].length() > 3)
            return -1;

        int quantity = Integer.parseInt(idAndQ[1]);

        if (user != null){
            ShoppingCart c = shoppingCartService.findByEmailAndProductId(user.getEmail(), id);
            c.setQuantity(quantity);
            shoppingCartService.update(c);
            cart = shoppingCartService.findByEmail(user.getEmail());
        }
        else {
            for (ShoppingCart c : cart) {
                if (c.getProduct().getId() == id) {
                    c.setQuantity(quantity);
                    break;
                }
            }
        }

        session.setAttribute("shoppingCart", cart);

        return countTotalQuantity(cart);
    }


    private int countTotalQuantity(List<ShoppingCart> cart){
        int n = 0;

        for (ShoppingCart c : cart){
            n += c.getQuantity();
        }

        return n;
    }

    public BigDecimal getTotalPrice(LocalDate dateFrom, LocalDate dateTo, HttpSession session) {
        BigDecimal totalPrice = new BigDecimal(0);
        BigDecimal rentalDaysCount = new BigDecimal(ChronoUnit.DAYS.between(dateFrom, dateTo)+ 1);
        List<ShoppingCart> cartProducts = (List<ShoppingCart>) session.getAttribute("shoppingCart");
        if(cartProducts == null || cartProducts.size() == 0){
            return totalPrice;
        }
        for(ShoppingCart cartProduct : cartProducts){
            BigDecimal productPrice = cartProduct.getProduct().getPriceWithDiscount();
            BigDecimal productQuantity = new BigDecimal(cartProduct.getQuantity());
            totalPrice = totalPrice.add(productPrice.multiply(rentalDaysCount).multiply(productQuantity));
        }
        return totalPrice.setScale(2, RoundingMode.HALF_DOWN);
    }

    public void loadShoppingCart(HttpSession session, User user){
        List<ShoppingCart> cart = (List<ShoppingCart>) session.getAttribute("shoppingCart");

        if (cart == null) {
            cart = shoppingCartService.findByEmail(user.getEmail());
        }
        else {

            List<ShoppingCart> mergedCart = shoppingCartService.findByEmail(user.getEmail());
            for (ShoppingCart c : cart){

                boolean duplicate = false;
                for (ShoppingCart c2 : mergedCart){
                    if (c.getProduct().getId() == c2.getProduct().getId()){
                        c2.setQuantity(c2.getQuantity() + 1);
                        duplicate = true;
                        break;
                    }
                }
                if(!duplicate){
                    c.setUser(user);
                    mergedCart.add(c);
                }
            }
            cart = mergedCart;
            shoppingCartService.saveShoppingList(cart);
        }
        session.setAttribute("shoppingCart", cart);
    }

}
