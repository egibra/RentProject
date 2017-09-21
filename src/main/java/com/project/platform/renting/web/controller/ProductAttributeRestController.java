package com.project.platform.renting.web.controller;

import com.project.platform.renting.core.model.ProductAttribute;
import com.project.platform.renting.core.service.GenericCrudService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("crud/attribute")
public class ProductAttributeRestController extends AdminRestController<ProductAttribute> {

    private static final String INTEGRITY_VIOLATION_ERROR_MESSAGE = "Negalima ištinti, nes yra daiktų su šiuo parametru.";

    @Autowired
    public ProductAttributeRestController(GenericCrudService<ProductAttribute> service) {
        super(INTEGRITY_VIOLATION_ERROR_MESSAGE, service);
    }
}
