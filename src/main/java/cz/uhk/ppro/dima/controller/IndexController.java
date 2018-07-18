package cz.uhk.ppro.dima.controller;

import cz.uhk.ppro.dima.model.Article;
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
import java.util.Optional;

@Controller
public class IndexController {
    UserService userService;
    private final ArticleService articleService;

    @Autowired
    public IndexController(UserService userService, ArticleService articleService) {
        this.userService = userService;
        this.articleService = articleService;
    }

    @RequestMapping(value ="/", method = RequestMethod.GET)
    public ModelAndView showIndex(@ModelAttribute("article") Article article, ModelMap modelMap) {
        ModelAndView mav = new ModelAndView("/index");
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication.isAuthenticated()) {
            Optional<User> user = userService.findByUsername(authentication.getName());
            if(user.isPresent()) {
                modelMap.put("userId", user.get().getId());
            }
        }

        List<Article> articleList;
        articleList = articleService.findArticles();
        mav.addObject("articles", articleList);
        return mav;
    }
}
