package com.project.platform.renting.core.repository;

import com.project.platform.renting.core.model.ProductCategory;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

public interface ProductCategoryRepository extends JpaRepository<ProductCategory, Integer> {

    @Modifying
    @Transactional
    @Query(value = "UPDATE kategorija SET name= ?2 WHERE id = ?1")
    void updateName(int id, String name);
}
