package com.project.platform.renting.core.service;


import com.project.platform.renting.core.model.Product;

import java.util.List;

public interface ProductService extends GenericCrudService<Product>{

    List<Product> getAllProductsByCategoryId(int category);
    List<Product> getAllProductsByName(String name);
    void setMainPicture(Integer productId, Integer pictureId);
}
