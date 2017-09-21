package com.project.platform.renting.core.repository;

import com.project.platform.renting.core.model.User;
import com.project.platform.renting.core.model.VerificationToken;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import javax.transaction.Transactional;


public interface VerificationTokenRepository extends JpaRepository<VerificationToken, Integer>{

    VerificationToken findByToken(String token);

    @Modifying
    @Transactional
    @Query(value = "DELETE FROM aktyvavimo_kodai WHERE fk_vartotojas = ?1")
    void deleteVerification(User user);
}
