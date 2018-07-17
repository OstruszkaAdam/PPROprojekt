package cz.uhk.ppro.dima.repository;

import cz.uhk.ppro.dima.model.User;

import java.util.List;

public interface UserRepository {
    List<User> findAll();
    User findById(int id);
    void save(User user);
}
