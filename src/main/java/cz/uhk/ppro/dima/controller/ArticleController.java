package cz.uhk.ppro.dima.controller;

import cz.uhk.ppro.dima.model.Article;
import cz.uhk.ppro.dima.model.Category;
import cz.uhk.ppro.dima.model.User;
import cz.uhk.ppro.dima.service.ArticleService;
import cz.uhk.ppro.dima.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class ArticleController {
    private final ArticleService articleService;
    private final UserService userService;

    @Autowired
    public ArticleController(ArticleService articleService, UserService userService) {
        this.articleService = articleService;
        this.userService = userService;
    }


    @RequestMapping(value = "/article/new", method = RequestMethod.POST)
    public String create(@ModelAttribute("article") Article article) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String currentPrincipalName = authentication.getName();
        User user = userService.findByUsername(currentPrincipalName).get();
        articleService.saveArticle(article, user);
        return "redirect:articlesuccess";
    }

    @RequestMapping(value = "/article/new", method = RequestMethod.GET)
    public ModelAndView showArticleForm(@ModelAttribute("article") Article article, ModelMap modelMap) {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("article");
        List<Category> categoryList;
        categoryList = articleService.findAllCategories();
        modelMap.put("categories", categoryList);
        return mav;
    }

    @RequestMapping(value = "/articlesuccess")
    public String showarticlesuccess() {
        return "articleSuccess";
    }
}

