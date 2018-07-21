package cz.uhk.ppro.dima.repository.jpa;

import cz.uhk.ppro.dima.model.Topic;
import cz.uhk.ppro.dima.repository.TopicRepository;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.List;

@Repository
public class JpaTopicRepositoryImpl implements TopicRepository {

    @PersistenceContext
    private EntityManager em;

    @Override
    public List<Topic> findAll() {
        return em.createQuery("SELECT c from Topic c").getResultList();
    }

    @Override
    public Topic findByName(String name) {
        Query query = this.em.createQuery("SELECT c from Topic c where c.name =:name");
        query.setParameter("name", name);
        return (Topic) query.getSingleResult();
    }


}
