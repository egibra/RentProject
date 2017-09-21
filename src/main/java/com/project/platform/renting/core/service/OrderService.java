package com.project.platform.renting.core.service;

import com.project.platform.renting.core.model.Order;
import com.project.platform.renting.core.model.User;

import java.util.List;

public interface OrderService extends GenericCrudService<Order>{
    List<Order> getCurrentOrdersByUser(User user);
    List<Order> getPastOrdersByUser(User user);
}
