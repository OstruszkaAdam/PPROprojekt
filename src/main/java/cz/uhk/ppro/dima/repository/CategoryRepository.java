package cz.uhk.ppro.dima.repository;

import cz.uhk.ppro.dima.model.Category;

import java.util.List;

public interface CategoryRepository {
    List<Category> findAll();
    Category findByName(String name);
}
