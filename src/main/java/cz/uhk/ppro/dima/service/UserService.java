package cz.uhk.ppro.dima.service;

import cz.uhk.ppro.dima.model.User;
import cz.uhk.ppro.dima.dto.UserDto;
import cz.uhk.ppro.dima.repository.RoleRepository;
import cz.uhk.ppro.dima.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import javax.validation.Valid;
import java.sql.Timestamp;
import java.util.Collection;
import java.util.Optional;

@Service
public class UserService {
    private UserRepository userRepo;
    private RoleRepository roleRepo;
    private PasswordEncoder passwordEncoder;

    @Autowired
    public UserService(UserRepository userRepo, RoleRepository roleRepo, PasswordEncoder passwordEncoder) {
        this.userRepo = userRepo;
        this.roleRepo = roleRepo;
        this.passwordEncoder = passwordEncoder;
    }

    @Transactional
    public void createNewUser(@Valid UserDto userDto) throws DataAccessException {
        Optional<User> u = userRepo.findByUsername(userDto.getUsername());
        if(u.isPresent()) return;

        User user = new User();
        user.setUsername(userDto.getUsername());
        user.setPassword(passwordEncoder.encode(userDto.getPassword())); // zahashování hesla pomocí BCrypt definovaného ve WebSecurityConfig.java
        user.setEmail(userDto.getEmail());
        user.setFirstName(userDto.getFirstName());
        user.setLastName(userDto.getLastName());
        user.setRole(roleRepo.findByName("USER").get());
        user.setCreationTime(new Timestamp(System.currentTimeMillis()));
        userRepo.save(user);
    }

    @Transactional
    public Optional<User> findByUsername(String username) {
        return userRepo.findByUsername(username);
    }

    @Transactional
    public Optional<User> findById(int id) {
        return userRepo.findById(id);
    }


    @Transactional
    public Collection<User> findUsersByLastName(String lastName) throws DataAccessException {
        return userRepo.findByLastName(lastName);
    }

}
