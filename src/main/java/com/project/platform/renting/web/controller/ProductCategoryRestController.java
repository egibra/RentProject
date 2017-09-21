package com.project.platform.renting.web.controller;

import com.project.platform.renting.core.model.ProductCategory;
import com.project.platform.renting.core.service.GenericCrudService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("crud/category")
public class ProductCategoryRestController extends AdminRestController<ProductCategory> {

    private static final String INTEGRITY_VIOLATION_ERROR_MESSAGE = "Negalima ištinti, nes yra šiai kategorijai yra priskirtų daiktų.";

    @Autowired
    public ProductCategoryRestController(GenericCrudService<ProductCategory> service) {
        super(INTEGRITY_VIOLATION_ERROR_MESSAGE, service);
    }
}
