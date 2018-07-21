package cz.uhk.ppro.dima.repository;

import cz.uhk.ppro.dima.model.Topic;

import java.util.List;

public interface TopicRepository {
    List<Topic> findAll();
    Topic findByName(String name);
}
