package com.salesianos.triana.ComiendoPorTriana.user.model.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotEmpty;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class LoginRequest {

    @NotEmpty(message = "loginRequest.username.notempty")
    private String username;
    @NotEmpty(message = "loginRequest.password.notempty")
    private String password;

}
