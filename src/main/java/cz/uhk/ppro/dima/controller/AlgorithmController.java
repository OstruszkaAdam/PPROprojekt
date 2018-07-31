package cz.uhk.ppro.dima.controller;


import cz.uhk.ppro.dima.model.Topic;
import cz.uhk.ppro.dima.model.User;
import cz.uhk.ppro.dima.security.AuthenticationProvider;
import cz.uhk.ppro.dima.service.ArticleService;
import cz.uhk.ppro.dima.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Optional;

@Controller
public class AlgorithmController {

    private final ArticleService articleService;
    private final UserService userService;
    private final AuthenticationProvider authentication;


    public AlgorithmController(ArticleService articleService, UserService userService, AuthenticationProvider authentication) {
        this.articleService = articleService;
        this.userService = userService;
        this.authentication = authentication;
    }


    @RequestMapping(value = "/algoritmus", method = RequestMethod.GET)
    public ModelAndView algoritmus() {

        ModelAndView mav = new ModelAndView("algoritmus");

        //pro poslání spravneho id na dashboard
        Optional<User> loggedUser = userService.findByUsername(authentication.getAuthentication().getName());
        if (loggedUser.isPresent()) mav.addObject("loggedUserId", loggedUser.get().getId());

        //vyhledani nazvu temat pro menu
        List<Topic> topicList = articleService.findAllTopics();
        mav.addObject("topics", topicList);

        return mav;
    }

}

