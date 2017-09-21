package com.project.platform.renting.core.model;

import javax.persistence.*;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;

@Entity(name = "uzsakymas")
public class Order {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int nr;

    @Column(name="nuomos_pradzia")
    private LocalDate startDate;

    @Column(name="nuomos_pabaiga")
    private LocalDate returnDate;

    @Column(name = "pagrindine_kaina")
    private BigDecimal totalPrice;

    @ManyToOne
    @JoinColumn(name="busena")
    private OrderState state;

    @ManyToOne
    @JoinColumn(name="fk_uzsakovas")
    private User user;

    @Column(name = "adresas")
    private String address;

    @Column(name = "telefonas")
    private String phoneNumber;

    @OneToMany(mappedBy = "order")
    private List<OrderLine> orderLineList;

    //unregistered user details
    @OneToOne(cascade = CascadeType.ALL, mappedBy = "order")
    private OrderUserDetails orderUserDetails;

    public int getNr() {
        return nr;
    }

    public void setNr(int nr) {
        this.nr = nr;
    }

    public LocalDate getStartDate() {
        return startDate;
    }

    public void setStartDate(LocalDate startDate) {
        this.startDate = startDate;
    }

    public LocalDate getReturnDate() {
        return returnDate;
    }

    public void setReturnDate(LocalDate returnDate) {
        this.returnDate = returnDate;
    }

    public BigDecimal getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(BigDecimal totalPrice) {
        this.totalPrice = totalPrice;
    }

    public OrderState getState() {
        return state;
    }

    public void setState(OrderState state) {
        this.state = state;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public List<OrderLine> getOrderLineList() {
        return orderLineList;
    }

    public void setOrderLineList(List<OrderLine> orderLineList) {
        this.orderLineList = orderLineList;
    }

    public OrderUserDetails getOrderUserDetails() {
        return orderUserDetails;
    }

    public void setOrderUserDetails(OrderUserDetails orderUserDetails) {
        this.orderUserDetails = orderUserDetails;
    }
}
