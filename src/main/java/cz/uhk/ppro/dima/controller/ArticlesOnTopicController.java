package cz.uhk.ppro.dima.controller;

import cz.uhk.ppro.dima.model.Article;
import cz.uhk.ppro.dima.model.Topic;
import cz.uhk.ppro.dima.model.User;
import cz.uhk.ppro.dima.security.AuthenticationProvider;
import cz.uhk.ppro.dima.service.ArticleService;
import cz.uhk.ppro.dima.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Optional;

@Controller
public class ArticlesOnTopicController{
    private final UserService userService;
    private final ArticleService articleService;
    private final AuthenticationProvider authentication;

    @Autowired
    public ArticlesOnTopicController(UserService userService, ArticleService articleService, AuthenticationProvider authenticationProvider) {
        this.userService = userService;
        this.articleService = articleService;
        this.authentication = authenticationProvider;
    }

    @RequestMapping(value ="/{topicName}", method = RequestMethod.GET)
    public String showArticlesOnTopic(@PathVariable("topicName") String topicName, @ModelAttribute("article") Article article, ModelMap modelMap, HttpServletRequest request){

        if (authentication.getAuthentication().isAuthenticated()) {
            Optional<User> user = userService.findByUsername(authentication.getAuthentication().getName());
            if(user.isPresent()) {
                modelMap.put("loggedUserId", user.get().getId());
            }
        }

        PagedListHolder pagedListHolder = new PagedListHolder(articleService.findArticlesOnTopicByName(topicName));
        int page = ServletRequestUtils.getIntParameter(request,"p",0);
        pagedListHolder.setPage(page);
        pagedListHolder.setPageSize(5);
        modelMap.put("pagedListHolder", pagedListHolder);

        //vyhledavani nazvu temat pro predani do jsp TODO DODĚLAT VYHLEDAVANI PRO MENU
        List<Topic> topicList = articleService.findAllTopics();
        String topicUrlName;
        String name = "";
        for(Topic topic : topicList){
            topicUrlName = topic.getUrlName();
            if (topicUrlName.equals(topicName)) name = topic.getName();
        }

        System.out.println("posilame do jmena " + name);
        modelMap.put("topicName", name);
        modelMap.put("topics", topicList);
        return "articlesOnTopic";
    }
}
