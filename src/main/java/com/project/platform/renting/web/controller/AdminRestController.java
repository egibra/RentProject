package com.project.platform.renting.web.controller;

import com.project.platform.renting.core.service.GenericCrudService;
import org.apache.commons.beanutils.BeanUtils;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

public abstract class AdminRestController<E> {

    private final String integrityViolationErrorMessage;

    GenericCrudService<E> service;

    protected AdminRestController(String integrityViolationErrorMessage, GenericCrudService<E> service) {
        this.integrityViolationErrorMessage = integrityViolationErrorMessage;
        this.service = service;
    }

    protected AdminRestController(GenericCrudService<E> service) {
        this("",service);
    }

    @RequestMapping(value="/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<E> getById(@PathVariable("id") int id) {
        return new ResponseEntity<E>(service.getById(id), HttpStatus.OK);
    }

    @RequestMapping(method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public ResponseEntity save(@Validated @RequestBody E entity) {
        service.save(entity);
        return new ResponseEntity(HttpStatus.OK);
    }

    @RequestMapping(value="/{id}", method = RequestMethod.PUT, consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public ResponseEntity update(@PathVariable("id") int id, @Validated @RequestBody E entity) throws Exception{
        E currentEntity = service.getById(id);
        if(currentEntity == null){
            return new ResponseEntity(HttpStatus.BAD_REQUEST);
        }
        BeanUtils.setProperty(entity, "id", BeanUtils.getProperty(currentEntity, "id"));
        service.update(entity);
        return new ResponseEntity(HttpStatus.OK);
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public ResponseEntity delete(@PathVariable("id") Integer id) {
        try {
            service.delete(id);
        } catch (DataIntegrityViolationException exception) {
            return new ResponseEntity<Object>(integrityViolationErrorMessage,
                    new HttpHeaders(),
                    HttpStatus.BAD_REQUEST);
        }
        return new ResponseEntity(HttpStatus.OK);
    }
}
