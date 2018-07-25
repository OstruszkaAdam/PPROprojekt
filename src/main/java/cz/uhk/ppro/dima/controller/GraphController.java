package cz.uhk.ppro.dima.controller;

import cz.uhk.ppro.dima.dto.ArticleDto;
import cz.uhk.ppro.dima.dto.GraphDto;
import cz.uhk.ppro.dima.model.Topic;
import cz.uhk.ppro.dima.model.User;
import cz.uhk.ppro.dima.security.AuthenticationProvider;
import cz.uhk.ppro.dima.service.ArticleService;
import cz.uhk.ppro.dima.service.GraphService;
import cz.uhk.ppro.dima.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.util.List;
import java.util.Optional;

@Controller
public class GraphController {

    private final GraphService graphService;
    private final UserService userService;
    private final AuthenticationProvider authentication;
    private final ArticleService articleService;

    Integer message_code = 0; // 0 = error, 1 = success, 2 = deleted

    public GraphController(GraphService graphService, UserService userService, AuthenticationProvider authentication, ArticleService articleService) {
        this.graphService = graphService;
        this.userService = userService;
        this.authentication = authentication;
        this.articleService = articleService;
    }

    @RequestMapping(value = "/graph/new", method = RequestMethod.GET)
    public ModelAndView algoritmus() {

        ModelAndView mav = new ModelAndView("graphEditor");

        Optional<User> loggedUser = userService.findByUsername(authentication.getAuthentication().getName());
        if (loggedUser.isPresent()) mav.addObject("loggedUserId", loggedUser.get().getId());

        GraphDto graphDto = new GraphDto();
        mav.addObject("graphDto",graphDto);

        List<Topic> topicList = articleService.findAllTopics();
        mav.addObject("topics", topicList);

        return mav;
    }

    @RequestMapping(value = "/graph/new", method = RequestMethod.POST)
    public String createNewGraph(@Valid GraphDto graphDto, BindingResult result, RedirectAttributes redirectAttributes) {
        if (result.hasErrors()) {
            return redirectError(redirectAttributes);
        }
        Optional<User> loggedUser = userService.findByUsername(authentication.getAuthentication().getName());
        if (loggedUser.isPresent()) graphService.saveGraph(graphDto);
        {
            return redirectSuccess(redirectAttributes);
        }
    }

    private String redirectError(RedirectAttributes redirectAttributes) {
        message_code = 0; // toto cislo se preda do jsp a v zavislosti na nem se vypise hlaska
        redirectAttributes.addFlashAttribute("MESSAGE_CODE_ARTICLE", message_code); // zde se cislo predava do jsp jako parametr pri presmerovani
        return "redirect:/articles/{articleId}/edit?error=true";
    }

    private String redirectSuccess(RedirectAttributes redirectAttributes) {
        message_code = 1; // toto cislo se preda do jsp a v zavislosti na nem se vypise hlaska
        redirectAttributes.addFlashAttribute("MESSAGE_CODE_ARTICLE", message_code); // zde se cislo predava do jsp jako parametr pri presmerovani
        return "redirect:/";
    }


}
