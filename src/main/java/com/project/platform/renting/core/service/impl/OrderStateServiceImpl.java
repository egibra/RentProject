package com.project.platform.renting.core.service.impl;

import com.project.platform.renting.core.model.Order;
import com.project.platform.renting.core.model.OrderState;
import com.project.platform.renting.core.repository.OrderRepository;
import com.project.platform.renting.core.repository.OrderStateRepository;
import com.project.platform.renting.core.service.GenericCrudServiceImpl;
import com.project.platform.renting.core.service.OrderService;
import com.project.platform.renting.core.service.OrderStateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrderStateServiceImpl extends GenericCrudServiceImpl<OrderState, OrderStateRepository> implements OrderStateService {

    @Autowired
    public OrderStateServiceImpl(OrderStateRepository repository) {
        super(repository);
    }

}
