package com.project.platform.renting.core.repository;

import com.project.platform.renting.core.model.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface ProductRepository extends JpaRepository<Product, Integer> {

    List<Product> findByCategoryId(int category);
    List<Product> findByName(String name);

    @Modifying
    @Transactional
    @Query(value = "UPDATE daiktas SET pagrindine_nuotrauka= ?2 WHERE id = ?1")
    void updateMainPicture(Integer productId, Integer pictureId);


    @Query(value = "SELECT * FROM daiktas WHERE nuolaida_proc > 0", nativeQuery = true)
    List<Product> getDiscountedItems();
}
