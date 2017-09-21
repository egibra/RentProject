package com.project.platform.renting.web.controller;

import com.project.platform.renting.core.model.Product;
import com.project.platform.renting.core.model.User;
import com.project.platform.renting.core.service.ProductService;
import com.project.platform.renting.core.service.SecurityService;
import com.project.platform.renting.core.service.ShoppingCartService;
import com.project.platform.renting.web.component.ProductProcessing;
import com.project.platform.renting.core.model.ShoppingCart;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/products")
public class ProductController {

    private ProductProcessing productProcessing;

    private ProductService productService;

    private SecurityService securityService;

    private ShoppingCartService shoppingCartService;

    @Autowired
    public ProductController(ProductService productService, SecurityService securityService, ShoppingCartService shoppingCartService){
        this.productService = productService;
        this.securityService = securityService;
        this.shoppingCartService = shoppingCartService;
        productProcessing = new ProductProcessing();
    }

    @RequestMapping(value = "")
    public String getProducts(){
        return "redirect:/products/all";
    }

    @RequestMapping(value={"/{type}/{page}", "/{type}"})
    public String getAllProductsByType(@PathVariable String type, @PathVariable Optional<String> page,
                                        @RequestParam(required = false) String order,
                                        @RequestParam(required = false) String perPage,
                                        @RequestParam(required = false) String search, Model model){

        /* Getting products by category */
        if (!productProcessing.getCategory().equals(type) || ProductProcessing.REMOVE_SEARCH_QUERY.equals(search)) {
            int category = productProcessing.getCategoryNumber(type);

            if (category == -1)
                return "page-not-found";
            else
                productProcessing.setProducts(productService.getAllProductsByCategoryId(category));
        }

        // Select products by search query
        productProcessing.processSearch(search);

        /* Sorting products by sort option "order" */
        productProcessing.sortProducts(order);

        /* Setting start and end indexes of list to return */
        int startInd, endInd;

        try {
            productProcessing.setProductsPerPage(perPage);
            productProcessing.setCurrentPage(page);

            int currentPage = productProcessing.getCurrentPage();
            int listSize = productProcessing.getProducts().size();

            startInd = (currentPage - 1) *  productProcessing.getProductsPerPage();
            if (startInd > listSize || startInd < 0)
                return "page-not-found";

            endInd = currentPage * productProcessing.getProductsPerPage();
            if (endInd > listSize)
                endInd = listSize;

        } catch (NumberFormatException e) {
            return "page-not-found";
        }

        /* Adding attributes for jsp files */
        model.addAttribute("currentSearch", productProcessing.getCurrentSearch());
        model.addAttribute("currentPage", productProcessing.getCurrentPage());
        model.addAttribute("totalSize", productProcessing.getProducts().size());
        model.addAttribute("startIndex", (endInd == 0) ? 0 : startInd + 1);
        model.addAttribute("endIndex", endInd);
        model.addAttribute("productsPerPage", productProcessing.getProductsPerPage());
        model.addAttribute("orderMessage", productProcessing.getOrderMessage());
        model.addAttribute("currentCategory", productProcessing.getCategory());
        model.addAttribute("pageName", type + ".jsp");
        model.addAttribute("products", productProcessing.getProducts().subList(startInd, endInd));
        return "product-list";

    }

    @RequestMapping(value={"product-info/{id}", "{type}/product-info/{id}"}, method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Product> showModalById(@PathVariable("id") int id) {
        return new ResponseEntity<Product>(productService.getById(id), HttpStatus.OK);
    }
}
