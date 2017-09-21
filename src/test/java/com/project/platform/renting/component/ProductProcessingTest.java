package com.project.platform.renting.component;

import com.project.platform.renting.config.TestConfiguration;
import com.project.platform.renting.core.config.Application;
import com.project.platform.renting.core.model.Product;
import com.project.platform.renting.core.model.User;
import com.project.platform.renting.web.component.CustomValidation;
import com.project.platform.renting.web.component.ProductProcessing;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import static org.junit.Assert.*;

@RunWith(SpringRunner.class)
@SpringBootTest(classes = {Application.class, TestConfiguration.class})
public class ProductProcessingTest {

    private ProductProcessing productProcessing;
/*
    @Before
    public void setUp(){
        productProcessing = new ProductProcessing();

        List<Product> products = new ArrayList<>();
        Product product1 = new Product();
        product1.setName("firstProduct");
        product1.setRentedOverall(10);
        product1.setPricePerDay(11);
        product1.setDiscount(0.0);
        product1.setDateOut(LocalDate.of(2014, 10, 1));

        Product product2 = new Product();
        product2.setName("secondProduct");
        product2.setRentedOverall(6);
        product2.setPricePerDay(4.5);
        product2.setDiscount(0.0);
        product2.setDateOut(LocalDate.of(2016, 10, 1));

        Product product3 = new Product();
        product3.setName("thirdProduct");
        product3.setRentedOverall(5);
        product3.setPricePerDay(6);
        product3.setDiscount(0.0);
        product3.setDateOut(LocalDate.of(2013, 10, 1));

        products.add(product1);
        products.add(product2);
        products.add(product3);

        productProcessing.setProducts(products);
    }

    @Test
    public void testSortingByPopularity_RentedOverall(){
        productProcessing.sortProducts("defaultShouldBePopularity");

        assertEquals("Most Rented", 10, productProcessing.getProducts().get(0).getRentedOverall());
        assertEquals("Second Most Rented", 6, productProcessing.getProducts().get(1).getRentedOverall());
        assertEquals("Least Rented", 5, productProcessing.getProducts().get(2).getRentedOverall());
    }

    @Test
    public void testSortingByPrice_PricePerDay(){
        productProcessing.sortProducts("price");

        assertEquals("Cheapest", 4.5, productProcessing.getProducts().get(0).getPricePerDay(), 0.1);
        assertEquals("Second cheapest", 6, productProcessing.getProducts().get(1).getPricePerDay(), 0.1);
        assertEquals("Most Expensive", 11, productProcessing.getProducts().get(2).getPricePerDay(), 0.1);
    }

    @Test
    public void testSortingByDateOut_DateOut(){
        productProcessing.sortProducts("recent");

        assertEquals("Most Recent", "secondProduct", productProcessing.getProducts().get(0).getName());
        assertEquals("Second Most Recent", "firstProduct", productProcessing.getProducts().get(1).getName());
        assertEquals("Oldest", "thirdProduct", productProcessing.getProducts().get(2).getName());
    }

    @Test
    public void testGetCategoryNumber(){
        assertEquals("All products", 0, productProcessing.getCategoryNumber("all"));
        assertEquals("GoPro", 1, productProcessing.getCategoryNumber("gopro"));
        assertEquals("Gaming Consoles", 2, productProcessing.getCategoryNumber("gaming-consoles"));
        assertEquals("Cameras", 3, productProcessing.getCategoryNumber("cameras"));
        assertEquals("Drones", 4, productProcessing.getCategoryNumber("drones"));
        assertEquals("Discount", 10, productProcessing.getCategoryNumber("discount"));
        assertEquals("Does not exists", -1, productProcessing.getCategoryNumber("no exist"));
    }

    @Test
    public void testSearch_ExistsZero(){
        productProcessing.processSearch("no exist");
        assertEquals("Found 0 Matching", 0, productProcessing.getProducts().size());
    }

    @Test
    public void testSearch_ExistsOne(){
        productProcessing.processSearch("second");
        assertEquals("Found 1 Matching", 1, productProcessing.getProducts().size());
    }

    @Test
    public void testSearch_ExistsThree(){
        productProcessing.processSearch("Product");
        assertEquals("Found 3 Matching", 3, productProcessing.getProducts().size());
    }

    @Test(expected = NumberFormatException.class)
    public void testCurrentPage_InputNotInt_ShouldGiveOne(){
        productProcessing.setCurrentPage(Optional.of("bad input"));
        assertEquals("Bad Input (String)", 1, productProcessing.getCurrentPage());

        productProcessing.setCurrentPage(Optional.of("3.5"));
        assertEquals("Bad Input (Double)", 1, productProcessing.getCurrentPage());
    }

    @Test
    public void testCurrentPage_NoInput(){
        productProcessing.setCurrentPage(Optional.empty());
        assertEquals("No Input For Current Page", 1, productProcessing.getCurrentPage());
    }

    @Test
    public void testCurrentPage_CorrectInput(){
        productProcessing.setCurrentPage(Optional.of("15"));
        assertEquals("Correct Input Given Current Page", 15, productProcessing.getCurrentPage());
    }

    @Test(expected = NumberFormatException.class)
    public void testSetProductsPerPage_InputNotInt_ShouldNotChange(){
        int productsPerPage = productProcessing.getProductsPerPage();

        productProcessing.setProductsPerPage("bad input");
        assertEquals("Bad Input (String)", productsPerPage, productProcessing.getProductsPerPage());

        productProcessing.setProductsPerPage("3.5");
        assertEquals("Bad Input (Double)", productsPerPage, productProcessing.getProductsPerPage());
    }

    @Test(expected = NumberFormatException.class)
    public void testSetProductsPerPage_NoInput(){
        int productsPerPage = productProcessing.getProductsPerPage();

        productProcessing.setProductsPerPage("");
        assertEquals("No Input For Products Per Page", productsPerPage, productProcessing.getProductsPerPage());
    }

    @Test
    public void testSetProductsPerPage_CorrectInput(){
        productProcessing.setProductsPerPage("33");
        assertEquals("Correct Input Given Products Per Page", 33, productProcessing.getProductsPerPage());
    }
*/
}
