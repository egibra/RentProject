package com.project.platform.renting.core.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.hibernate.validator.constraints.NotEmpty;

import javax.persistence.*;
import javax.persistence.Id;
import javax.validation.constraints.NotNull;
import java.util.List;

@Entity(name = "kategorija")
@Table(name="kategorijos")
public class ProductCategory {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;

    @Column(name = "kategorija")
    @NotNull
    @NotEmpty
    private String name;

    @OneToMany(cascade = CascadeType.PERSIST)
    @JoinTable(name = "kategorijos_parametrai",
            joinColumns = @JoinColumn(name = "fk_kategorija"),
            inverseJoinColumns = @JoinColumn(name = "id"))
    @JsonIgnore
    private List<ProductAttribute> attributes;

    public ProductCategory() {
    }

    public ProductCategory(String name) {
        this.name = name;
    }

    public ProductCategory(int id, String name) {
        this.id = id;
        this.name = name;
    }

    public ProductCategory(int id, String name, List<ProductAttribute> attributes) {
        this.id = id;
        this.name = name;
        this.attributes = attributes;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<ProductAttribute> getAttributes() {
        return attributes;
    }

    public void setAttributes(List<ProductAttribute> attributes) {
        this.attributes = attributes;
    }

    @Override
    public String toString() {
        return name;
    }
}
