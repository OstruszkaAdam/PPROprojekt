package cz.uhk.ppro.dima.controller;

import cz.uhk.ppro.dima.model.Article;
import cz.uhk.ppro.dima.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Optional;

@Controller
@RequestMapping("/articleImage")
public class ImageController {

    private final ArticleService articleService;

    @Autowired
    public ImageController(ArticleService articleService) {
        this.articleService = articleService;

    }

    @RequestMapping(value = "/imageDisplay", method = RequestMethod.GET)
    public void showImage(@RequestParam("articleId") int articleId, HttpServletResponse response, HttpServletRequest request)
            throws ServletException, IOException {

        Optional<Article> a = articleService.findById(articleId);
        response.setContentType("image/jpeg, image/jpg, image/png, image/gif");
        //if(a.isPresent()) response.getOutputStream().write(a.get().getImage());

        response.getOutputStream().close();
    }

}