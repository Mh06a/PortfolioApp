package com.apps.PortfolioApp.DTO;

import com.apps.PortfolioApp.Model.Entity.Project;
import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.NotBlank;

public class ProjectDTO {
    //  here I will Create Class variables :
    private int id ;
    @NotBlank(message = "The project name must not be empty")
    @Max(50)
    private String name;
    // ---------------
    @NotBlank(message = "The project description must not be empty")
    @Max(100)
    private String description;
    // ---------------
    @NotBlank(message = "The project techStack must not be empty")
    @Max(50)
    private String techStack;
    // ---------------
    @NotBlank(message = "The project githubLink must not be empty")
    @Max(100)
    private String githubLink;

    // here I will Create a constructor :
    public ProjectDTO() {}

    public ProjectDTO(int id, String name, String description, String techStack, String githubLink) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.techStack = techStack;
        this.githubLink = githubLink;
    }

    // Getter && Setter
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getTechStack() {
        return techStack;
    }

    public void setTechStack(String techStack) {
        this.techStack = techStack;
    }

    public String getGithubLink() {
        return githubLink;
    }

    public void setGithubLink(String githubLink) {
        this.githubLink = githubLink;
    }


    // here I will Create a function to transfer data from entity to DTO :
    public static ProjectDTO fromEntityToDTO(Project project) {
        ProjectDTO projectDTO = new ProjectDTO();
        projectDTO.setId(project.getId());
        projectDTO.setName(project.getName());
        projectDTO.setDescription(project.getDescription());
        projectDTO.setTechStack(project.getTechStack());
        projectDTO.setGithubLink(project.getGithubLink());
        return projectDTO;
    }

    // here I will Create a function to transfer data from DTO to Entity :
    public static Project fromDTOToEntity(ProjectDTO projectDTO) {
        Project project = new Project();
        project.setId(projectDTO.getId());
        project.setName(projectDTO.getName());
        project.setDescription(projectDTO.getDescription());
        project.setTechStack(projectDTO.getTechStack());
        project.setGithubLink(projectDTO.getGithubLink());
        return project;
    }
}