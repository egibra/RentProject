package com.project.platform.renting.core.repository;

import com.project.platform.renting.core.model.OrderLine;
import org.springframework.data.jpa.repository.JpaRepository;

public interface OrderLineRepository extends JpaRepository<OrderLine, Integer> {

}
