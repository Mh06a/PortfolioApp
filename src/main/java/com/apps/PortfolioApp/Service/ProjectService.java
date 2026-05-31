package com.apps.PortfolioApp.Service;

import com.apps.PortfolioApp.DTO.ProjectDTO;
import com.apps.PortfolioApp.ExceptionHandler.DuplicateProjectException;
import com.apps.PortfolioApp.ExceptionHandler.ProjectNotFoundException;
import com.apps.PortfolioApp.Model.Entity.Project;
import com.apps.PortfolioApp.Repository.ProjectRepository;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class ProjectService {

    // step1 ----> Create an object from ProjectRepository class :
    private final ProjectRepository projectRepository;


    // step2 ----> Create a con :
    public ProjectService(ProjectRepository projectRepository) {
        this.projectRepository = projectRepository ;
    }


    // step3 ----> here I will Create a function to Insert to db :
    public ProjectDTO insertProject(ProjectDTO projectDTO) {
        Project project = ProjectDTO.fromDTOToEntity(projectDTO);
        return ProjectDTO.fromEntityToDTO(projectRepository.save(project));
    }


    // step4 ----> here I will Create a function to get all projects from db :
    public List<ProjectDTO> getAllProjects() {
        if (projectRepository.findAll().isEmpty()) {
            throw new ProjectNotFoundException("You don't have any project");
        }
        else {
            List<Project> projects = projectRepository.findAll();
            return projects.stream().map(ProjectDTO::fromEntityToDTO).toList();
        }
    }


    // step5 ----> here I will Create a function to get a project by id :
    public ProjectDTO getProjectByID(int id) {
        Project project = projectRepository.findById(id).orElseThrow(
                () -> new ProjectNotFoundException("Project not found with id: " + id)
        );
        return ProjectDTO.fromEntityToDTO(project);
    }


    // step6 ----> here I will Create a function update a project from db :
    public ProjectDTO updateProject(String name ,ProjectDTO projectDTO) {
        Project project = projectRepository.findByName(name).orElseThrow(
                () -> new ProjectNotFoundException("Project not found with name: " + name)
        );
        project.setName(projectDTO.getName());
        project.setDescription(projectDTO.getDescription());
        project.setTechStack(projectDTO.getTechStack());
        project.setGithubLink(projectDTO.getGithubLink());
        return ProjectDTO.fromEntityToDTO(projectRepository.save(project));
    }


    // step7 ----> here I will Create a function delete a project from db :
    public void deleteProject(int id) {
        Project project = projectRepository.findById(id).orElseThrow(
                () -> new ProjectNotFoundException("Project not found with id: " + id)
        );
        projectRepository.delete(project);
    }


    // step8 ----> here I will Create a function to find by Skill name :
    public ProjectDTO getProjectByName(String name) {
        Project project = projectRepository.findByName(name).orElseThrow(
                () -> new ProjectNotFoundException("Project not found with project name: " + name)
        );
        return ProjectDTO.fromEntityToDTO(project);
    }

}