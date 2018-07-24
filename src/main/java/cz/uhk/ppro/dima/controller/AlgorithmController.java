package cz.uhk.ppro.dima.controller;


import cz.uhk.ppro.dima.model.Topic;
import cz.uhk.ppro.dima.service.ArticleService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Optional;

@Controller
public class AlgorithmController {

    private final ArticleService articleService;

    public AlgorithmController(ArticleService articleService) {
        this.articleService = articleService;
    }


    @RequestMapping(value = "/algoritmus", method = RequestMethod.GET)
    public ModelAndView algoritmus() {

        ModelAndView mav = new ModelAndView("algoritmus");

        List<Topic> topicList = articleService.findAllTopics();
        mav.addObject("topics", topicList);

        return mav;
    }

}

