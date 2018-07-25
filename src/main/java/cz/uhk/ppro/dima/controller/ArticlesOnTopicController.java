package cz.uhk.ppro.dima.controller;

import cz.uhk.ppro.dima.model.Article;
import cz.uhk.ppro.dima.model.Topic;
import cz.uhk.ppro.dima.model.User;
import cz.uhk.ppro.dima.repository.TopicRepository;
import cz.uhk.ppro.dima.security.AuthenticationProvider;
import cz.uhk.ppro.dima.service.ArticleService;
import cz.uhk.ppro.dima.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Optional;

@Controller
public class ArticlesOnTopicController{
    private final UserService userService;
    private final ArticleService articleService;
    private final TopicRepository topicRepository;
    private final AuthenticationProvider authentication;

    @Autowired
    public ArticlesOnTopicController(UserService userService, ArticleService articleService, TopicRepository topicRepository, AuthenticationProvider authenticationProvider) {
        this.userService = userService;
        this.articleService = articleService;
        this.topicRepository = topicRepository;
        this.authentication = authenticationProvider;
    }

    @RequestMapping(value ="/topics/{topicName}", method = RequestMethod.GET)
    public String showArticlesOnTopic(@PathVariable("topicName") String topicName, @ModelAttribute("article") Article article, ModelMap modelMap, HttpServletRequest request){

        if (authentication.getAuthentication().isAuthenticated()) {
            Optional<User> user = userService.findByUsername(authentication.getAuthentication().getName());
            if(user.isPresent()) modelMap.put("loggedUserId", user.get().getId());
        }

        List topList = topicRepository.findByUrlName(topicName);
        if (topList.isEmpty()) return "error";

        PagedListHolder pagedListHolder = new PagedListHolder(articleService.findArticlesOnTopicByName(topicName));
        int page = ServletRequestUtils.getIntParameter(request,"p",0);
        pagedListHolder.setPage(page);
        pagedListHolder.setPageSize(5);
        modelMap.put("pagedListHolder", pagedListHolder);

        //vyhledani nazvu temat pro menu
        List<Topic> topicList = articleService.findAllTopics();
        modelMap.put("topics", topicList);

        //vyhledani jmena aktualne zobrazovaneho tematu
        String topicUrlName;
        String name = "";
        for(Topic topic : topicList){
            topicUrlName = topic.getUrlName();
            if (topicUrlName.equals(topicName)) name = topic.getName();
        }

        modelMap.put("topicName", name);

        return "articlesOnTopic";
    }

}
