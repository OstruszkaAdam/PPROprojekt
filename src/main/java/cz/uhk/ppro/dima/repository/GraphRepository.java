package cz.uhk.ppro.dima.repository;

import cz.uhk.ppro.dima.model.Graph;

public interface GraphRepository {
    void save(Graph graph);
    void delete(Graph graph);

}
