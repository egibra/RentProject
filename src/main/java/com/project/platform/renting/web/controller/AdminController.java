package com.project.platform.renting.web.controller;

import com.project.platform.renting.core.model.*;
import com.project.platform.renting.core.service.GenericCrudService;
import com.project.platform.renting.core.service.OrderService;
import com.project.platform.renting.core.service.OrderStateService;
import com.project.platform.renting.core.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AdminController {

    private GenericCrudService<Product> productService;

    private GenericCrudService<ProductCategory> categoryService;

    private OrderService orderService;

    private OrderStateService orderStateService;

    @Autowired
    public AdminController(GenericCrudService<Product> productService, GenericCrudService<ProductCategory> categoryService, OrderService orderService,
                           OrderStateService orderStateService) {
        this.productService = productService;
        this.categoryService = categoryService;
        this.orderService = orderService;
        this.orderStateService = orderStateService;
    }

    @RequestMapping(value = "${com.project.platform.renting.admin-url}"+"/products", method = RequestMethod.GET)
    public String showProducts(Model model){
        model.addAttribute("products", productService.getAll());
        model.addAttribute("categories", categoryService.getAll());
        return "admin-products";
    }

    @RequestMapping(value = "${com.project.platform.renting.admin-url}"+"/products/detail-view/{id}", method = RequestMethod.GET)
    public String getProductTableDetailView(Model model, @PathVariable Integer id){
        Product product = productService.getById(id);
        product.getPictures().remove(product.getMainPicture());
        model.addAttribute("product", product);
        return "admin-product-detail-view";
    }

    @RequestMapping(value = "${com.project.platform.renting.admin-url}"+"/categories", method = RequestMethod.GET)
    public String showCategories(Model model){
        model.addAttribute("categories", categoryService.getAll());
        return "admin-categories";
    }

    @RequestMapping(value = "${com.project.platform.renting.admin-url}"+"/attributes", method = RequestMethod.GET)
    public String showAttributes(Model model){
        model.addAttribute("categories", categoryService.getAll());
        return "admin-attributes";
    }

    @RequestMapping(value = "${com.project.platform.renting.admin-url}"+"/orders", method = RequestMethod.GET)
    public String showOrders(Model model){
        model.addAttribute("orders", orderService.getAll());
        model.addAttribute("states", orderStateService.getAll());
        return "admin-orders";
    }

    @RequestMapping(value = "${com.project.platform.renting.admin-url}"+"/orders/detail-view/{id}", method = RequestMethod.GET)
    public String getOrderTableDetailView(Model model, @PathVariable Integer id){
        Order order = orderService.getById(id);
        model.addAttribute("orderLines", order.getOrderLineList());
        return "admin-order-detail-view";
    }

    @RequestMapping(value="${com.project.platform.renting.admin-url}"+"/orders/{id}", method = RequestMethod.PATCH,
            consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public ResponseEntity updateOrderState(@PathVariable("id") Integer orderId, @RequestBody OrderState orderState){
        Order order = orderService.getById(orderId);
        order.setState(orderState);
        orderService.update(order);
        return new ResponseEntity(HttpStatus.OK);
    }

}
