package com.project.platform.renting.core.service.impl;

import com.project.platform.renting.core.model.Order;
import com.project.platform.renting.core.model.ProductCategory;
import com.project.platform.renting.core.model.User;
import com.project.platform.renting.core.repository.OrderRepository;
import com.project.platform.renting.core.repository.ProductCategoryRepository;
import com.project.platform.renting.core.service.GenericCrudServiceImpl;
import com.project.platform.renting.core.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;

@Service
public class OrderServiceImpl extends GenericCrudServiceImpl<Order, OrderRepository> implements OrderService{

    @Autowired
    public OrderServiceImpl(OrderRepository repository) {
        super(repository);
    }

    @Override
    public List<Order> getCurrentOrdersByUser(User user) {
        return repository.findAllByUserAndReturnDateIsGreaterThanEqual(user, LocalDate.now());
    }

    @Override
    public List<Order> getPastOrdersByUser(User user) {
        return repository.findAllByUserAndReturnDateIsBefore(user, LocalDate.now());
    }
}
