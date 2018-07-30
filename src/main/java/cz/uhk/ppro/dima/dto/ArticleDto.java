package cz.uhk.ppro.dima.dto;

import cz.uhk.ppro.dima.model.Topic;
import lombok.Data;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.constraints.NotNull;
import java.util.List;

public @Data
class ArticleDto {

    private int id;

    @NotEmpty
    private String name;

    @NotEmpty
    private String text;

    @NotNull
    private List<MultipartFile> mpf;

    @NotNull
    private Topic topic;


}
