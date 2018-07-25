package cz.uhk.ppro.dima.controller;

import cz.uhk.ppro.dima.model.Article;
import cz.uhk.ppro.dima.model.Topic;
import cz.uhk.ppro.dima.model.User;
import cz.uhk.ppro.dima.security.AuthenticationProvider;
import cz.uhk.ppro.dima.service.ArticleService;
import cz.uhk.ppro.dima.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.boot.context.config.ResourceNotFoundException;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Optional;

@Controller
public class IndexController {
    private final ArticleService articleService;

    @Autowired
    public IndexController(ArticleService articleService) {
        this.articleService = articleService;
    }

    @RequestMapping(value ="/", method = RequestMethod.GET)
    public String showIndex( @ModelAttribute("article") Article article, ModelMap modelMap, HttpServletRequest request) {

        //vyhledani nazvu temat pro menu
        List<Topic> topicList = articleService.findAllTopics();
        modelMap.put("topics", topicList);
        return "index";
    }

}
