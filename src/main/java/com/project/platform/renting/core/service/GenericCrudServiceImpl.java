package com.project.platform.renting.core.service;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public abstract class GenericCrudServiceImpl<E, T extends JpaRepository<E, Integer>> implements GenericCrudService<E> {

    protected T repository;

    protected GenericCrudServiceImpl(T repository){
        this.repository = repository;
    }

    @Override
    public E getById(int id) {
        return repository.findOne(id);
    }

    @Override
    public List<E> getAll() {
        return repository.findAll();
    }

    @Override
    public void save(E entity) {
        repository.save(entity);
    }

    @Override
    public void update(E entity) {
        repository.save(entity);
    }

    @Override
    public void delete(int id) {
        repository.delete(id);
    }

}
