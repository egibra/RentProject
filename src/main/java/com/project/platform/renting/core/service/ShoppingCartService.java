package com.project.platform.renting.core.service;


import com.project.platform.renting.core.model.ShoppingCart;
import com.project.platform.renting.core.model.User;

import java.util.List;

public interface ShoppingCartService extends GenericCrudService<ShoppingCart> {
    List<ShoppingCart> findByEmail(String email);
    void saveShoppingList(List<ShoppingCart> shoppingCart);
    ShoppingCart findByEmailAndProductId(String email, int id);
    void delete(User user);
}
