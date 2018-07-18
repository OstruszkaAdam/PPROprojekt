package cz.uhk.ppro.dima.repository;

import cz.uhk.ppro.dima.model.Role;

import java.util.Optional;

public interface RoleRepository {
    Optional<Role> findByName(String name);
}
