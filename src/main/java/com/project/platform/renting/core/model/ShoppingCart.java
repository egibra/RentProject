package com.project.platform.renting.core.model;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

@Entity(name = "krepselis")
public class ShoppingCart {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;

    @ManyToOne
    @NotNull
    @JoinColumn(name = "fk_daiktas")
    private Product product;

    @ManyToOne
    @JoinColumn(name = "fk_vartotojas")
    private User user;

    @Column(name = "kiekis")
    private int quantity;

    public ShoppingCart(){}

    public ShoppingCart(Product product, User user, int quantity) {
        this.product = product;
        this.user = user;
        this.quantity = quantity;
    }

    public ShoppingCart(Product product, int quantity) {
        this.product = product;
        this.quantity = quantity;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}
