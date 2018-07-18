package cz.uhk.ppro.dima.controller;

import cz.uhk.ppro.dima.model.Rating;
import cz.uhk.ppro.dima.model.User;
import cz.uhk.ppro.dima.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
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
    public ModelAndView showOwner(@PathVariable("userId") int userId, @ModelAttribute("addedRating") Rating rating) {
        ModelAndView mav = new ModelAndView("userDetail");
        Optional<User> user = userService.findById(userId);
        mav.addObject("ratings", user.get().getRatingsReceived());
        if(user.isPresent()) mav.addObject("user", user.get());
        return mav;
    }

    @RequestMapping(value ="/users/{userId}", method = RequestMethod.POST)
    public String addRating(@PathVariable("userId") int userId, @ModelAttribute("addedRating") Rating rating) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        Optional<User> author = userService.findByUsername(authentication.getName());
        if(author.isPresent()) userService.saveRating(rating, author.get(), userId);
        return "redirect:/users/{userId}";
    }
}