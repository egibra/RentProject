package com.project.platform.renting.core.repository;

import com.project.platform.renting.core.model.OrderLine;
import com.project.platform.renting.core.model.OrderUserDetails;
import org.springframework.data.jpa.repository.JpaRepository;

public interface OrderUserDetailsRepository extends JpaRepository<OrderUserDetails, Integer> {

}
