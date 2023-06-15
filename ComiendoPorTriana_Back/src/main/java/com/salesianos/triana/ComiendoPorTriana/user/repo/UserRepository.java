package com.salesianos.triana.ComiendoPorTriana.user.repo;

import com.salesianos.triana.ComiendoPorTriana.bar.model.Bar;
import com.salesianos.triana.ComiendoPorTriana.user.model.User;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

public interface UserRepository extends JpaRepository<User, UUID> {

    Optional<User> findFirstByUsername(String username);

    Optional<User> findFirstById(UUID id);

   /* @EntityGraph(value = "user-entity-graph", type = EntityGraph.EntityGraphType.LOAD)
    List<Bar> findFavList();
*/
}
