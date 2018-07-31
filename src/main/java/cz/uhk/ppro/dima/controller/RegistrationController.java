package cz.uhk.ppro.dima.controller;

import cz.uhk.ppro.dima.dto.UserDto;
import cz.uhk.ppro.dima.model.Topic;
import cz.uhk.ppro.dima.service.ArticleService;
import cz.uhk.ppro.dima.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.util.List;


@Controller
public class RegistrationController {

    private final UserService userService;
    private final ArticleService articleService;
    Integer message_code = 0; // 0 = error, 1 = success

    @Autowired
    RegistrationController(UserService userService, ArticleService articleService) {
        this.userService = userService;
        this.articleService = articleService;
    }

    @RequestMapping(value = "/registration", method = RequestMethod.GET)
    public ModelAndView showRegistrationForm(@ModelAttribute("user") UserDto user) {
        ModelAndView mav = new ModelAndView("userRegistration");

        //vyhledani nazvu temat pro menu
        List<Topic> topicList = articleService.findAllTopics();
        mav.addObject("topics", topicList);

        return mav;
    }

    @RequestMapping(value = "/registration", method = RequestMethod.POST)
    public String registerNewUser(@ModelAttribute("user") @Valid UserDto userDto, BindingResult result, RedirectAttributes redirectAttributes) {
        if (result.hasErrors() || !userDto.getPassword().equals(userDto.getPasswordRepeat()))
            return redirectError(redirectAttributes);

        if (userService.findByUsername(userDto.getUsername()).isPresent() == false) { // pokud uzivatel se zadanym jmenem jeste neexistuje
            userService.createNewUser(userDto);
            return redirectSuccess(redirectAttributes);
        }
        return redirectError(redirectAttributes);

    }

    private String redirectError(RedirectAttributes redirectAttributes) {
        message_code = 0; // toto cislo se preda do jsp a v zavislosti na nem se vypise hlaska
        redirectAttributes.addFlashAttribute("MESSAGE_CODE_REGISTRATION", message_code); // zde se cislo predava do jsp jako parametr pri presmerovani
        return "redirect:registration?unsuccesful";
    }

    private String redirectSuccess(RedirectAttributes redirectAttributes) {
        message_code = 1; // toto cislo se preda do jsp a v zavislosti na nem se vypise hlaska
        redirectAttributes.addFlashAttribute("MESSAGE_CODE_REGISTRATION", message_code); // zde se cislo predava do jsp jako parametr pri presmerovani
        return "redirect:/login";
    }

}
