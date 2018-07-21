package cz.uhk.ppro.dima.controller;

import cz.uhk.ppro.dima.model.User;
import cz.uhk.ppro.dima.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.Optional;

@Controller
public class UserController {

    private final UserService userService;

    @Autowired
    public UserController(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping(value ="/users/{userId}", method = RequestMethod.GET)
    public ModelAndView showOwner(@PathVariable("userId") int userId) {
        ModelAndView mav = new ModelAndView("userDetail");

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        Optional<User> loggedUser = userService.findByUsername(authentication.getName());

        Optional<User> user = userService.findById(userId);
        if(user.isPresent()) {
            mav.addObject("articles", user.get().getArticles());
            mav.addObject("user", user.get());
        }
        if(loggedUser.isPresent()) mav.addObject("loggedUserId", loggedUser.get().getId());

        if(loggedUser.isPresent() && user.isPresent() && loggedUser.get().getId() == user.get().getId())
            mav.addObject("isLoggedUsersProfile", true);

        return mav;
    }

}
