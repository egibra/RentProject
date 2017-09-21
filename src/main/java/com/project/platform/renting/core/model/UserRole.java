package com.project.platform.renting.core.model;

import javax.persistence.*;

@Entity(name="vartotojo_tipai")
public class UserRole {

    @Id
    @Column(name="id")
    private int id;

    @Column(name="tipas")
    private String role;

    public UserRole() {
    }

    public UserRole(int id, String role) {
        this.id = id;
        this.role = role;
    }

    @Override
    public String toString() {
        return role;
    }
}
