package com.salesianos.triana.ComiendoPorTriana.bar.model.dto;

import com.salesianos.triana.ComiendoPorTriana.bar.model.Bar;
import com.salesianos.triana.ComiendoPorTriana.user.model.User;
import lombok.*;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
public class EditBarDto {

    @NotBlank(message = "editBar.name.notblank")
    private String name;
    @NotBlank(message = "editBar.description.notblank")
    private String description;
    @NotEmpty(message = "editBar.address.notempty")
    private String address;

    private String image;


    public static EditBarDto of(Bar b) {
        return EditBarDto.builder()
                .name(b.getName())
                .description(b.getDescription())
                .address(b.getAddress())
                .image(b.getImage())
                .build();
    }

    public static Bar toBar(EditBarDto dto) {
        return Bar.builder()
                .name(dto.name)
                .description(dto.getDescription())
                .address(dto.getAddress())
                .image(dto.getImage())
                .build();
    }

}
