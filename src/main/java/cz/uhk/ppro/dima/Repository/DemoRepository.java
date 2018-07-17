package cz.uhk.ppro.dima.Repository;

import cz.uhk.ppro.dima.Model.Demo;

import java.util.Optional;

public interface DemoRepository {
    Optional<Demo> findById(int id);
    void save(Demo demo);
}
