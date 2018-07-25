package cz.uhk.ppro.dima.repository;

import cz.uhk.ppro.dima.model.Graph;
import java.util.List;
import java.util.Optional;

public interface GraphRepository {
    Optional<Graph> findById(int id);
    List<Graph> findAll();
    void save(Graph graph);
    void delete(Graph graph);

}
