package cz.uhk.ppro.dima.controller;

import cz.uhk.ppro.dima.dto.ArticleDto;
import cz.uhk.ppro.dima.model.Article;
import cz.uhk.ppro.dima.model.Topic;
import cz.uhk.ppro.dima.model.Comment;
import cz.uhk.ppro.dima.model.User;
import cz.uhk.ppro.dima.security.AuthenticationProvider;
import cz.uhk.ppro.dima.service.ArticleService;
import cz.uhk.ppro.dima.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.config.ResourceNotFoundException;
import org.springframework.http.HttpStatus;
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
    private final AuthenticationProvider authentication;

    private static final String ARTICLEFORMVIEW = "articleEditor";

    @Autowired
    public ArticleController(ArticleService articleService, UserService userService, AuthenticationProvider authentication) {
        this.articleService = articleService;
        this.userService = userService;
        this.authentication = authentication;
    }

    @RequestMapping(value = "/articles/{articleId}", method = RequestMethod.GET)
    public ModelAndView showArticle(@PathVariable("articleId") int articleId, @ModelAttribute("addComment") Comment comment) {
        ModelAndView mav = new ModelAndView("articleDetail");

        Optional<User> loggedUser = userService.findByUsername(authentication.getAuthentication().getName());
        if (loggedUser.isPresent()) mav.addObject("loggedUserId", loggedUser.get().getId());

        Optional<Article> article = articleService.findById(articleId);
        //redirrect na 404 pokud zadny takovy clanek neexistuje
        if (!article.isPresent()){
            ModelAndView newMav = new ModelAndView("redirect:/topics/notfound");
            List<Topic> topicList = articleService.findAllTopics();
            newMav.addObject("topics", topicList);
            return newMav;
        }

        List<Article> articles = articleService.findArticles();
        //vyhleda kategorie pro menu
        List<Topic> topicList = articleService.findAllTopics();
        boolean hasPermission = false;
        for (Article art : articles) {
            if (art.getId() == articleId) hasPermission = true;
        }

        if (article.isPresent()) {
            mav.addObject("article", article.get());
            mav.addObject("images", article.get().getImages());
            mav.addObject("comments", article.get().getComments());
            mav.addObject("hasPermission", hasPermission);
            mav.addObject("topics", topicList);
        }

        return mav;
    }

    @RequestMapping(value = "/articles/{articleId}", method = RequestMethod.POST)
    public String addComment(@PathVariable("articleId") int articleId, @ModelAttribute("addedComment") @Valid Comment comment) {
        Optional<User> author = userService.findByUsername(authentication.getAuthentication().getName());
        if (author.isPresent()) articleService.saveComment(comment, author.get(), articleId);
        return "redirect:/articles/{articleId}";
    }

    @RequestMapping(value = "/articles/new", method = RequestMethod.GET)
    public ModelAndView showNewArticleForm(ArticleDto articleDto, BindingResult result) {
        ModelAndView mav = new ModelAndView();
        mav.setViewName(ARTICLEFORMVIEW);

        Optional<User> loggedUser = userService.findByUsername(authentication.getAuthentication().getName());
        if (loggedUser.isPresent()) mav.addObject("loggedUserId", loggedUser.get().getId());

        List<Topic> topicList;
        topicList = articleService.findAllTopics();
        mav.addObject("topics", topicList);
        return mav;
    }

    @RequestMapping(value = "/articles/new", method = RequestMethod.POST)
    public String createNewArticle(@Valid ArticleDto articleDto, BindingResult result) throws IOException {
        if (result.hasErrors()) {
            return "redirect:/articles/new?error=true";
        }
        Optional<User> loggedUser = userService.findByUsername(authentication.getAuthentication().getName());
        if (loggedUser.isPresent()) articleService.saveArticle(articleDto, loggedUser.get());
        return "redirect:/articles/new/success";
    }

    @RequestMapping(value = "/articles/{articleId}/edit", method = RequestMethod.GET)
    public String showEditArticleForm(@PathVariable("articleId") int articleId, @ModelAttribute("articleDto") Article article, Model model) {
        Optional<Article> a = this.articleService.findById(articleId);
        //TODO map a to a DTO object
        if (a.isPresent()) model.addAttribute("articleDto", a);

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        Optional<User> loggedUser = userService.findByUsername(authentication.getName());
        if (loggedUser.isPresent()) model.addAttribute("loggedUserId", loggedUser.get().getId());

        List<Topic> topicList;
        topicList = articleService.findAllTopics();
        model.addAttribute("topics", topicList);

        return ARTICLEFORMVIEW;
    }

    @RequestMapping(value = "/articles/{articleId}/edit", method = RequestMethod.POST)
    public String processEditArticle(@Valid ArticleDto articleDto, BindingResult result, @PathVariable("articleId") int articleId) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        Optional<User> author = userService.findByUsername(authentication.getName());

        if (result.hasErrors()) {
            return "redirect:/articles/{articleId}/edit?error=true";
        }

        articleDto.setId(articleId);
        if (author.isPresent()) {
            this.articleService.editArticle(articleDto);
        }

        return "redirect:/articles/{articleId}";

    }

    @PostMapping(value = "/articles/{articleId}/delete")
    public String processDeleteArticle(@PathVariable("articleId") int articleId) {
        articleService.removeArticle(articleId);
        return "redirect:/";
    }

    @RequestMapping(value = "/articles/new/success")
    public String showArticleSuccess() {
        return "articleSuccess";
    }

}

