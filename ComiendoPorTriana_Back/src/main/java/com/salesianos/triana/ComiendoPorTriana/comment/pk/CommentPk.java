package com.salesianos.triana.ComiendoPorTriana.comment.pk;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Embeddable;
import java.io.Serializable;
import java.util.UUID;

@Embeddable
@AllArgsConstructor
@NoArgsConstructor
@Data
public class CommentPk implements Serializable {

    public UUID barId;
    public UUID userId;
}
