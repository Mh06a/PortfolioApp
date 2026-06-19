package com.apps.PortfolioApp.Repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.apps.PortfolioApp.Model.Entity.Profile;
import com.apps.PortfolioApp.Model.Entity.Project;
import java.util.Optional;

public interface ProfileRepository extends JpaRepository<Profile, Integer> {
    // here I will Create a Header of the functions :
    Optional<Project> findByFullName(String fullName);
}
