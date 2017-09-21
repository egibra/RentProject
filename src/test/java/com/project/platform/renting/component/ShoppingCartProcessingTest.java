package com.project.platform.renting.component;

import com.project.platform.renting.core.model.ShoppingCart;
import com.project.platform.renting.core.model.User;
import com.project.platform.renting.core.service.ProductService;
import com.project.platform.renting.core.service.ShoppingCartService;
import com.project.platform.renting.core.service.UserService;
import com.project.platform.renting.dao.DaoTest;
import com.project.platform.renting.web.component.ShoppingCartProcessing;
import org.junit.Before;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpSession;
import org.springframework.test.context.jdbc.Sql;

import java.util.List;

import static org.junit.Assert.assertEquals;

@Sql(executionPhase = Sql.ExecutionPhase.BEFORE_TEST_METHOD, scripts = {"classpath:db/users.sql",
        "classpath:db/categories.sql", "classpath:db/products.sql",
        "classpath:db/shoppingCarts.sql"})
public class ShoppingCartProcessingTest extends DaoTest {

    @Autowired
    private MockHttpSession session;

    @Autowired
    private UserService userService;

    @Autowired
    private ProductService productService;

    @Autowired
    private ShoppingCartService shoppingCartService;

    private ShoppingCartProcessing shoppingCartProcessing;

    @Before
    public void setUp(){
        shoppingCartProcessing = new ShoppingCartProcessing(productService, shoppingCartService);
    }

    @Test
    public void testAddToCart_NoUser_NewItem() throws Exception{
        shoppingCartProcessing.addToCart(null, session, "2");

        List<ShoppingCart> cart = (List<ShoppingCart>) session.getAttribute("shoppingCart");

        assertEquals("Didn't add new item to cart", 1, cart.size());
        assertEquals("Didn't add correct item.", 2, cart.get(0).getProduct().getId());
    }

    @Test
    public void testAddToCart_WithUser_NewItem() throws Exception {
        User user = userService.getUserByEmail("test@test.com");

        // user has 1 item in cart
        assertEquals("Didn't get all user's items in cart.", 1, shoppingCartService.findByEmail("test@test.com").size());

        shoppingCartProcessing.addToCart(user, session, "2");

        List<ShoppingCart> cart = (List<ShoppingCart>) session.getAttribute("shoppingCart");

        // 1 already exists, so we check second if it was saved in session variable
        assertEquals("Didn't add new item to cart", 2, cart.size());
        assertEquals("Didn't add correct item.", 2, cart.get(1).getProduct().getId());
        assertEquals("Didn't add correct user.", "test@test.com", cart.get(1).getUser().getEmail());

        // see if it was saved in database
        assertEquals("Didn't get all user's items in cart after insertion.", 2, shoppingCartService.findByEmail("test@test.com").size());
    }

    @Test
    public void testAddToCart_NoUser_DuplicateItem() throws Exception{
        shoppingCartProcessing.addToCart(null, session, "2");

        List<ShoppingCart> cart = (List<ShoppingCart>) session.getAttribute("shoppingCart");

        // first insertion
        assertEquals("Didn't add correct item for duplicate test.", 2, cart.get(0).getProduct().getId());
        assertEquals("Didn't change quantity for duplicate test.", 1, cart.get(0).getQuantity());

        shoppingCartProcessing.addToCart(null, session, "2");

        // second insertion
        assertEquals("Didn't add correct item for duplicate test after second.", 2, cart.get(0).getProduct().getId());
        assertEquals("Didn't change quantity for duplicate test after second.", 2, cart.get(0).getQuantity());
    }

    @Test
    public void testAddToCart_WithUser_DuplicateItem() throws Exception{
        User user = userService.getUserByEmail("test@test.com");

        shoppingCartProcessing.addToCart(user, session, "2");

        List<ShoppingCart> cart = (List<ShoppingCart>) session.getAttribute("shoppingCart");

        // first insertion
        assertEquals("Didn't add correct item for duplicate test.", 2, cart.get(1).getProduct().getId());
        assertEquals("Didn't change quantity for duplicate test.", 1, cart.get(1).getQuantity());

        shoppingCartProcessing.addToCart(user, session, "2");

        // second insertion
        assertEquals("Didn't add correct item for duplicate test after second.", 2, cart.get(1).getProduct().getId());
        assertEquals("Didn't change quantity for duplicate test after second.", 2, cart.get(1).getQuantity());

        // and in database
        assertEquals("Didn't update quantity in database.", 2,
                shoppingCartService.findByEmailAndProductId("test@test.com", 2).getQuantity());
    }

    @Test(expected = NumberFormatException.class)
    public void testAddToCart_WrongIdString() throws Exception{
        shoppingCartProcessing.addToCart(null, session, "number");
    }

    @Test(expected = NumberFormatException.class)
    public void testUpdateCart_WrongIdString() throws Exception{
        shoppingCartProcessing.updateCart(null, session, "number+999");
    }

    @Test
    public void testUpdateCart_WrongNewQuantity() throws Exception{
        assertEquals(-1, shoppingCartProcessing.updateCart(null, session, "1+011"));
        assertEquals(-1, shoppingCartProcessing.updateCart(null, session, "1+number"));
        assertEquals(-1, shoppingCartProcessing.updateCart(null, session, "1+1000"));
    }

    @Test(expected = NumberFormatException.class)
    public void testDeleteFromCart_WrongIdString() throws Exception{
        shoppingCartProcessing.addToCart(null, session, "number");
    }

    @Test
    public void testUpdateCart_NoUser() throws Exception{
        shoppingCartProcessing.addToCart(null, session, "2");
        shoppingCartProcessing.updateCart(null, session, "2+15");

        List<ShoppingCart> cart = (List<ShoppingCart>) session.getAttribute("shoppingCart");

        assertEquals("Didn't update correct item.", 2, cart.get(0).getProduct().getId());
        assertEquals("Didn't change quantity.", 15, cart.get(0).getQuantity());
    }

    @Test
    public void testUpdateCart_WithUser() throws Exception{
        User user = userService.getUserByEmail("test@test.com");

        shoppingCartProcessing.updateCart(user, session, "1+999");

        List<ShoppingCart> cart = (List<ShoppingCart>) session.getAttribute("shoppingCart");

        // session variable
        assertEquals("Didn't update correct item.", 1, cart.get(0).getProduct().getId());
        assertEquals("Didn't change quantity.", 999, cart.get(0).getQuantity());

        // database
        assertEquals("Didn't update quantity in database.", 999,
                shoppingCartService.findByEmailAndProductId("test@test.com", 1).getQuantity());
    }

    @Test
    public void testDeleteItemInCart_NoUser() throws Exception{
        shoppingCartProcessing.addToCart(null, session, "2");
        shoppingCartProcessing.deleteFromCart(null, session, "2");

        List<ShoppingCart> cart = (List<ShoppingCart>) session.getAttribute("shoppingCart");

        assertEquals("Didn't delete item.", 0, cart.size());
    }

    @Test
    public void testDeleteItemInCart_WithUser() throws Exception{
        User user = userService.getUserByEmail("test@test.com");
        shoppingCartProcessing.deleteFromCart(user, session, "1");

        List<ShoppingCart> cart = (List<ShoppingCart>) session.getAttribute("shoppingCart");

        // session
        assertEquals("Didn't delete item.", 0, cart.size());

        // database
        assertEquals("Didn't delete item in database.", null, shoppingCartService.findByEmailAndProductId("test@test.com", 1));
    }
}
