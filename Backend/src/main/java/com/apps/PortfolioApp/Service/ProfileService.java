package com.apps.PortfolioApp.Service;

import org.springframework.stereotype.Service;

import com.apps.PortfolioApp.DTO.ProfileDTO;
import com.apps.PortfolioApp.ExceptionHandler.ProfileNotFoundException;
import com.apps.PortfolioApp.Model.Entity.Profile;
import com.apps.PortfolioApp.Repository.ProfileRepository;

@Service
public class ProfileService {
    // step1 ----> Create an object from ProfileRepository class :
    private final ProfileRepository profileRepository;

    // step2 here I will Create a constructor :
    public ProfileService(ProfileRepository profileRepository) {
        this.profileRepository = profileRepository;
    }

    // step3 ----> here I will Create a function to Insert to db :
    public ProfileDTO insertProfile(ProfileDTO profileDTO) {
        Profile profile = ProfileDTO.fromDTOToEntity(profileDTO);

        return ProfileDTO.fromEntityToDTO(profileRepository.save(profile));
    }

    // step4 ----> here I will Create a function to get profile by id :
    public ProfileDTO getProfileById(int id) {
        Profile profile = profileRepository.findById(id)
                .orElseThrow(() -> new ProfileNotFoundException("Profile not found with id : " + id));

        return ProfileDTO.fromEntityToDTO(profile);
    }

    // step6 ----> here I will Create a function update profile from db :
    public ProfileDTO updateProfile(int id, ProfileDTO profileDTO) {
        Profile profile = profileRepository.findById(id)
                .orElseThrow(() -> new ProfileNotFoundException("Profile not found with id : " + id));

        profile.setFullName(profileDTO.getFullName());
        profile.setSpecialization(profileDTO.getSpecialization());
        profile.setBio(profileDTO.getBio());
        profile.setYearsOfExperience(profileDTO.getYearsOfExperience());
        profile.setEmail(profileDTO.getEmail());
        profile.setGithubLink(profileDTO.getGithubLink());
        profile.setLinkedinLink(profileDTO.getLinkedinLink());
        return ProfileDTO.fromEntityToDTO(profileRepository.save(profile));
    }

    // step7 ----> here I will Create a function delete profile from db :
    public void deleteProfile(int id) {
        Profile profile = profileRepository.findById(id)
                .orElseThrow(() -> new ProfileNotFoundException("Profile not found with id : " + id));

        profileRepository.delete(profile);
    }

}
