package com.project.platform.renting.core.service.impl;

import com.project.platform.renting.core.repository.ProductCategoryRepository;
import com.project.platform.renting.core.model.ProductCategory;
import com.project.platform.renting.core.service.GenericCrudServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProductCategoryServiceImpl extends GenericCrudServiceImpl<ProductCategory, ProductCategoryRepository> {

    @Autowired
    public ProductCategoryServiceImpl(ProductCategoryRepository repository) {
        super(repository);
    }

    @Override
    public void update(ProductCategory category){
        repository.updateName(category.getId(), category.getName());
    }

}
