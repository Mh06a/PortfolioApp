package com.apps.PortfolioApp.DTO;

import com.apps.PortfolioApp.Model.Entity.Profile;

import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

public class ProfileDTO {
    // here I will Create Class variables :
    private Integer id;

    @NotBlank(message = "The full Name must not be blank")
    @Size(min = 4, max = 30)
    private String fullName;

    @NotBlank(message = "The specialization must not be blank")
    @Size(min = 4, max = 30)
    private String specialization;

    @NotBlank(message = "The bio must not be blank")
    @Size(min = 10, max = 100)
    private String bio;

    @NotBlank(message = "The profileImage must not be blank")
    @Size(max = 100)
    private String profileImage;

    @NotNull(message = "The yearsOfExperience must not be blank")
    @Min(value = 0, message = "Years of experience cannot be negative")
    @Max(value = 50, message = "Years of experience cannot exceed 50")
    private Integer yearsOfExperience;

    // here I will Create a constructor :
    public ProfileDTO() {
    }

    public ProfileDTO(Integer id,
            String fullName,
            String specialization,
            String bio,
            String profileImage,
            Integer yearsOfExperience) {

        this.id = id;
        this.fullName = fullName;
        this.specialization = specialization;
        this.bio = bio;
        this.profileImage = profileImage;
        this.yearsOfExperience = yearsOfExperience;
    }

    // getter && setter :
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

    // here I will Create a function to transfer data from entity to DTO :
    public static ProfileDTO fromEntityToDTO(Profile profile) {
        ProfileDTO profileDTO = new ProfileDTO();
        profileDTO.setId(profile.getId());
        profileDTO.setFullName(profile.getFullName());
        profileDTO.setSpecialization(profile.getSpecialization());
        profileDTO.setBio(profile.getBio());
        profileDTO.setProfileImage(profile.getProfileImage());
        profileDTO.setYearsOfExperience(profile.getYearsOfExperience());
        return profileDTO;
    }

    // here I will Create a function to transfer data from DTO to Entity :
    public static Profile fromDTOToEntity(ProfileDTO profileDTO) {
        Profile profile = new Profile();
        profile.setId(profileDTO.getId());
        profile.setFullName(profileDTO.getFullName());
        profile.setSpecialization(profileDTO.getSpecialization());
        profile.setBio(profileDTO.getBio());
        profile.setProfileImage(profileDTO.getProfileImage());
        profile.setYearsOfExperience(profileDTO.getYearsOfExperience());
        return profile;
    }

}
