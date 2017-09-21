package com.project.platform.renting.core.model;

import com.fasterxml.jackson.annotation.JsonIdentityReference;
import com.fasterxml.jackson.annotation.JsonProperty;
import org.hibernate.validator.constraints.NotEmpty;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

@Entity(name = "kategorijos_parametrai")
public class ProductAttribute {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;

    @Column(name="pavadinimas")
    @NotNull
    @NotEmpty
    private String name;

    @ManyToOne
    @JoinColumn(name = "fk_kategorija")
    @NotNull
    @JsonIdentityReference(alwaysAsId=true)
    private ProductCategory category;

    @Column(name="aprasymas")
    private String description;

    public ProductAttribute() {
    }

    public ProductAttribute(String name){
        this.name = name;
    }

    public ProductAttribute(int id, String name, int categoryId){
        this.id = id;
        this.name = name;
        this.setCategory(categoryId);
    }

    public ProductAttribute(int id, String name, ProductCategory category, String description) {
        this.id = id;
        this.name = name;
        this.category = category;
        this.description = description;
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

    public ProductCategory getCategory() {
        return category;
    }

    public void setCategory(ProductCategory category) {
        this.category = category;
    }

    @JsonProperty("category")
    public void setCategory(int categoryId){
        ProductCategory category = new ProductCategory();
        category.setId(categoryId);
        this.category = category;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return name;
    }
}
