package cz.uhk.ppro.dima.controller;

import cz.uhk.ppro.dima.model.Article;
import cz.uhk.ppro.dima.model.Topic;
import cz.uhk.ppro.dima.model.User;
import cz.uhk.ppro.dima.security.AuthenticationProvider;
import cz.uhk.ppro.dima.service.ArticleService;
import cz.uhk.ppro.dima.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Optional;

@Controller
public class IndexController {
    private final ArticleService articleService;
    private final UserService userService;
    private final AuthenticationProvider authentication;

    @Autowired
    public IndexController(ArticleService articleService, UserService userService, AuthenticationProvider authentication) {
        this.articleService = articleService;
        this.userService = userService;
        this.authentication = authentication;
    }

    @RequestMapping(value ="/", method = RequestMethod.GET)
    public String showIndex( @ModelAttribute("article") Article article, ModelMap modelMap, HttpServletRequest request) {

        //pro poslání spravneho id na dashboard
        Optional<User> user = userService.findByUsername(authentication.getAuthentication().getName());
        if(user.isPresent()) modelMap.put("loggedUserId", user.get().getId());

        //vyhledani nazvu temat pro menu
        List<Topic> topicList = articleService.findAllTopics();
        modelMap.put("topics", topicList);
        return "index";
    }

}
