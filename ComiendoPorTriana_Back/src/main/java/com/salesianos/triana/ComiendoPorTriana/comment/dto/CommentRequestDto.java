package com.salesianos.triana.ComiendoPorTriana.comment.dto;

import lombok.Builder;
import lombok.Value;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Positive;

@Builder
@Value
public class CommentRequestDto {

    private String title;
    private String body;
}
