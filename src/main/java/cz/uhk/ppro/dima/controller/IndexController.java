package cz.uhk.ppro.dima.controller;

import cz.uhk.ppro.dima.model.Article;
import cz.uhk.ppro.dima.model.Category;
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
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Optional;

@Controller
public class IndexController {
    private final UserService userService;
    private final ArticleService articleService;
    private final AuthenticationProvider authentication;

    @Autowired
    public IndexController(UserService userService, ArticleService articleService, AuthenticationProvider authenticationProvider) {
        this.userService = userService;
        this.articleService = articleService;
        this.authentication = authenticationProvider;
    }

    @RequestMapping(value ="/", method = RequestMethod.GET)
    public String showIndex( @ModelAttribute("article") Article article, ModelMap modelMap, HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("/index");
        if (authentication.getAuthentication().isAuthenticated()) {
            Optional<User> user = userService.findByUsername(authentication.getAuthentication().getName());
            if(user.isPresent()) {
                modelMap.put("loggedUserId", user.get().getId());
            }
        }

        PagedListHolder pagedListHolder = new PagedListHolder(articleService.findArticles());
        int page = ServletRequestUtils.getIntParameter(request,"p",0);
        pagedListHolder.setPage(page);
        pagedListHolder.setPageSize(5);
        modelMap.put("pagedListHolder", pagedListHolder);

        List<Category> categoryList;
        categoryList = articleService.findAllCategories();
        modelMap.put("categories", categoryList );
        return "index";
    }

    @RequestMapping(value ="/articles/categories/{categoryId}", method = RequestMethod.GET)
    public String showArticlesInCategory(@PathVariable("categoryId") int categoryId, @ModelAttribute("article") Article article, ModelMap modelMap, HttpServletRequest request){
        if (authentication.getAuthentication().isAuthenticated()) {
            Optional<User> user = userService.findByUsername(authentication.getAuthentication().getName());
            if(user.isPresent()) {
                modelMap.put("loggedUserId", user.get().getId());
            }
        }

        PagedListHolder pagedListHolder = new PagedListHolder(articleService.findArticlesInCategory(categoryId));
        int page = ServletRequestUtils.getIntParameter(request,"p",0);
        pagedListHolder.setPage(page);
        pagedListHolder.setPageSize(5);
        modelMap.put("pagedListHolder", pagedListHolder);

        List<Category> categoryList;
        categoryList = articleService.findAllCategories();
        modelMap.put("categories", categoryList );
        return "index";
    }
}
