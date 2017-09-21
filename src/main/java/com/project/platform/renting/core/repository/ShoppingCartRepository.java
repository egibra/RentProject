package com.project.platform.renting.core.repository;


import com.project.platform.renting.core.model.ShoppingCart;
import com.project.platform.renting.core.model.User;
import org.springframework.data.jpa.repository.JpaRepository;


import java.util.List;

public interface ShoppingCartRepository extends JpaRepository<ShoppingCart, Integer> {

    List<ShoppingCart> findByUserEmail(String email);
    ShoppingCart findByUserEmailAndProductId(String email, int id);
    void deleteByUser(User user);
}
