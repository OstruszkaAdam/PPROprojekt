package cz.uhk.ppro.dima.controller;

import cz.uhk.ppro.dima.model.Topic;
import cz.uhk.ppro.dima.model.User;
import cz.uhk.ppro.dima.security.AuthenticationProvider;
import cz.uhk.ppro.dima.service.ArticleService;
import cz.uhk.ppro.dima.service.UserService;
import org.springframework.boot.autoconfigure.web.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Optional;

/**
 * obhospodari veskere nesmysly zadane v adresním radku
 */

@Controller
public class MyErrorController implements ErrorController {

    private final ArticleService articleService;
    private final AuthenticationProvider authentication;
    private final UserService userService;

    public MyErrorController(ArticleService articleService, AuthenticationProvider authentication, UserService userService) {
        this.articleService = articleService;
        this.authentication = authentication;
        this.userService = userService;
    }

    @RequestMapping("/error")
/*    public String handleError() {
        //do something like logging
        return "/notfound";
    }*/

    public ModelAndView notfound() {

        ModelAndView mav = new ModelAndView("notfound");

        //pro poslání spravneho id na dashboard
        Optional<User> loggedUser = userService.findByUsername(authentication.getAuthentication().getName());
        if (loggedUser.isPresent()) mav.addObject("loggedUserId", loggedUser.get().getId());

        //vyhledani nazvu temat pro menu
        List<Topic> topicList = articleService.findAllTopics();
        mav.addObject("topics", topicList);

        return mav;
    }



    @Override
    public String getErrorPath() {
        return "/error";
    }
}

