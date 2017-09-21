package com.project.platform.renting.core.model;

import com.fasterxml.jackson.annotation.JsonIdentityReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.project.platform.renting.web.config.JacksonConfig;
import org.hibernate.validator.constraints.NotEmpty;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.Comparator;
import java.util.List;
import java.util.Map;

@Entity(name = "daiktas")
@Table(name="daiktas")
public class Product {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;

    @ManyToOne
    @JoinColumn(name = "kategorija")
    @NotNull
    @JsonIdentityReference(alwaysAsId=true)
    private ProductCategory category;

    @Column(name = "kodas")
    @NotNull
    @NotEmpty
    private String code;

    @Column(name = "pavadinimas")
    @NotNull
    @NotEmpty
    private String name;

    @Column(name = "paros_kaina")
    private BigDecimal pricePerDay;

    @Column(name = "verte")
    private double valuePrice;

    @Column(name = "isleidimo_data")
    private LocalDate dateOut;

    @Column(name = "kiekis_turimas_viso")
    private int amount;

    @Column(name = "kiekis_isnuomota_viso")
    private int rentedOverall;

    @Column(name = "kiekis_isnuomota_dabar")
    private int rentedNow;

    @Column(name = "trumpas_aprasymas")
    private String shortDescription;

    @Column(name = "ilgas_aprasymas")
    private String longDescription;

    @Column(name = "nuolaida_proc")
    private BigDecimal discount;

    @Column(name="ar_nuomojamas", columnDefinition = "BOOLEAN")
    @NotNull
    private boolean available;

    @ElementCollection
    @CollectionTable(name = "daikto_parametrai",
            joinColumns = @JoinColumn(name = "fk_daiktas"))
    @MapKeyJoinColumn(name = "fk_parametras")
    @Column(name = "reiksme")
    @JsonSerialize(keyUsing = JacksonConfig.ProductAttributeSerializer.class)
    @JsonDeserialize(using = JacksonConfig.attributesDeserializer.class,
            keyAs = ProductAttribute.class,
            contentAs = String.class)
    private Map<ProductAttribute, String> attributes;

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "product")
    @JsonIgnore
    private List<Picture> pictures;

    @ManyToOne
    @JoinColumn(name = "pagrindine_nuotrauka")
    private Picture mainPicture;

    public Product(){}

    public Product(ProductCategory category, String code, String name, BigDecimal pricePerDay, double valuePrice,
                   LocalDate dateOut, int amount, int rentedOverall, int rentedNow,
                   String shortDescription, String longDescription, BigDecimal discount, boolean available,
                   Map<ProductAttribute, String> attributes) {
        this.category = category;
        this.code = code;
        this.name = name;
        this.pricePerDay = pricePerDay;
        this.valuePrice = valuePrice;
        this.dateOut = dateOut;
        this.amount = amount;
        this.rentedOverall = rentedOverall;
        this.rentedNow = rentedNow;
        this.shortDescription = shortDescription;
        this.longDescription = longDescription;
        this.discount = discount;
        this.available = available;
        this.attributes = attributes;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public BigDecimal getPricePerDay() {
        return pricePerDay;
    }

    public void setPricePerDay(BigDecimal pricePerDay) {
        this.pricePerDay = pricePerDay;
    }

    public double getValuePrice() {
        return valuePrice;
    }

    public void setValuePrice(double valuePrice) {
        this.valuePrice = valuePrice;
    }

    public LocalDate getDateOut() {
        return dateOut;
    }

    public void setDateOut(LocalDate dateOut) {
        this.dateOut = dateOut;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public int getRentedOverall() {
        return rentedOverall;
    }

    public void setRentedOverall(int rentedOverall) {
        this.rentedOverall = rentedOverall;
    }

    public int getRentedNow() {
        return rentedNow;
    }

    public void setRentedNow(int rentedNow) {
        this.rentedNow = rentedNow;
    }

    public String getShortDescription() {
        return shortDescription;
    }

    public void setShortDescription(String shortDescription) {
        this.shortDescription = shortDescription;
    }

    public String getLongDescription() {
        return longDescription;
    }

    public void setLongDescription(String longDescription) {
        this.longDescription = longDescription;
    }

    public BigDecimal getDiscount() {
        return discount;
    }

    public void setDiscount(BigDecimal discount) {
        this.discount = discount;
    }

    public Map<ProductAttribute, String> getAttributes() {
        return attributes;
    }

    public void setAttributes(Map<ProductAttribute, String> attributes) {
        this.attributes = attributes;
    }

    public ProductCategory getCategory() {
        return category;
    }

    public void setCategory(ProductCategory category) {
        this.category = category;
    }

    @JsonProperty("category")
    public void setCategory(int categoryId) {
        ProductCategory category = new ProductCategory();
        category.setId(categoryId);
        this.category = category;
    }

    public boolean isAvailable() {
        return available;
    }

    public void setAvailable(boolean available) {
        this.available = available;
    }

    public List<Picture> getPictures() {
        return pictures;
    }

    public void setPictures(List<Picture> pictures) {
        this.pictures = pictures;
    }

    public Picture getMainPicture() {
        return mainPicture;
    }

    public void setMainPicture(Picture mainPicture) {
        this.mainPicture = mainPicture;
    }

    public BigDecimal getPriceWithDiscount(){
        if(discount.compareTo(BigDecimal.ZERO) == 0){
            return pricePerDay;
        }
        BigDecimal kof = new BigDecimal(100).subtract(discount).divide(new BigDecimal(100));
        return pricePerDay.multiply(kof);
    }

    public static Comparator<Product> byPopularity = new Comparator<Product>() {
        @Override
        public int compare(Product p1, Product p2) {
            return p2.rentedOverall - p1.rentedOverall;
        }
    };

    public static Comparator<Product> byPrice = new Comparator<Product>() {
        @Override
        public int compare(Product p1, Product p2) {
            return p1.getPriceWithDiscount().compareTo(p2.getPriceWithDiscount());
        }
    };

    public static Comparator<Product> byRecent = new Comparator<Product>() {
        @Override
        public int compare(Product p1, Product p2) {
            return (p1.dateOut.isBefore(p2.dateOut)) ? 1 : -1;
        }
    };

}
