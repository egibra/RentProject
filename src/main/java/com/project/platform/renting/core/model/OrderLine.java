package com.project.platform.renting.core.model;

import javax.persistence.*;

@Entity(name = "uzsakymo_daiktas")
public class OrderLine {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;

    @ManyToOne
    @JoinColumn(name = "fk_daiktas")
    private Product product;

    @Column(name = "kiekis")
    private int quantity;

    @ManyToOne
    @JoinColumn(name = "fk_uzsakymas")
    private Order order;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }
}
