package com.apps.PortfolioApp.Repository;

import com.apps.PortfolioApp.Model.Entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.Optional;

public interface UserRepository extends JpaRepository<User , Integer> {
    //here I will Create a Header of the function :
    Optional<User> findByUsername(String username);
}
