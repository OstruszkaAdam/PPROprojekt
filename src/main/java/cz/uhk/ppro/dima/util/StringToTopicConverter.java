package cz.uhk.ppro.dima.util;

import cz.uhk.ppro.dima.model.Topic;
import cz.uhk.ppro.dima.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

@Component
public class StringToTopicConverter implements Converter<String, Topic> {
    private ArticleService articleService;

    @Autowired
    public StringToTopicConverter(ArticleService articleService) {
        this.articleService = articleService;
    }

    @Override
    public Topic convert(String s) {
        return articleService.findTopicByName(s);
    }
}
