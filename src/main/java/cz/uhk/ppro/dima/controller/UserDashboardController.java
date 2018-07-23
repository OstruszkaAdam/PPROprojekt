package cz.uhk.ppro.dima.controller;

import cz.uhk.ppro.dima.model.Topic;
import cz.uhk.ppro.dima.model.User;
import cz.uhk.ppro.dima.service.ArticleService;
import cz.uhk.ppro.dima.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.config.ResourceNotFoundException;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Optional;

@Controller
public class UserDashboardController {

    private final UserService userService;
    private final ArticleService articleService;

    @Autowired
    public UserDashboardController(UserService userService,  ArticleService articleService) {
        this.userService = userService;
        this.articleService = articleService;
    }

    @RequestMapping(value ="/users/{userId}", method = RequestMethod.GET)
    public ModelAndView showOwner(@PathVariable("userId") int userId) {
        ModelAndView mav = new ModelAndView("userDashboard");

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        Optional<User> loggedUser = userService.findByUsername(authentication.getName());

        //vyhleda kategorie pro menu
        List<Topic> topicList = articleService.findAllTopics();

        Optional<User> user = userService.findById(userId);
        if(!user.isPresent()) return new ModelAndView("redirect:/notfound.html");

        if(user.isPresent()) {
            mav.addObject("articles", user.get().getArticles());
            mav.addObject("user", user.get());
            mav.addObject("topics", topicList);
        }

        if(loggedUser.isPresent()) mav.addObject("loggedUserId", loggedUser.get().getId());

        if(loggedUser.isPresent() && user.isPresent() && loggedUser.get().getId() == user.get().getId())
            mav.addObject("isLoggedUsersProfile", true);

        return mav;
    }

}
