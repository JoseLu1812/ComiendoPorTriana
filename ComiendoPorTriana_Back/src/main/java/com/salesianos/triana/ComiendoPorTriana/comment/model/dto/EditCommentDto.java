package com.salesianos.triana.ComiendoPorTriana.comment.model.dto;

import lombok.*;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
public class EditCommentDto {

    @NotBlank(message = "editComment.title.notblank")
    private String title;
    @NotBlank(message = "editComment.text.notblank")
    private String text;

}
