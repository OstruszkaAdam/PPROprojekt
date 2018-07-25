package cz.uhk.ppro.dima.repository;

import cz.uhk.ppro.dima.model.Article;

import java.util.List;
import java.util.Optional;

public interface ArticleRepository {
    Optional<Article> findById(int id);
    List<Article> findAll();
    List<Article> findArticlesOnTopic(int topicId);
    List<Article> findArticlesOnTopic(String topicUrlName);
    void save(Article article);
    void remove(Article article);
}
