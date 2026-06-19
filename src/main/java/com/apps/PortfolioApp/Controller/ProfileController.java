package com.apps.PortfolioApp.Controller;

import org.springframework.web.bind.annotation.*;
import com.apps.PortfolioApp.DTO.ProfileDTO;
import com.apps.PortfolioApp.Service.ProfileService;
import jakarta.validation.Valid;

@RestController
@RequestMapping("/profiles")
public class ProfileController {
    // Step1 ----> Create an object from profile Service class :
    private final ProfileService profileService;

    // Step2 ----> here I will Create a constructor :
    public ProfileController(ProfileService profileService) {
        this.profileService = profileService;
    }

    // step3 ----> create a function to save the profile to db:
    @PostMapping
    public ProfileDTO insert(@RequestBody @Valid ProfileDTO profileDTO) {
        return profileService.insertProfile(profileDTO);
    }

    // step5 ----> create a function to get the Specific profile by id from db:
    @GetMapping("/{id}")
    public ProfileDTO getById(@PathVariable int id) {
        return profileService.getProfileById(id);
    }

    // step7 ----> create a function to update the profile to db:
    @PutMapping("/{id}")
    public ProfileDTO update(@PathVariable int id, @RequestBody @Valid ProfileDTO profileDTO) {

        return profileService.updateProfile(id, profileDTO);
    }

    // step8----> create a function to delete the Specific profile by id from db:
    @DeleteMapping("/{id}")
    public void delete(@PathVariable int id) {
        profileService.deleteProfile(id);
    }
}
