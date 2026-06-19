package com.apps.PortfolioApp.Model.Entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "profiles")
public class Profile {
    // here I will Create Class variables :
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String fullName;
    private String specialization;
    private String bio;
    private String profileImage;
    private Integer yearsOfExperience;

    // here I will Create a constructor :
    public Profile() {
    }

    public Profile(Integer id, String fullName, String specialization, String bio, String profileImage,
            int yearsOfExperience) {
        this.id = id;
        this.fullName = fullName;
        this.specialization = specialization;
        this.bio = bio;
        this.profileImage = profileImage;
        this.yearsOfExperience = yearsOfExperience;
    }

    // getter && setter
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getSpecialization() {
        return specialization;
    }

    public void setSpecialization(String specialization) {
        this.specialization = specialization;
    }

    public String getBio() {
        return bio;
    }

    public void setBio(String bio) {
        this.bio = bio;
    }

    public String getProfileImage() {
        return profileImage;
    }

    public void setProfileImage(String profileImage) {
        this.profileImage = profileImage;
    }

    public Integer getYearsOfExperience() {
        return yearsOfExperience;
    }

    public void setYearsOfExperience(Integer yearsOfExperience) {
        this.yearsOfExperience = yearsOfExperience;
    }

}
