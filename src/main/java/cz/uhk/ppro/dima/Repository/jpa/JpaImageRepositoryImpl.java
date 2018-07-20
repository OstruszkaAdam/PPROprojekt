package cz.uhk.ppro.dima.repository.jpa;

import cz.uhk.ppro.dima.model.ArticleImage;
import cz.uhk.ppro.dima.repository.ImageRepository;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Repository
public class JpaImageRepositoryImpl implements ImageRepository{

    @PersistenceContext
    private EntityManager em;

    @Override
    public void save(ArticleImage image) {
        em.persist(image);
    }
}
