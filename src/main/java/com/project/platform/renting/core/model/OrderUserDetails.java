package com.project.platform.renting.core.model;

import javax.persistence.*;
import java.io.Serializable;

@Entity(name = "uzsakovas")
public class OrderUserDetails implements Serializable{

    @Id
    private int orderId;

    @MapsId
    @OneToOne
    @JoinColumn(name = "uzsakymo_id")
    private Order order;

    @Column(name="vardas")
    private String firstName;

    @Column(name = "pavarde")
    private String lastName;

    @Column(name = "el_pastas")
    private String email;

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
