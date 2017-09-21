package com.project.platform.renting.core.service.impl;

import com.project.platform.renting.core.model.OrderUserDetails;
import com.project.platform.renting.core.repository.OrderUserDetailsRepository;
import com.project.platform.renting.core.service.GenericCrudServiceImpl;
import com.project.platform.renting.core.service.OrderUserDetailsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrderUserDetailsImpl extends GenericCrudServiceImpl<OrderUserDetails, OrderUserDetailsRepository> implements OrderUserDetailsService {

    @Autowired
    public OrderUserDetailsImpl(OrderUserDetailsRepository repository) {
        super(repository);
    }

}
