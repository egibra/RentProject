package com.project.platform.renting.core.service.impl;


import com.project.platform.renting.core.model.Picture;
import com.project.platform.renting.core.repository.ProductRepository;
import com.project.platform.renting.core.model.Product;
import com.project.platform.renting.core.service.GenericCrudServiceImpl;
import com.project.platform.renting.core.service.PictureService;
import com.project.platform.renting.core.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductServiceImpl extends GenericCrudServiceImpl<Product, ProductRepository> implements ProductService{

    @Autowired
    private PictureService pictureService;

    @Autowired
    public ProductServiceImpl(ProductRepository repository) {
        super(repository);
    }

    @Override
    public List<Product> getAllProductsByName(String name) {
        return repository.findByName(name);
    }

    @Override
    public void setMainPicture(Integer productId, Integer pictureId) {
        if(pictureId != null) {
            //check if picture belongs to product
            Picture picture = pictureService.findById(pictureId);
            Product product = picture.getProduct();
            if (product.getId() != productId) {
                throw new IllegalArgumentException();
            }
        }
        repository.updateMainPicture(productId, pictureId);
    }

    @Override
    public List<Product> getAllProductsByCategoryId(int category) {
        if (category == 0)
            return repository.findAll();

        if (category == 10)
            return repository.getDiscountedItems();

        return repository.findByCategoryId(category);
    }
}
