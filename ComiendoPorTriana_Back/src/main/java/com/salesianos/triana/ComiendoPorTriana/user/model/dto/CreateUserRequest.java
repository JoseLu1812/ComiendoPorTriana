package com.salesianos.triana.ComiendoPorTriana.user.model.dto;

import com.salesianos.triana.ComiendoPorTriana.validation.annotation.ValidPassword;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;


@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class CreateUserRequest {

    @NotEmpty(message = "createUserRequest.username.notempty")
    private String username;

    @ValidPassword
    private String password;

    @ValidPassword
    private String verifyPassword;

    @NotBlank(message = "createUserRequest.fullname.notblank")
    private String fullName;

}
