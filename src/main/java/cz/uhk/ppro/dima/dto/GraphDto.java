package cz.uhk.ppro.dima.dto;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.constraints.NotNull;
import java.util.List;

public class GraphDto {

    private int id;

    @NotEmpty
    private String name;

    private String description;

    @NotNull
    private List<MultipartFile> mpf;


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

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public GraphDto() {
    }
}
