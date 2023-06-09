package com.salesianos.triana.ComiendoPorTriana.user.model.dto;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.salesianos.triana.ComiendoPorTriana.bar.model.dto.BarDto;
import com.salesianos.triana.ComiendoPorTriana.comment.Comment;
import com.salesianos.triana.ComiendoPorTriana.bar.model.Bar;
import com.salesianos.triana.ComiendoPorTriana.user.model.User;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
@SuperBuilder
@JsonInclude(JsonInclude.Include.NON_NULL)
public class JwtUserResponse extends UserResponse {

    private String token;

    public JwtUserResponse(UserResponse userResponse) {
        id = userResponse.getId();
        username = userResponse.getUsername();
        fullName = userResponse.getFullName();
        email = userResponse.getEmail();
        List<Bar> favList = userResponse.getFavList();
        createdAt = userResponse.getCreatedAt();
        roles = userResponse.getRoles();
    }

    public static JwtUserResponse of (User user, String token) {
        JwtUserResponse result = new JwtUserResponse(UserResponse.fromUser(user));
        result.setToken(token);
        return result;

    }

}
