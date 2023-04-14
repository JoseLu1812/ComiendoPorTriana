package com.salesianos.triana.ComiendoPorTriana.bar.model.dto;

import com.salesianos.triana.ComiendoPorTriana.bar.model.Bar;
import com.salesianos.triana.ComiendoPorTriana.user.model.User;
import lombok.*;

import javax.persistence.Column;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
public class CreateBarDto {

    @NotBlank(message = "createBar.name.notblank")
    private String name;

    @NotBlank(message = "createBar.description.notblank")
    private String description;

    private User owner;

    @NotEmpty(message = "createBar.address.notempty")
    private String address;

    private String image;






}
