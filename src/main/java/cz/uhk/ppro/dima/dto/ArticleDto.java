package cz.uhk.ppro.dima.dto;

import cz.uhk.ppro.dima.model.Topic;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.constraints.NotNull;
import java.util.List;

public class ArticleDto {

    private int id;

    @NotEmpty
    private String name;

    @NotEmpty
    private String text;

    @NotNull
    private List<MultipartFile> mpf;

    @NotNull
    private Topic topic;

    public ArticleDto() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public List<MultipartFile> getMpf() {
        return mpf;
    }

    public void setMpf(List<MultipartFile> mpf) {
        this.mpf = mpf;
    }

    public Topic getTopic() {
        return topic;
    }

    public void setTopic(Topic topic) {
        this.topic = topic;
    }
}
