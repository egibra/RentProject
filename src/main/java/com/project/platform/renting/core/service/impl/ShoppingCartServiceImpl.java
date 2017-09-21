package com.project.platform.renting.core.service.impl;

import com.project.platform.renting.core.model.ShoppingCart;
import com.project.platform.renting.core.model.User;
import com.project.platform.renting.core.repository.ShoppingCartRepository;
import com.project.platform.renting.core.service.GenericCrudServiceImpl;
import com.project.platform.renting.core.service.ShoppingCartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class ShoppingCartServiceImpl extends GenericCrudServiceImpl<ShoppingCart, ShoppingCartRepository> implements ShoppingCartService{


    @Autowired
    public ShoppingCartServiceImpl(ShoppingCartRepository repository) {
        super(repository);
    }

    @Override
    public List<ShoppingCart> findByEmail(String email) {
        return repository.findByUserEmail(email);
    }


    @Override
    public void saveShoppingList(List<ShoppingCart> shoppingCart) {
        repository.save(shoppingCart);
    }

    @Override
    public ShoppingCart findByEmailAndProductId(String email, int id) {
        return repository.findByUserEmailAndProductId(email, id);
    }

    @Override
    public void delete(User user) {
        repository.deleteByUser(user);
    }
}
