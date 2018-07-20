package cz.uhk.ppro.dima.service;

import cz.uhk.ppro.dima.dto.ArticleDto;
import cz.uhk.ppro.dima.model.*;
import cz.uhk.ppro.dima.repository.ArticleRepository;
import cz.uhk.ppro.dima.repository.CategoryRepository;
import cz.uhk.ppro.dima.repository.CommentRepository;
import cz.uhk.ppro.dima.util.ImagePersistor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
public class ArticleService {
    private CategoryRepository categoryRepo;
    private ArticleRepository articleRepo;
    private CommentRepository commentRepo;

    @Autowired
    public ArticleService(CategoryRepository categoryRepo, ArticleRepository articleRepo, CommentRepository commentRepo) {
        this.categoryRepo = categoryRepo;
        this.articleRepo = articleRepo;
        this.commentRepo = commentRepo;
    }

    @Transactional
    public void saveArticle(ArticleDto articleDto, User user) {
        Article article = new Article();
        List<ArticleImage> articleImages = new ArrayList<>();
        List<MultipartFile> files = articleDto.getMpf();

        for(MultipartFile f:files) {
            String imgUUID = UUID.randomUUID().toString();
            ImagePersistor.saveImage(f, imgUUID);
            ArticleImage a = new ArticleImage();
            a.setUuid(imgUUID);
            a.setArticle(article);
            //TODO save image
        }

        article.setName(articleDto.getName());
        article.setCategory(articleDto.getCategory());
        article.setDescription(articleDto.getDescription());
        article.setLocation(articleDto.getLocation());
        article.setPrice(articleDto.getPrice());
        article.setImages(articleImages);
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

    @Transactional()
    public List<Article> findArticles() throws DataAccessException {
        return articleRepo.findAll();
    }
    @Transactional
    public Optional<Article> findById(int id) {
        return articleRepo.findById(id);
    }

    @Transactional
    public void saveComment(Comment comment, User user, int articleId) {
        comment.setAuthor(user);
        comment.setArticle(articleRepo.findById(articleId).get());
        comment.setPostDate(new Timestamp(System.currentTimeMillis()));
        commentRepo.save(comment);
    }

    @Transactional
    public void removeArticle(int articleId) {
        Optional<Article> article = articleRepo.findById(articleId);
        if(article.isPresent()) articleRepo.remove(article.get());
    }

    @Transactional
    public List findArticlesInCategory(int categoryId) {
        return articleRepo.findArticlesInCategory(categoryId);
    }
}
