package com.salesianos.triana.ComiendoPorTriana.bar.repo;

import com.salesianos.triana.ComiendoPorTriana.bar.model.Bar;
import com.salesianos.triana.ComiendoPorTriana.user.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;


import java.util.UUID;

public interface BarRepository extends JpaRepository<Bar, UUID>, JpaSpecificationExecutor<Bar> {

}
