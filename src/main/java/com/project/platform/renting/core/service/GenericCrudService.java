package com.project.platform.renting.core.service;

import java.util.List;

public interface GenericCrudService<E> {

    void save(E entity);

    E getById(int id);

    List<E> getAll();

    void update(E entity);

    void delete(int id);
}
