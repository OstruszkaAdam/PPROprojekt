package cz.uhk.ppro.dima.controller;

import cz.uhk.ppro.dima.dto.UserDto;
import cz.uhk.ppro.dima.model.Topic;
import cz.uhk.ppro.dima.service.ArticleService;
import cz.uhk.ppro.dima.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.util.List;


@Controller
public class RegistrationController {

    private final UserService userService;
    private final ArticleService articleService;

    @Autowired
    RegistrationController(UserService userService, ArticleService articleService) {
        this.userService = userService;
        this.articleService = articleService;
    }

    @RequestMapping(value = "/registration", method = RequestMethod.GET)
    public ModelAndView showRegistrationForm(@ModelAttribute("user") UserDto user) {
        List<Topic> topicList = articleService.findAllTopics();
        ModelAndView mav = new ModelAndView("userRegistration");
        mav.addObject("topics",topicList);
        return mav;
    }

    @RequestMapping(value = "/registration", method = RequestMethod.POST)
    public String registerNewUser(@ModelAttribute("user") @Valid UserDto userDto, BindingResult result) {
        if(result.hasErrors() || !userDto.getPassword().equals(userDto.getPasswordRepeat()))
            return "redirect:registration?unsuccesful";

        if(userService.findByUsername(userDto.getUsername()).isPresent() == false){
            userService.createNewUser(userDto);
            return "redirect:registration/success";
        }
        return "redirect:registration?unsuccesful";
    }

    @RequestMapping(value = "/registration/success",  method = RequestMethod.GET)
    public String showRegistrationSuccess() {
        return "userRegistrationSuccess";
    }

}
