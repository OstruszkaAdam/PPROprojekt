package cz.uhk.ppro.dima.dto;

import lombok.Data;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.constraints.NotNull;
import java.util.List;

public @Data
class GraphDto {

    private int id;

    @NotEmpty
    private String name;

    private String description;

    @NotNull
    private List<MultipartFile> mpf;


}
