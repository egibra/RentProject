package com.project.platform.renting.core.service.impl;

import com.project.platform.renting.core.model.OrderLine;
import com.project.platform.renting.core.repository.OrderLineRepository;
import com.project.platform.renting.core.service.GenericCrudServiceImpl;
import com.project.platform.renting.core.service.OrderLineService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrderLineServiceImpl extends GenericCrudServiceImpl<OrderLine, OrderLineRepository> implements OrderLineService {

    @Autowired
    public OrderLineServiceImpl(OrderLineRepository repository) {
        super(repository);
    }

}
