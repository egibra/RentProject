package com.project.platform.renting.core.repository;

import com.project.platform.renting.core.model.OrderState;
import org.springframework.data.jpa.repository.JpaRepository;

public interface OrderStateRepository extends JpaRepository<OrderState, Integer> {

}
