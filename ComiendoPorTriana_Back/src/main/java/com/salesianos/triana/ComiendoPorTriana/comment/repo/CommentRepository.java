package com.salesianos.triana.ComiendoPorTriana.comment.repo;

import com.salesianos.triana.ComiendoPorTriana.comment.Comment;
import com.salesianos.triana.ComiendoPorTriana.comment.pk.CommentPk;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CommentRepository extends JpaRepository<Comment, CommentPk> {
}
