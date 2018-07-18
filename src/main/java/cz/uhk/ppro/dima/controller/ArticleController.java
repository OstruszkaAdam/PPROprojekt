package cz.uhk.ppro.dima.controller;

import cz.uhk.ppro.dima.model.Article;
import cz.uhk.ppro.dima.repository.ArticleRepository;
import cz.uhk.ppro.dima.repository.jpa.JpaArticleRepositoryImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.sql.Timestamp;

@Controller
public class ArticleController {

    @Autowired
    ArticleRepository articleRepo = new JpaArticleRepositoryImpl();

    @RequestMapping(value = "/article", method = RequestMethod.POST)
    public String create(@ModelAttribute("article") Article article) {
        article.setTimestamp(new Timestamp(System.currentTimeMillis()));
        articleRepo.save(article);
        return "redirect:articleSuccess";
    }

    @RequestMapping(value = "/article", method = RequestMethod.GET)
    public String showArticleForm(@ModelAttribute("article") Article article) {
        return "article";
    }

    @RequestMapping(value = "/articleSuccess")
    public String showArticleSuccess() {
        return "articleSuccess";
    }
}

