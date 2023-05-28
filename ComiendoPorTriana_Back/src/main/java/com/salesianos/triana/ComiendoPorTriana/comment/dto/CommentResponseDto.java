package com.salesianos.triana.ComiendoPorTriana.comment.dto;

import com.salesianos.triana.ComiendoPorTriana.comment.Comment;
import lombok.Builder;
import lombok.Value;

@Builder
@Value
public class CommentResponseDto {

    private String username;

    private String barName;

    private String title;

    private String body;


    public static CommentResponseDto of(Comment c){
        return CommentResponseDto.builder()
                .username(c.getAuthor().getUsername())
                .barName(c.getBar().getName())
                .title(c.getTitle())
                .body(c.getBody())
                .build();
    }

}
