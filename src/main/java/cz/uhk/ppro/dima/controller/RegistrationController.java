package cz.uhk.ppro.dima.controller;

import cz.uhk.ppro.dima.model.Role;
import cz.uhk.ppro.dima.model.User;
import cz.uhk.ppro.dima.repository.UserRepository;
import cz.uhk.ppro.dima.repository.jpa.JpaUserRepositoryImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.sql.Timestamp;


@Controller
public class RegistrationController {

    @Autowired
    UserRepository userRepo = new JpaUserRepositoryImpl();


    @RequestMapping(value = "/registration", method = RequestMethod.POST)
    public String register(@ModelAttribute("user") User user) {
        user.setCreationTime(new Timestamp(System.currentTimeMillis()));

        user.setRole(new Role());
        userRepo.save(user);
        return "redirect:registrationSuccess";
    }

    @RequestMapping(value = "/registration", method = RequestMethod.GET)
    public String showRegistrationForm(@ModelAttribute("user") User user) {
        return "registration";
    }

    @RequestMapping(value = "/registrationSuccess")
    public String showRegistrationSuccess() {
        return "registrationSuccess";
    }
}
