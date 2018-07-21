package cz.uhk.ppro.dima.dto;

import cz.uhk.ppro.dima.model.Category;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.constraints.NotNull;
import java.util.List;

public class ArticleDto {

    private int id;

    @NotEmpty
    private String name;

    @NotEmpty
    private String description;

    @NotNull
    private List<MultipartFile> mpf;

    @NotNull
    private Category category;

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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public List<MultipartFile> getMpf() {
        return mpf;
    }

    public void setMpf(List<MultipartFile> mpf) {
        this.mpf = mpf;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }
}
