package cz.uhk.ppro.dima.repository.jpa;

import cz.uhk.ppro.dima.model.Graph;
import cz.uhk.ppro.dima.repository.GraphRepository;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.List;
import java.util.Optional;

@Repository
public class JpaGraphRepositoryImpl implements GraphRepository {

    @PersistenceContext
    private EntityManager em;

    @Override
    public Optional<Graph> findById(int id) {
        Query query = this.em.createQuery("SELECT a FROM Graph a WHERE a.id =:id");
        query.setParameter("id", id);
        return (Optional<Graph>) query.setMaxResults(1).getResultList().stream().findFirst();
    }

    @Override
    public List<Graph> findAll() {
        return em.createQuery("select graph from Graph graph order by graph.name desc").getResultList();
    }

    @Override
    public void save(Graph graph) {
        em.persist(graph);
    }

    @Override
    public void delete(Graph graph) {
        em.remove(graph);
    }
}
