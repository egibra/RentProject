package com.project.platform.renting.dao;

import com.project.platform.renting.core.repository.ProductRepository;
import com.project.platform.renting.core.model.Product;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.jdbc.Sql;

import java.util.List;

import static org.junit.Assert.assertEquals;

@Sql(executionPhase = Sql.ExecutionPhase.BEFORE_TEST_METHOD, scripts = {"classpath:db/categories.sql", "classpath:db/products.sql"})
public class ProductDaoTest extends DaoTest {

    @Autowired
    private ProductRepository productRepository;


    @Test
    public void testLoadAllProducts() {
        List<Product> products = productRepository.findAll();
        assertEquals("Didn't get all products. ", 2, products.size());
    }

    @Test
    public void testLoadByName() {
        List<Product> products = productRepository.findByName("Tea Spoon");
        assertEquals("Didn't get object by name.", 1, products.size());
    }

    @Test
    public void testLoadById() {
        Product product = productRepository.findOne(2);
        assertEquals("Didn't find by id.", product.getId(), 2);
    }

    @Test
    public void testLoadByCategoryId() {
        List<Product> products = productRepository.findByCategoryId(1);
        assertEquals("Didn't find by type.", 1, products.size());
    }

    @Test
    public void testLoadByNonExistingCategoryId() {
        List<Product> products = productRepository.findByCategoryId(999);
        assertEquals("Didn't find by type.", 0, products.size());
    }

    @Test
    public void testSaveProduct() {
        Product newProduct = new Product();
        newProduct.setId(3);
        newProduct.setName("Saved");
        newProduct.setCode("SAVED");
        newProduct.setCategory(1);
        productRepository.save(newProduct);
        List<Product> products = productRepository.findAll();
        assertEquals("Didn't get all products. ", 3, products.size());
    }

}