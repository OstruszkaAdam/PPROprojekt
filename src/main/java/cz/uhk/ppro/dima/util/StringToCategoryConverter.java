package cz.uhk.ppro.dima.util;

import cz.uhk.ppro.dima.model.Category;
import cz.uhk.ppro.dima.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

@Component
public class StringToCategoryConverter implements Converter<String, Category> {
    private ArticleService articleService;

    @Autowired
    public StringToCategoryConverter(ArticleService articleService) {
        this.articleService = articleService;
    }

    @Override
    public Category convert(String s) {
        return articleService.findCategoryByName(s);
    }
}
