package com.project.platform.renting.core.repository;

import com.project.platform.renting.core.model.Order;
import com.project.platform.renting.core.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.time.LocalDate;
import java.util.List;

public interface OrderRepository extends JpaRepository<Order, Integer> {

    List<Order> findAllByUserAndReturnDateIsBefore(User user, LocalDate returnDate);
    List<Order> findAllByUserAndReturnDateIsGreaterThanEqual(User user, LocalDate returnDate);
}
