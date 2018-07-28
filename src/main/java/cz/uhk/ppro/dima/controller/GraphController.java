package cz.uhk.ppro.dima.controller;

import cz.uhk.ppro.dima.dto.GraphDto;
import cz.uhk.ppro.dima.model.Graph;
import cz.uhk.ppro.dima.model.Topic;
import cz.uhk.ppro.dima.model.User;
import cz.uhk.ppro.dima.security.AuthenticationProvider;
import cz.uhk.ppro.dima.service.ArticleService;
import cz.uhk.ppro.dima.service.GraphService;
import cz.uhk.ppro.dima.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
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

    @RequestMapping(value = "/graph/{graphId}", method = RequestMethod.GET)
    public ModelAndView showGraph(@PathVariable("graphId") int graphId) {
        ModelAndView mav = new ModelAndView("graphDetail");

        Optional<User> loggedUser = userService.findByUsername(authentication.getAuthentication().getName());
        if (loggedUser.isPresent()) mav.addObject("loggedUserId", loggedUser.get().getId());

        Optional<Graph> graph = graphService.findById(graphId);

        //vyhledani nazvu temat pro menu
        List<Topic> topicList = articleService.findAllTopics();
        mav.addObject("topics", topicList);

        //presmerovani na 404 pokud zadny takovy graf neexistuje
        if (!graph.isPresent()) {
            ModelAndView newMav = new ModelAndView("redirect:/topics/notfound");
            newMav.addObject("topics", topicList);
            return newMav;
        } else {
            mav.addObject("graph", graph.get());
            mav.addObject("description", graph.get().getDescription());
        }

        return mav;
    }


    @RequestMapping(value = "/graph/new", method = RequestMethod.GET)
    public ModelAndView algoritmus() {

        ModelAndView mav = new ModelAndView("graphEditor");

        Optional<User> loggedUser = userService.findByUsername(authentication.getAuthentication().getName());
        if (loggedUser.isPresent()) mav.addObject("loggedUserId", loggedUser.get().getId());

        GraphDto graphDto = new GraphDto();
        mav.addObject("graphDto", graphDto);

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
        if (loggedUser.isPresent()) graphService.saveGraph(graphDto, loggedUser.get());
        {
            //nalezeni posledniho id pro zobrazeni posledniho pridaneho grafu
            List<Graph> GraphList = graphService.findGraphs();
            Integer redirectId = GraphList.size();
            return redirectSuccess(redirectAttributes, redirectId);
        }
    }

    @RequestMapping(value = "/graphs/delete/{graphId}", method = RequestMethod.POST)
    public String deleteGraph(@PathVariable("graphId") int graphId, RedirectAttributes redirectAttributes) {
        Optional<User> loggedUser = userService.findByUsername(authentication.getAuthentication().getName());
        if (loggedUser.isPresent()) ;
        {
            graphService.remove(graphId);
            Optional<User> foundUser = userService.findById(loggedUser.get().getId());
            int userID = foundUser.get().getId();
            return "redirect:/users/" + userID;
        }
    }

    private String redirectError(RedirectAttributes redirectAttributes) {
        message_code = 0; // toto cislo se preda do jsp a v zavislosti na nem se vypise hlaska
        redirectAttributes.addFlashAttribute("MESSAGE_CODE_GRAPH", message_code); // zde se cislo predava do jsp jako parametr pri presmerovani
        return "redirect:/graph/{graphName}/edit?error=true";
    }

    private String redirectSuccess(RedirectAttributes redirectAttributes, Integer graphId) {
        message_code = 1; // toto cislo se preda do jsp a v zavislosti na nem se vypise hlaska
        redirectAttributes.addFlashAttribute("MESSAGE_CODE_GRAPH", message_code); // zde se cislo predava do jsp jako parametr pri presmerovani
        return "redirect:/graph/" + graphId;
    }
    
}
