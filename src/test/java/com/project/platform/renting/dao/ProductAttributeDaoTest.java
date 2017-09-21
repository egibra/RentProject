package com.project.platform.renting.dao;

import com.project.platform.renting.core.repository.ProductAttributeRepository;
import com.project.platform.renting.core.model.ProductAttribute;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.test.context.jdbc.Sql;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;

@Sql(executionPhase = Sql.ExecutionPhase.BEFORE_TEST_METHOD,
        scripts = {"classpath:db/categories.sql", "classpath:db/attributes.sql"})
public class ProductAttributeDaoTest extends DaoTest {

    @Autowired
    private ProductAttributeRepository productAttributeRepository;

    @Test
    public void testFindAll() {
        assertEquals(6, productAttributeRepository.findAll().size());
    }

    @Test
    public void testFindById() {
        int id = 1;
        assertEquals(id, productAttributeRepository.findOne(id).getId());
    }

    @Test
    public void testFindByNonExistingId() {
        int id = 999;
        assertNull(productAttributeRepository.findOne(id));
    }

    @Test
    public void testInsert() {
        ProductAttribute attribute = new ProductAttribute();
        attribute.setName("asd");
        attribute.setCategory(1);
        productAttributeRepository.save(attribute);
        assertEquals(7, productAttributeRepository.findAll().size());
    }

    @Test(expected = DataIntegrityViolationException.class)
    public void testInsertWithNonExistingCategory() {
        ProductAttribute attribute = new ProductAttribute();
        attribute.setName("asd");
        attribute.setCategory(9);
        productAttributeRepository.save(attribute);
        assertEquals(6, productAttributeRepository.findAll().size());
    }

    @Test(expected = javax.validation.ConstraintViolationException.class)
    public void testInsertWithoutCategory() {
        ProductAttribute attribute = new ProductAttribute();
        attribute.setName("asd");
        productAttributeRepository.save(attribute);
        assertEquals(6, productAttributeRepository.findAll().size());
    }

    @Test
    public void testDelete() {
        productAttributeRepository.delete(4);
        assertEquals(5, productAttributeRepository.findAll().size());
    }

}