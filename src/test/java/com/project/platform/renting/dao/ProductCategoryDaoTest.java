package com.project.platform.renting.dao;

import com.project.platform.renting.core.repository.ProductCategoryRepository;
import com.project.platform.renting.core.model.ProductCategory;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.test.context.jdbc.Sql;

import static org.junit.Assert.assertEquals;

@Sql(executionPhase = Sql.ExecutionPhase.BEFORE_TEST_METHOD,
        scripts = {"classpath:db/categories.sql", "classpath:db/attributes.sql", "classpath:db/products.sql"})
public class ProductCategoryDaoTest extends DaoTest {

    @Autowired
    private ProductCategoryRepository productCategoryRepository;

    @Test
    public void testFindAll() {
        assertEquals(4, productCategoryRepository.findAll().size());
    }

    @Test
    public void testCategoryAttributesLoading() {
        ProductCategory category = productCategoryRepository.findOne(1);
        assertEquals(3, category.getAttributes().size());
    }

    @Test
    public void testInsert() {
        productCategoryRepository.save(new ProductCategory(9, "Aaaa"));
        assertEquals(5, productCategoryRepository.findAll().size());
    }

    @Test
    public void testUpdateName() {
        String name = "Qwe";
        productCategoryRepository.updateName(1, name);
        assertEquals(name, productCategoryRepository.findOne(1).getName());
    }

    @Test
    public void testUpdateNonExistingCategoryName() {
        String name = "Qwe";
        productCategoryRepository.updateName(99, name);
        assertEquals(4, productCategoryRepository.findAll().size());
    }

    @Test
    public void testDelete() {
        productCategoryRepository.delete(3);
        assertEquals(3, productCategoryRepository.findAll().size());
    }

    @Test(expected = DataIntegrityViolationException.class)
    public void testDeleteCategoryWithProducts() {
        productCategoryRepository.delete(1);
        assertEquals(4, productCategoryRepository.findAll().size());
    }
}