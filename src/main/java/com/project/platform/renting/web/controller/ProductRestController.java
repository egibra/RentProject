package com.project.platform.renting.web.controller;

import com.project.platform.renting.core.model.Picture;
import com.project.platform.renting.core.model.Product;
import com.project.platform.renting.core.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("crud/product")
public class ProductRestController extends AdminRestController<Product>{

    @Autowired
    public ProductRestController(ProductService service) {
        super(service);
    }

    @Override
    public ResponseEntity delete(Integer id){
        return new ResponseEntity(HttpStatus.BAD_REQUEST);
    }

    @Override
    public ResponseEntity update(@PathVariable("id") int id, @Validated @RequestBody Product product) throws Exception{
        Product currentProduct = service.getById(id);
        if(currentProduct == null){
            return new ResponseEntity(HttpStatus.BAD_REQUEST);
        }
        product.setId(id);
        product.setMainPicture(currentProduct.getMainPicture());
        service.update(product);
        return new ResponseEntity(HttpStatus.OK);
    }

    @RequestMapping(value="/{id}", method = RequestMethod.PATCH, consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public ResponseEntity updateMainPicture(@PathVariable("id") Integer productId, @RequestBody Picture picture){
        ((ProductService)service).setMainPicture(productId, picture.getId());
        return new ResponseEntity(HttpStatus.OK);
    }
}
