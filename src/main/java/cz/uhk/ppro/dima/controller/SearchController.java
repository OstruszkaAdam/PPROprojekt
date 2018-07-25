package cz.uhk.ppro.dima.controller;

import cz.uhk.ppro.dima.model.Topic;
import cz.uhk.ppro.dima.model.User;
import cz.uhk.ppro.dima.repository.SearchRepository;
import cz.uhk.ppro.dima.service.ArticleService;
import cz.uhk.ppro.dima.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.boot.context.config.ResourceNotFoundException;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Optional;

@Controller
public class SearchController {

    private final SearchRepository searchRepository;
    private final ArticleService articleService;
    private final UserService userService;

    @Autowired
    public SearchController(SearchRepository searchRepository, ArticleService articleService, UserService userService) {
        this.searchRepository = searchRepository;
        this.articleService = articleService;
        this.userService = userService;
    }

    @RequestMapping("/search")
    public String search(String q, Model model, HttpServletRequest request) {
        model.addAttribute("searchQuery", q);

        List searchResults = null;

        try {
            searchResults = searchRepository.search(q);
        } catch (Exception e) {
            e.printStackTrace();
        }

        PagedListHolder pagedListHolder = new PagedListHolder(searchResults);
        int page = ServletRequestUtils.getIntParameter(request,"p",0);
        pagedListHolder.setPage(page);
        pagedListHolder.setPageSize(5);
        model.addAttribute("pagedListHolder", pagedListHolder);

        //vyhledani nazvu temat pro menu
        List<Topic> topicList = articleService.findAllTopics();
        model.addAttribute("topics", topicList);

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication.isAuthenticated()) {
            Optional<User> user = userService.findByUsername(authentication.getName());
            if(user.isPresent()) {
                model.addAttribute("loggedUserId", user.get().getId());
            }
        }

        return "searchResults";

    }


}
