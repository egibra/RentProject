package com.project.platform.renting.web.controller;

import com.project.platform.renting.config.TestConfiguration;
import com.project.platform.renting.core.config.Application;
import com.project.platform.renting.core.model.ProductCategory;
import com.project.platform.renting.core.service.GenericCrudService;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.http.MediaType;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.security.web.csrf.CsrfToken;
import org.springframework.security.web.csrf.HttpSessionCsrfTokenRepository;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.put;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;


@RunWith(SpringRunner.class)
@SpringBootTest(classes = {Application.class, TestConfiguration.class})
public class ProductCategoryRestControllerTest {

    private CsrfToken csrfToken;

    private MockMvc mockMvc;

    @Autowired
    private AdminRestController<ProductCategory> controller;

    @MockBean
    private GenericCrudService<ProductCategory> productCategoryService;

    @Before
    public void setup() {
        this.csrfToken = new HttpSessionCsrfTokenRepository().generateToken(new MockHttpServletRequest());
        this.mockMvc = MockMvcBuilders.standaloneSetup(controller).build();
    }

    @Test
    public void testSaveCategory() throws Exception {
        String json = "{\"name\": \"Gopro\"}";
        mockMvc.perform(
                post("/crud/category")
                        .content(json)
                        .contentType(MediaType.APPLICATION_JSON_UTF8)
                        .param(csrfToken.getParameterName(), csrfToken.getToken()))
                .andExpect(status().isOk());
    }

    @Test
    public void testSaveCategoryWithBlankName() throws Exception {
        String json = "{\"name\": \"\"}";
        mockMvc.perform(
                post("/crud/category")
                        .content(json)
                        .contentType(MediaType.APPLICATION_JSON_UTF8)
                        .param(csrfToken.getParameterName(), csrfToken.getToken()))
                .andExpect(status().isBadRequest());
    }

    @Test
    public void testUpdateNonExistantCategory() throws Exception {
        when(productCategoryService.getById(1)).thenReturn(null);
        String json = "{\"name\": \"Gopro\"}";
        mockMvc.perform(
                put("/crud/category/1")
                        .content(json)
                        .contentType(MediaType.APPLICATION_JSON_UTF8)
                        .param(csrfToken.getParameterName(), csrfToken.getToken()))
                .andExpect(status().isBadRequest());
    }

    @Test
    public void testUpdateCategory() throws Exception {
        ProductCategory category = new ProductCategory();
        category.setId(1);
        category.setName("Gopro");
        when(productCategoryService.getById(1)).thenReturn(category);
        String json = "{\"name\": \"Gopro\"}";
        mockMvc.perform(
                put("/crud/category/1")
                        .content(json)
                        .contentType(MediaType.APPLICATION_JSON_UTF8)
                        .param(csrfToken.getParameterName(), csrfToken.getToken()))
                .andExpect(status().isOk());
    }

}