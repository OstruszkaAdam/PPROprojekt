package cz.uhk.ppro.dima.repository.jpa;

import cz.uhk.ppro.dima.model.Comment;
import cz.uhk.ppro.dima.repository.CommentRepository;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Repository
public class JpaCommentRepositoryImpl implements CommentRepository {
    @PersistenceContext
    private EntityManager em;

    @Override
    public void save(Comment comment) {
        em.persist(comment);
    }

    @Override
    public void delete(Comment comment) {
        em.remove(comment);
    }


}
