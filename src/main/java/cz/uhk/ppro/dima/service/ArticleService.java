package cz.uhk.ppro.dima.service;

import cz.uhk.ppro.dima.dto.ArticleDto;
import cz.uhk.ppro.dima.model.*;
import cz.uhk.ppro.dima.repository.ArticleRepository;
import cz.uhk.ppro.dima.repository.TopicRepository;
import cz.uhk.ppro.dima.repository.CommentRepository;
import cz.uhk.ppro.dima.repository.ImageRepository;
import cz.uhk.ppro.dima.util.ImagePersistor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.sql.Timestamp;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
public class ArticleService {

    @Autowired
    private TopicRepository topicRepo;
    @Autowired
    private ArticleRepository articleRepo;
    @Autowired
    private CommentRepository commentRepo;
    @Autowired
    private ImageRepository imageRepo;
    @Autowired
    private ImagePersistor imagePersistor;

    public ArticleService() {
    }

    @Transactional
    public void saveArticle(ArticleDto articleDto, User user) {
        Article article = new Article();
        List<MultipartFile> files = articleDto.getMpf();

        article.setName(articleDto.getName());
        article.setTopic(articleDto.getTopic());
        article.setText(articleDto.getText());
        article.setTimestamp(new Timestamp(System.currentTimeMillis()));
        article.setUser(user);
        articleRepo.save(article);

        saveImages(article, files);

    }

    @Transactional
    public List<Topic> findAllTopics() {
        return topicRepo.findAll();
    }

    @Transactional
    public Topic findTopicByName(String name) {
        return topicRepo.findByName(name);
    }

    @Transactional()
    public List<Article> findArticles() throws DataAccessException {
        return articleRepo.findAll();
    }

    @Transactional
    public void editArticle(ArticleDto articleDto){
        int articleId = articleDto.getId();
        Optional<Article> a = this.findById(articleId);

        Article article = a.get();

        article.setText(articleDto.getText());
        article.setName(articleDto.getName());
        article.setTopic(articleDto.getTopic());
        article.setTimestamp(new Timestamp(System.currentTimeMillis()));
        article.setImages(null);


        List<MultipartFile> files = articleDto.getMpf();
        saveImages(article, files);

        articleRepo.save(article);

    }

    private void saveImages(Article article, List<MultipartFile> files) {
        for (MultipartFile file : files) {
            String imgUUID = UUID.randomUUID().toString();
            imagePersistor.saveImage(file, imgUUID);
            ArticleImage a = new ArticleImage();
            a.setUuid(imgUUID);
            a.setArticle(article);
            imageRepo.save(a);
        }
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
        if (article.isPresent()) {
            List<ArticleImage> articleImages = article.get().getImages();
            File f;
            for (ArticleImage ai : articleImages) {
                try {
                    f = new File("D:/PPRO/src/main/webapp/resources/images/original/" + ai.getUuid() + ".jpg");
                    Files.delete(f.toPath());

                    f = new File("D:/PPRO/src/main/webapp/resources/images/downscaled/" + ai.getUuid() + ".jpg");
                    Files.delete(f.toPath());
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            articleRepo.remove(article.get());
        }
    }

    @Transactional
    public List findArticlesOnTopic(int topicId) {
        return articleRepo.findArticlesInTopic(topicId);
    }

    @Transactional
    public List findArticlesOnTopicByName(String topicUrlName) {
        return articleRepo.findArticlesInTopic(topicUrlName);
    }

}
