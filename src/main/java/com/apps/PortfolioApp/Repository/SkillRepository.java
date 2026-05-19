package com.apps.PortfolioApp.Repository;

import com.apps.PortfolioApp.Model.Entity.Skill;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface SkillRepository extends JpaRepository<Skill , Integer> {
    // here I will Create a Header of the functions :
    Optional<Skill> findByName(String name) ;
}
