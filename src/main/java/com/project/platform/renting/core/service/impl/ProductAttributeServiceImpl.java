package com.project.platform.renting.core.service.impl;

import com.project.platform.renting.core.model.ProductAttribute;
import com.project.platform.renting.core.repository.ProductAttributeRepository;
import com.project.platform.renting.core.service.GenericCrudServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProductAttributeServiceImpl extends GenericCrudServiceImpl<ProductAttribute, ProductAttributeRepository> {

    @Autowired
    public ProductAttributeServiceImpl(ProductAttributeRepository repository){
        super(repository);
    }

}
