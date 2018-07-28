package cz.uhk.ppro.dima.controller;

import cz.uhk.ppro.dima.model.Article;
import cz.uhk.ppro.dima.model.Topic;
import cz.uhk.ppro.dima.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

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
