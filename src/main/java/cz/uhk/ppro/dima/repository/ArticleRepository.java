package cz.uhk.ppro.dima.repository;

import cz.uhk.ppro.dima.model.Article;

import java.util.List;

public interface ArticleRepository {
    List<Article> findAll();
    void save(Article article);
}
