package cz.uhk.ppro.dima.controller;

import cz.uhk.ppro.dima.model.Topic;
import cz.uhk.ppro.dima.service.ArticleService;
import org.springframework.boot.autoconfigure.web.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * obhospodari veskere nesmysly zadane v adresním radku
 */

@Controller
public class MyErrorController implements ErrorController {

    private final ArticleService articleService;

    public MyErrorController(ArticleService articleService) {
        this.articleService = articleService;
    }

    @RequestMapping("/error")
/*    public String handleError() {
        //do something like logging
        return "/notfound";
    }*/

    public ModelAndView notfound() {

        ModelAndView mav = new ModelAndView("notfound");

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

