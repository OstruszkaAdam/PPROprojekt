package cz.uhk.ppro.dima.dto;

import lombok.Data;
import org.hibernate.validator.constraints.NotEmpty;

public @Data
class UserDto {

    @NotEmpty
    private String username;

    @NotEmpty
    private String password;

    @NotEmpty
    private String passwordRepeat;

    @NotEmpty
    private String email;

    @NotEmpty
    private String firstName;

    @NotEmpty
    private String lastName;


}

