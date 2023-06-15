package com.salesianos.triana.ComiendoPorTriana.bar.model.dto;

import com.salesianos.triana.ComiendoPorTriana.bar.model.Bar;
import com.salesianos.triana.ComiendoPorTriana.comment.dto.CommentResponseDto;
import com.salesianos.triana.ComiendoPorTriana.user.model.User;
import lombok.*;
import org.hibernate.LazyInitializationException;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Builder
public class BarDto {

    private UUID id;

    private String name;

    private String description;

    private User owner;

    private String address;

    private List<CommentResponseDto> comments;

    private String image;

    private double lat;

    private double lng;

    public static BarDto of(Bar b) {
        List<CommentResponseDto> comments = new ArrayList<>();
        try{
            comments = b.getComments().stream().map(CommentResponseDto::of).toList();
        } catch(LazyInitializationException exc) {
            comments = new ArrayList<>();
        }
        return BarDto.builder()
                .id(b.getId())
                .name(b.getName())
                .description(b.getDescription())
                .owner(b.getOwner())
                .address(b.getAddress())
                .comments(comments)
                .image(b.getImage())
                .lat(b.getLat())
                .lng(b.getLng())
                .build();
    }

}
