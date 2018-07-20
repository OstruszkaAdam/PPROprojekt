package cz.uhk.ppro.dima.controller;

import cz.uhk.ppro.dima.dto.ArticleDto;
import cz.uhk.ppro.dima.model.Article;
import cz.uhk.ppro.dima.model.Category;
import cz.uhk.ppro.dima.model.Comment;
import cz.uhk.ppro.dima.model.User;
import cz.uhk.ppro.dima.service.ArticleService;
import cz.uhk.ppro.dima.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.io.IOException;
import java.util.List;
import java.util.Optional;

@Controller
public class ArticleController {
    private final ArticleService articleService;
    private final UserService userService;
    private static final String ARTICLEFORMVIEW = "saveOrEditArticle";

    @Autowired
    public ArticleController(ArticleService articleService, UserService userService) {
        this.articleService = articleService;
        this.userService = userService;
    }

    @RequestMapping(value ="/articles/{articleId}", method = RequestMethod.GET)
    public ModelAndView showArticle(@PathVariable("articleId") int articleId, @ModelAttribute("addedComment") Comment comment) {
        ModelAndView mav = new ModelAndView("articleDetail");

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        Optional<User> loggedUser = userService.findByUsername(authentication.getName());
        if(loggedUser.isPresent()) mav.addObject("loggedUserId", loggedUser.get().getId());

        Optional<Article> article = articleService.findById(articleId);

        if(article.isPresent()) {
            mav.addObject("article", article.get());
            mav.addObject("images", article.get().getImages());
            mav.addObject("comments", article.get().getComments());
        }

        return mav;
    }

    @RequestMapping(value ="/articles/{articleId}", method = RequestMethod.POST)
    public String addRating(@PathVariable("articleId") int articleId, @ModelAttribute("addedComment") @Valid Comment comment) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        Optional<User> author = userService.findByUsername(authentication.getName());
        if(author.isPresent()) articleService.saveComment(comment, author.get(), articleId);
        return "redirect:/articles/{articleId}";
    }

    @RequestMapping(value = "/articles/new", method = RequestMethod.GET)
    public ModelAndView showNewArticleForm(ArticleDto articleDto, BindingResult result) {
        ModelAndView mav = new ModelAndView();
        mav.setViewName(ARTICLEFORMVIEW);

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        Optional<User> loggedUser = userService.findByUsername(authentication.getName());
        if(loggedUser.isPresent()) mav.addObject("loggedUserId", loggedUser.get().getId());

        List<Category> categoryList;
        categoryList = articleService.findAllCategories();
        mav.addObject("categories", categoryList);
        return mav;
    }

    @RequestMapping(value = "/articles/new", method = RequestMethod.POST)
    public String createNewArticle(@Valid ArticleDto articleDto, BindingResult result) throws IOException {
        if(result.hasErrors()) {
            return "redirect:/articles/new?error=true";
        }
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        Optional<User> loggedUser = userService.findByUsername(authentication.getName());
        if(loggedUser.isPresent()) articleService.saveArticle(articleDto, loggedUser.get());
        return "redirect:articleSuccess";
    }

    @RequestMapping(value = "/articles/{articleId}/edit", method = RequestMethod.GET)
    public String showEditArticleForm(@PathVariable("articleId") int articleId, Model model) {
        Optional<Article> a = this.articleService.findById(articleId);
        if(a.isPresent()) model.addAttribute("article", a);

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        Optional<User> loggedUser = userService.findByUsername(authentication.getName());
        if(loggedUser.isPresent()) model.addAttribute("loggedUserId", loggedUser.get().getId());

        List<Category> categoryList;
        categoryList = articleService.findAllCategories();
        model.addAttribute("categories", categoryList);

        return ARTICLEFORMVIEW;
    }

    @RequestMapping(value = "/articles/{articleId}/edit", method = RequestMethod.POST)
    public String processEditArticle(@Valid ArticleDto articleDto, BindingResult result, @PathVariable("articleId") int articleId) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        Optional<User> author = userService.findByUsername(authentication.getName());

        if(result.hasErrors()) {
            return "redirect:/articles/{articleId}/edit?error=true";
        }

        articleDto.setId(articleId);
        if(author.isPresent()) this.articleService.saveArticle(articleDto, author.get());
        return "redirect:/articles/{articleId}";
    }

    @PostMapping(value = "/articles/{articleId}/delete")
    public String processDeleteArticle(@PathVariable("articleId") int articleId) {
        articleService.removeArticle(articleId);
        return "redirect:/";
    }

    @RequestMapping(value = "/articles/articleSuccess")
    public String showArticleSuccess() {
        return "articleSuccess";
    }

}

