package cz.uhk.ppro.dima.controller;

import cz.uhk.ppro.dima.model.User;
import cz.uhk.ppro.dima.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class RegistrationController {

    private final UserService userService;

    @Autowired
    RegistrationController(UserService userService) {this.userService = userService;}


    @RequestMapping(value = "/registration", method = RequestMethod.POST)
    public String register(@ModelAttribute("user") User user) {
        ModelAndView mv = new ModelAndView();

        if(userService.findByUsername(user.getUsername()).isPresent() == false){
            userService.save(user);
            return "redirect:registrationSuccess";
        }

        return "redirect:registration?unsuccesful";
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
