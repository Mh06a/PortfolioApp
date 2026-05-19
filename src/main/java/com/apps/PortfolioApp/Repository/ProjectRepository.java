package com.apps.PortfolioApp.Repository;

import com.apps.PortfolioApp.Model.Entity.Project;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface ProjectRepository extends JpaRepository<Project , Integer> {
    // here I will Create a Header of the functions :
    Optional<Project> findByName(String name) ;
}
