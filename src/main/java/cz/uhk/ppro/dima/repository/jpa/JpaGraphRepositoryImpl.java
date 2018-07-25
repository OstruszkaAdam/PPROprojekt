package cz.uhk.ppro.dima.repository.jpa;

import cz.uhk.ppro.dima.model.Graph;
import cz.uhk.ppro.dima.repository.GraphRepository;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Repository
public class JpaGraphRepositoryImpl implements GraphRepository {

    @PersistenceContext
    private EntityManager em;

    @Override
    public void save(Graph graph) {
        em.persist(graph);
    }

    @Override
    public void delete(Graph graph) {
        em.remove(graph);
    }
}
