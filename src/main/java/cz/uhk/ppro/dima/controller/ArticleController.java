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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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

    Integer message_code = 0; // 0 = error, 1 = success, 2 = deleted

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

        //vyhleda kategorie pro menu
        List<Topic> topicList = articleService.findAllTopics();

        //presmerovani na 404 pokud zadny takovy clanek neexistuje
        if (!article.isPresent()){
            ModelAndView newMav = new ModelAndView("redirect:/topics/notfound");
            newMav.addObject("topics", topicList);
            return newMav;
        }

        List<Article> articles = articleService.findArticles();
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

    @PostMapping(value = "/articles/delete/{articleId}/{commentId}")
    public String deleteComment(@PathVariable("articleId") int articleId, @PathVariable("commentId") int commentId) {
        Optional<User> author = userService.findByUsername(authentication.getAuthentication().getName());

        Optional<Article> article = articleService.findById(articleId);
        List<Comment> commentsOnTopic = article.get().getComments();
        Comment commentOnTopic = new Comment();
        for (Comment com : commentsOnTopic){
            if (com.getId() == commentId) commentOnTopic = com;
        }
        if (author.isPresent()) articleService.deleteComment(commentOnTopic);

        return "redirect:/articles/{articleId}";
    }


    @RequestMapping(value = "/articles/new", method = RequestMethod.GET)
    public ModelAndView showNewArticleForm(ArticleDto articleDto) {
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
    public String createNewArticle(@Valid ArticleDto articleDto, BindingResult result, RedirectAttributes redirectAttributes) throws IOException {
        if (result.hasErrors()) {
            return redirectError(redirectAttributes);
        }
        Optional<User> loggedUser = userService.findByUsername(authentication.getAuthentication().getName());
        if (loggedUser.isPresent()) articleService.saveArticle(articleDto, loggedUser.get());
        {
            //nalezeni posledniho id pro jeho zobrazeni
            List<Article> articleList = articleService.findArticles();
            Integer redirectId = articleList.size();
            return redirectSuccess(redirectAttributes, redirectId);
        }
    }

    @RequestMapping(value = "/articles/{articleId}/edit", method = RequestMethod.GET)
    public String showEditArticleForm(@PathVariable("articleId") int articleId, @ModelAttribute("articleDto") Article article, Model model) {
        Optional<Article> a = this.articleService.findById(articleId);
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
    public String processEditArticle(@Valid ArticleDto articleDto, BindingResult result, @PathVariable("articleId") int articleId, RedirectAttributes redirectAttributes) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        Optional<User> author = userService.findByUsername(authentication.getName());

        if (result.hasErrors()) {
            return redirectError(redirectAttributes);
        }

        articleDto.setId(articleId);
        if (author.isPresent()) {
            this.articleService.editArticle(articleDto);
        }

        return redirectEdited(redirectAttributes);

    }

    @PostMapping(value = "/articles/{articleId}/delete")
    public String processDeleteArticle(@PathVariable("articleId") int articleId, RedirectAttributes redirectAttributes) {
        articleService.removeArticle(articleId);
        return redirectDeleted(redirectAttributes);
    }

    private String redirectError(RedirectAttributes redirectAttributes) {
        message_code = 0; // toto cislo se preda do jsp a v zavislosti na nem se vypise hlaska
        redirectAttributes.addFlashAttribute("MESSAGE_CODE_ARTICLE", message_code); // zde se cislo predava do jsp jako parametr pri presmerovani
        return "redirect:/articles/{articleId}/edit?error=true";
    }

    private String redirectSuccess(RedirectAttributes redirectAttributes, Integer articleId) {
        message_code = 1; // toto cislo se preda do jsp a v zavislosti na nem se vypise hlaska
        redirectAttributes.addFlashAttribute("MESSAGE_CODE_ARTICLE", message_code); // zde se cislo predava do jsp jako parametr pri presmerovani
        return "redirect:/articles/" + articleId;
    }

    private String redirectEdited(RedirectAttributes redirectAttributes) {
        message_code = 1; // toto cislo se preda do jsp a v zavislosti na nem se vypise hlaska
        redirectAttributes.addFlashAttribute("MESSAGE_CODE_ARTICLE", message_code); // zde se cislo predava do jsp jako parametr pri presmerovani
        return "redirect:/articles/{articleId}";
    }

    private String redirectDeleted(RedirectAttributes redirectAttributes) {
        message_code = 2; // toto cislo se preda do jsp a v zavislosti na nem se vypise hlaska
        redirectAttributes.addFlashAttribute("MESSAGE_CODE_ARTICLE", message_code); // zde se cislo predava do jsp jako parametr pri presmerovani
        return "redirect:/";
    }

}

