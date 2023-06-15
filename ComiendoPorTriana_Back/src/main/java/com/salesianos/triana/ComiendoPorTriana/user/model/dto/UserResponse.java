package com.salesianos.triana.ComiendoPorTriana.user.model.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.salesianos.triana.ComiendoPorTriana.bar.model.Bar;
import com.salesianos.triana.ComiendoPorTriana.user.model.User;
import com.salesianos.triana.ComiendoPorTriana.user.model.UserRole;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;
import org.springframework.security.core.userdetails.UserDetails;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.UUID;


@Data
@NoArgsConstructor
@AllArgsConstructor
@SuperBuilder
public class UserResponse {

    protected UUID id;
    protected String username, fullName, email;
    protected Set<UserRole> roles;
    private List<Bar> favList = new ArrayList<>();

    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "dd/MM/yyyy HH:mm:ss")
    protected LocalDateTime createdAt;



    public static UserResponse fromUser(User user) {

        return UserResponse.builder()
                .id(user.getId())
                .username(user.getUsername())
                .fullName(user.getFullName())
                .email(user.getEmail())
                .favList(user.getFavList())
                .roles(user.getRoles())
                .createdAt(user.getCreatedAt())
                .build();
    }


}
