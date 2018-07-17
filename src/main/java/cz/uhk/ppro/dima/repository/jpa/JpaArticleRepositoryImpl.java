package cz.uhk.ppro.dima.repository.jpa;

import cz.uhk.ppro.dima.model.Article;
import cz.uhk.ppro.dima.repository.ArticleRepository;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;
import java.util.List;

@Repository
public class JpaArticleRepositoryImpl implements ArticleRepository{

    @PersistenceContext
    private EntityManager em;

    @Override
    public List<Article> findAll() {
        return null;
    }

    @Override
    @Transactional
    public void save(Article article) {
        em.persist(article);
    }
}
