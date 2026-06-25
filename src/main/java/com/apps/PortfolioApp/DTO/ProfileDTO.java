package com.apps.PortfolioApp.DTO;

import com.apps.PortfolioApp.Model.Entity.Profile;

import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;

public class ProfileDTO {
    // here I will Create Class variables :
    @Setter
    @Getter
    private Integer id;

    @Setter
    @Getter
    @NotBlank(message = "The full Name must not be blank")
    @Size(min = 4, max = 30)
    private String fullName;

    @Setter
    @Getter
    @NotBlank(message = "The specialization must not be blank")
    @Size(min = 4, max = 30)
    private String specialization;

    @Setter
    @Getter
    @NotBlank(message = "The bio must not be blank")
    @Size(min = 10, max = 100)
    private String bio;

    @Setter
    @Getter
    @NotBlank(message = "The profileImage must not be blank")
    @Size(max = 100)
    private String profileImage;

    @Setter
    @Getter
    @NotNull(message = "The yearsOfExperience must not be blank")
    @Min(value = 0, message = "Years of experience cannot be negative")
    @Max(value = 50, message = "Years of experience cannot exceed 50")
    private Integer yearsOfExperience;

    @Setter
    @Getter
    @NotBlank(message = "The email must not be blank")
    @Size(max = 100)
    private String email;

    @Setter
    @Getter
    @NotBlank(message = "The email must not be blank")
    @Size(max = 100)
    private String githubLink;

    @Setter
    @Getter
    @NotBlank(message = "The email must not be blank")
    @Size(max = 100)
    private String linkedinLink;

    // here I will Create a constructor :
    public ProfileDTO() {
    }

    public ProfileDTO(Integer id,  String fullName,  String specialization,
            String bio, String profileImage, Integer yearsOfExperience,
            String email , String githubLink , String linkedinLink) {

        this.id = id;
        this.fullName = fullName;
        this.specialization = specialization;
        this.bio = bio;
        this.profileImage = profileImage;
        this.yearsOfExperience = yearsOfExperience;
        this.email = email ;
        this.githubLink = githubLink;
        this.linkedinLink = linkedinLink;
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
        profileDTO.setEmail(profile.getEmail());
        profileDTO.setGithubLink(profile.getGithubLink());
        profileDTO.setLinkedinLink(profile.getLinkedinLink());
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
        profile.setEmail(profileDTO.getEmail());
        profile.setGithubLink(profileDTO.getGithubLink());
        profile.setLinkedinLink(profileDTO.getLinkedinLink());
        return profile;
    }

}
