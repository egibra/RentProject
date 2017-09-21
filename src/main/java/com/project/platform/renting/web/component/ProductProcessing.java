package com.project.platform.renting.web.component;

import com.project.platform.renting.core.model.Product;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Optional;

public class ProductProcessing {

    public static final String REMOVE_SEARCH_QUERY = "removeallsearch";
    private static final String DEFAULT_ORDER_MESSAGE = "Populiariausi";
    private static final String DEFAULT_ORDER_TYPE = "popular";

    private int productsPerPage = 15;
    private String orderMessage = DEFAULT_ORDER_MESSAGE;
    private String orderType = DEFAULT_ORDER_TYPE;
    private String category = "no-category";
    private int currentPage = 1;
    private String currentSearch = null;
    private boolean currentSearchDone = false;

    private List<Product> products;

    public void sortProducts(String order) {

        if (!orderType.equals(order)) {
            orderType = (order == null) ? DEFAULT_ORDER_TYPE : order;
            switch (orderType) {
                case "price":
                    Collections.sort(products, Product.byPrice);
                    orderMessage = "Dienos kaina";
                    break;
                case "recent":
                    Collections.sort(products, Product.byRecent);
                    orderMessage = "Naujausi";
                    break;
                default:
                    Collections.sort(products, Product.byPopularity);
                    orderMessage = DEFAULT_ORDER_MESSAGE;
                    break;
            }
        }
    }

    public int getCategoryNumber(String type){
        orderType = DEFAULT_ORDER_TYPE;
        orderMessage = DEFAULT_ORDER_MESSAGE;
        category = type;
        currentSearch = null;
        currentSearchDone = false;

        int categoryNumber;

        /* Turning category from string to appropriate int */
        switch (type) {
            case "all":
                categoryNumber = 0;
                break;
            case "gopro":
                categoryNumber = 1;
                break;
            case "gaming-consoles":
                categoryNumber = 2;
                break;
            case "cameras":
                categoryNumber = 3;
                break;
            case "drones":
                categoryNumber = 4;
                break;
            case "discount":
                categoryNumber = 10;
                break;
            default:
                categoryNumber = -1;
                break;
        }
        return categoryNumber;
    }

    public void processSearch(String search){
        if (!currentSearchDone && search != null && !REMOVE_SEARCH_QUERY.equals(search)) {
            currentSearch = search;
            List<Product> newList = new ArrayList<>();

            for (Product p : products) {
                if (p.getName().contains(currentSearch)) {
                    newList.add(p);
                }
            }
            products = newList;
            currentSearchDone = true;
        }
    }

    public int getProductsPerPage() {
        return productsPerPage;
    }

    public void setProductsPerPage(String perPage) {
        try {
            if (perPage != null) {
                int p = Integer.parseInt(perPage);
                if (p >= 0)
                    productsPerPage = p;
            }
        } catch(NumberFormatException e){
            throw e;
        }
    }

    public String getOrderMessage() {
        return orderMessage;
    }

    public void setOrderMessage(String orderMessage) {
        this.orderMessage = orderMessage;
    }

    public String getOrderType() {
        return orderType;
    }

    public void setOrderType(String orderType) {
        this.orderType = orderType;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(Optional<String> page){
        try {
            if (page.isPresent())
                currentPage = Integer.parseInt(page.get());
            else currentPage = 1;
        } catch (NumberFormatException e){
            currentPage = 1;
            throw e;
        }
    }

    public String getCurrentSearch() {
        return currentSearch;
    }

    public void setCurrentSearch(String currentSearch) {
        this.currentSearch = currentSearch;
    }

    public boolean isCurrentSearchDone() {
        return currentSearchDone;
    }

    public void setCurrentSearchDone(boolean currentSearchDone) {
        this.currentSearchDone = currentSearchDone;
    }

    public List<Product> getProducts() {
        return products;
    }

    public void setProducts(List<Product> products) {
        this.products = products;
    }
}
