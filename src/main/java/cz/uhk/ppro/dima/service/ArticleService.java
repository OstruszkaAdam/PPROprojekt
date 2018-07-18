package cz.uhk.ppro.dima.service;

import cz.uhk.ppro.dima.model.Article;
import cz.uhk.ppro.dima.model.Category;
import cz.uhk.ppro.dima.model.User;
import cz.uhk.ppro.dima.repository.ArticleRepository;
import cz.uhk.ppro.dima.repository.CategoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.sql.Timestamp;
import java.util.List;

@Service
public class ArticleService {
    private CategoryRepository categoryRepo;
    private ArticleRepository articleRepo;

    @Autowired
    public ArticleService(CategoryRepository categoryRepo, ArticleRepository articleRepo) {
        this.categoryRepo = categoryRepo;
        this.articleRepo = articleRepo;
    }

    @Transactional
    public void saveArticle(Article article, User user) {
        article.setTimestamp(new Timestamp(System.currentTimeMillis()));
        article.setUser(user);
        articleRepo.save(article);
    }

    @Transactional
    public List<Category> findAllCategories() {
        return categoryRepo.findAll();
    }

    @Transactional
    public Category findCategoryByName(String name){
        return categoryRepo.findByName(name);
    }

}
