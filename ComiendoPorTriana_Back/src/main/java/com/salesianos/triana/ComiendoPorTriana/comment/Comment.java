package com.salesianos.triana.ComiendoPorTriana.comment;

import com.salesianos.triana.ComiendoPorTriana.bar.model.Bar;
import com.salesianos.triana.ComiendoPorTriana.comment.pk.CommentPk;
import com.salesianos.triana.ComiendoPorTriana.user.model.User;
import lombok.*;
import org.springframework.data.annotation.CreatedBy;

import javax.persistence.*;
import java.util.UUID;

@Entity
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Builder
public class Comment {

    public Comment(CommentPk pk) {
        this.pk = pk;
    }

    @EmbeddedId
    private CommentPk pk;

    @ManyToOne()
    @MapsId("barId")
    private Bar bar;


    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private UUID id;

    @MapsId("userId")
    @ManyToOne()
    @CreatedBy
    private User author;

    private String title;

    private String body;

    /*public void addUser(User author){
        this.author = author;
        author.getComments().add(this);
    }

    public void removeUser(){
        author.getComments().remove(this);
        this.author = null;
    }*/

    public void addBar(Bar bar){
        this.bar = bar;
        bar.getComments().add(this);
    }

    public void removeBar() {
        bar.getComments().remove(this);
        this.bar = null;
    }




}
