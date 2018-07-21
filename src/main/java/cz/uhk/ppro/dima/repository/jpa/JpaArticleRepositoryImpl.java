package cz.uhk.ppro.dima.repository.jpa;

import cz.uhk.ppro.dima.model.Article;
import cz.uhk.ppro.dima.repository.ArticleRepository;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.List;
import java.util.Optional;

@Repository
public class JpaArticleRepositoryImpl implements ArticleRepository {

    @PersistenceContext
    private EntityManager em;

    @Override
    public Optional<Article> findById(int id) {
        Query query = this.em.createQuery("SELECT a FROM Article a WHERE a.id =:id");
        query.setParameter("id", id);
        return (Optional<Article>) query.setMaxResults(1).getResultList().stream().findFirst();
    }

    @Override
    public List<Article> findAll() {
        return em.createQuery("select article from Article article order by article.timestamp desc").getResultList();
    }

    @Override
    public List<Article> findArticlesInTopic(int topicId) {
        Query query = this.em.createQuery("select article from Article article where article.topic.id = :topicId order by article.timestamp desc");
        query.setParameter("topicId", topicId);
        return query.getResultList();
    }

    @Override
    public void save(Article article) {
        Optional<Article> a = this.findById(article.getId());
        if(a.isPresent()) {
            em.merge(article);
        } else {
            em.persist(article);
        }
    }

    @Override
    public void remove(Article article) {
        em.remove(article);
    }
}
