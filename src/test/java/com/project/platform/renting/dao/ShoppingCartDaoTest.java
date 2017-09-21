package com.project.platform.renting.dao;

import com.project.platform.renting.core.model.Product;
import com.project.platform.renting.core.model.ShoppingCart;
import com.project.platform.renting.core.model.User;
import com.project.platform.renting.core.repository.ProductRepository;
import com.project.platform.renting.core.repository.ShoppingCartRepository;
import com.project.platform.renting.core.repository.UserRepository;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.jdbc.Sql;

import java.util.List;

import static org.junit.Assert.*;

@Sql(executionPhase = Sql.ExecutionPhase.BEFORE_TEST_METHOD, scripts = {"classpath:db/users.sql",
        "classpath:db/categories.sql", "classpath:db/products.sql",
        "classpath:db/shoppingCarts.sql"})
public class ShoppingCartDaoTest extends DaoTest {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private ShoppingCartRepository shoppingCartRepository;


    @Test
    public void testLoadShoppingCartByEmail_UserExists() {
        List<ShoppingCart> cart = shoppingCartRepository.findByUserEmail("test@test.com");
        assertEquals("Didn't get all products in cart.", 1, cart.size());
    }

    @Test
    public void testLoadShoppingCartByEmail_UserDoesNotExist() {
        List<ShoppingCart> cart = shoppingCartRepository.findByUserEmail("dont exist");
        assertEquals("Got cart of non existent user.", 0, cart.size());
    }

    @Test
    public void testLoadShoppingCartByEmailAndProductsId_UserExists(){
        ShoppingCart productByUser = shoppingCartRepository.findByUserEmailAndProductId("test@test.com", 1);
        assertEquals("Didn't get cart by user and product.", 1, productByUser.getProduct().getId());
        assertEquals("Didn't get cart by user and product.", "test@test.com", productByUser.getUser().getEmail());
        assertEquals("Didn't get cart by user and product.", "Tea Spoon", productByUser.getProduct().getName());
    }

    @Test
    public void testLoadShoppingCartByEmailAndProductsId_UserDoesNotExists(){
        ShoppingCart productByUser = shoppingCartRepository.findByUserEmailAndProductId("does not exist", 1);
        assertNull(productByUser);
    }

    @Test
    public void testLoadShoppingCartByEmailAndProductsId_ProductDoesNotExist(){
        ShoppingCart productByUser = shoppingCartRepository.findByUserEmailAndProductId("test@test.com", 2);
        assertNull(productByUser);
    }

    @Test
    public void testSaveShoppingCart(){
        User user = userRepository.findByEmail("test@test.com");
        Product product = productRepository.findOne(2);

        assertNotNull("User is null.", user);
        assertNotNull("Product is null.", product);

        ShoppingCart shoppingCart = new ShoppingCart(product, user, 12);
        shoppingCartRepository.save(shoppingCart);

        ShoppingCart productInCart = shoppingCartRepository.findByUserEmailAndProductId(user.getEmail(), product.getId());

        assertEquals("Getting all shopping cart.", 2, shoppingCartRepository.findAll().size());
        assertEquals("Saved product id does not match", 2, productInCart.getProduct().getId());
        assertEquals("Saved product quantity does not match", 12, productInCart.getQuantity());
    }

    @Test
    public void testUpdateShoppingCart(){
        ShoppingCart productInCart = shoppingCartRepository.findByUserEmailAndProductId("test@test.com", 1);

        productInCart.setProduct(productRepository.findOne(2));

        shoppingCartRepository.save(productInCart);

        assertEquals("Getting all shopping cart.", 1, shoppingCartRepository.findAll().size());
        assertEquals("Updated product id does not match", 2, productInCart.getProduct().getId());
        assertEquals("Updated product quantity does not match", 1, productInCart.getQuantity());
        assertEquals("Updated product user does not match", "test@test.com", productInCart.getUser().getEmail());
    }

    @Test
    public void testDeleteShoppingCart(){
        ShoppingCart productInCart = shoppingCartRepository.findByUserEmailAndProductId("test@test.com", 1);

        assertEquals("Getting all shopping cart before deletion.", 1, shoppingCartRepository.findAll().size());

        shoppingCartRepository.delete(productInCart.getId());

        assertEquals("Getting all shopping cart after deletion.", 0, shoppingCartRepository.findAll().size());
    }


}