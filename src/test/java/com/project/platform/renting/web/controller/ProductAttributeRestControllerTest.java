package com.project.platform.renting.web.controller;

import com.project.platform.renting.config.TestConfiguration;
import com.project.platform.renting.core.config.Application;
import com.project.platform.renting.core.model.ProductAttribute;
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
public class ProductAttributeRestControllerTest {

    private CsrfToken csrfToken;

    private MockMvc mockMvc;

    @Autowired
    private AdminRestController<ProductAttribute> controller;

    @MockBean
    private GenericCrudService<ProductAttribute> productAttributeService;

    @Before
    public void setup() {
        this.csrfToken = new HttpSessionCsrfTokenRepository().generateToken(new MockHttpServletRequest());
        this.mockMvc = MockMvcBuilders.standaloneSetup(controller).build();
    }

    @Test
    public void testSaveAttribute() throws Exception {
        String json = "{\"name\": \"Svoris\", \"category\": \"1\"}";
        mockMvc.perform(
                post("/crud/attribute")
                        .content(json)
                        .contentType(MediaType.APPLICATION_JSON_UTF8)
                        .param(csrfToken.getParameterName(), csrfToken.getToken()))
                .andExpect(status().isOk());
    }

    @Test
    public void testSaveAttributeWithoutCategory() throws Exception {
        String json = "{\"name\": \"Svoris\"}";
        mockMvc.perform(
                post("/crud/attribute")
                        .content(json)
                        .contentType(MediaType.APPLICATION_JSON_UTF8)
                        .param(csrfToken.getParameterName(), csrfToken.getToken()))
                .andExpect(status().isBadRequest());
    }

    @Test
    public void testUpdateNonExistantAttribute() throws Exception {
        when(productAttributeService.getById(1)).thenReturn(null);
        String json = "{\"name\": \"Svoris\", \"category\": \"1\"}";
        mockMvc.perform(
                put("/crud/attribute/1")
                        .content(json)
                        .contentType(MediaType.APPLICATION_JSON_UTF8)
                        .param(csrfToken.getParameterName(), csrfToken.getToken()))
                .andExpect(status().isBadRequest());
    }

    @Test
    public void testUpdateAttribute() throws Exception {
        ProductAttribute attribute = new ProductAttribute();
        attribute.setId(1);
        attribute.setCategory(1);
        attribute.setName("Aukstis");
        when(productAttributeService.getById(1)).thenReturn(attribute);
        String json = "{\"name\": \"Svoris\", \"category\": \"1\"}";
        mockMvc.perform(
                put("/crud/attribute/1")
                        .content(json)
                        .contentType(MediaType.APPLICATION_JSON_UTF8)
                        .param(csrfToken.getParameterName(), csrfToken.getToken()))
                .andExpect(status().isOk());
    }

}