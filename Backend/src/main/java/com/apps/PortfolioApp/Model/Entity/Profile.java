package com.apps.PortfolioApp.Model.Entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "profiles")
public class Profile {
    // here I will Create Class variables :
    @Setter
    @Getter
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @Setter
    @Getter
    private String fullName;
    @Setter
    @Getter
    private String specialization;
    @Setter
    @Getter
    private String bio;
    @Setter
    @Getter
    private Integer yearsOfExperience;
    @Setter
    @Getter
    String email ;
    @Setter
    @Getter
    String githubLink;
    @Setter
    @Getter
    String linkedinLink;

    // here I will Create a constructor :
    public Profile() {
    }

    public Profile(Integer id, String fullName, String specialization, String bio,
            int yearsOfExperience , String email ,  String githubLink ,  String linkedinLink) {
        this.id = id;
        this.fullName = fullName;
        this.specialization = specialization;
        this.bio = bio;
        this.yearsOfExperience = yearsOfExperience;
        this.email = email;
        this.githubLink = githubLink ;
        this.linkedinLink = linkedinLink;
    }

}
