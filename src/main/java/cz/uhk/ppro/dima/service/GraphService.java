package cz.uhk.ppro.dima.service;

import cz.uhk.ppro.dima.dto.ArticleDto;
import cz.uhk.ppro.dima.dto.GraphDto;
import cz.uhk.ppro.dima.model.Article;
import cz.uhk.ppro.dima.model.ArticleImage;
import cz.uhk.ppro.dima.model.Graph;

import cz.uhk.ppro.dima.repository.GraphRepository;
import cz.uhk.ppro.dima.util.GraphPersistor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;


@Service
public class GraphService {

    @Autowired
    private GraphRepository graphRepo;
    @Autowired
    private GraphPersistor graphPersistor;

    @Transactional
    public void saveGraph(GraphDto graphDto) {
        Graph graph = new Graph();

        List<MultipartFile> files = graphDto.getMpf();

        graph.setName(graphDto.getName());

        graphRepo.save(graph);

        saveGraph(graph, files);

    }

    private void saveGraph(Graph graph, List<MultipartFile> files) {
        for (MultipartFile file : files) {

            graphPersistor.saveGraph(file, graph.getName());
            Graph g = new Graph();
            g.setName(graph.getName());
            graphRepo.save(g);

        }
    }
}
