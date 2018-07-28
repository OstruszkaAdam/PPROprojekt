package cz.uhk.ppro.dima.service;

import cz.uhk.ppro.dima.dto.ArticleDto;
import cz.uhk.ppro.dima.dto.GraphDto;
import cz.uhk.ppro.dima.model.Article;
import cz.uhk.ppro.dima.model.ArticleImage;
import cz.uhk.ppro.dima.model.Graph;

import cz.uhk.ppro.dima.model.User;
import cz.uhk.ppro.dima.repository.GraphRepository;
import cz.uhk.ppro.dima.util.GraphPersistor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Optional;


@Service
public class GraphService {

    @Autowired
    private GraphRepository graphRepo;
    @Autowired
    private GraphPersistor graphPersistor;

    @Transactional
    public void saveGraph(GraphDto graphDto, User user) {
        Graph graph = new Graph();

        List<MultipartFile> files = graphDto.getMpf();
        graph.setName(graphDto.getName());
        graph.setDescription(graphDto.getDescription());
        graph.setUser(user);
        saveGraph(graph, files);
    }

    private void saveGraph(Graph graph, List<MultipartFile> files) {
        for (MultipartFile file : files) {

            graphPersistor.saveGraph(file, graph.getName());
            Graph g = new Graph();
            g.setName(graph.getName());
            g.setDescription(graph.getDescription());
            g.setUser(graph.getUser());
            g.setArticle(null);
            graphRepo.save(g);
        }
    }

    @Transactional()
    public List<Graph> findGraphs() throws DataAccessException {
        return graphRepo.findAll();
    }

    @Transactional
    public Optional<Graph> findById(int id) {
        return graphRepo.findById(id);
    }

    @Transactional
    public void remove(int graphId) {
        graphRepo.delete(findById(graphId).get());
    }
}
