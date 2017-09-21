package com.project.platform.renting.web.controller;

import com.project.platform.renting.config.TestConfiguration;
import com.project.platform.renting.core.config.Application;
import com.project.platform.renting.core.model.Product;
import com.project.platform.renting.core.service.GenericCrudService;
import com.project.platform.renting.core.service.ProductService;
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

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.delete;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;


@RunWith(SpringRunner.class)
@SpringBootTest(classes = {Application.class, TestConfiguration.class})
public class ProductRestControllerTest {

    private CsrfToken csrfToken;

    private MockMvc mockMvc;

    @Autowired
    private AdminRestController<Product> controller;

    @MockBean
    private ProductService productAttributeService;

    @Before
    public void setup() {
        this.csrfToken = new HttpSessionCsrfTokenRepository().generateToken(new MockHttpServletRequest());
        this.mockMvc = MockMvcBuilders.standaloneSetup(controller).build();
    }

    @Test
    public void testSaveProductWithoutCategory() throws Exception {
        String json = "{\"name\": \"Svoris\", \"code\": \"1\"}";
        mockMvc.perform(
                post("/crud/product")
                        .content(json)
                        .contentType(MediaType.APPLICATION_JSON_UTF8)
                        .param(csrfToken.getParameterName(), csrfToken.getToken()))
                .andExpect(status().isBadRequest());
    }

    @Test
    public void testSaveProduct() throws Exception {
        String json = "{\"name\": \"Svoris\", \"code\": \"1\", \"category\": \"1\"}";
        mockMvc.perform(
                post("/crud/product")
                        .content(json)
                        .contentType(MediaType.APPLICATION_JSON_UTF8)
                        .param(csrfToken.getParameterName(), csrfToken.getToken()))
                .andExpect(status().isOk());
    }

    @Test
    public void testDeleteProduct() throws Exception {
        mockMvc.perform(
                delete("/crud/product/1")
                        .contentType(MediaType.APPLICATION_JSON_UTF8)
                        .param(csrfToken.getParameterName(), csrfToken.getToken()))
                .andExpect(status().isBadRequest());
    }

}