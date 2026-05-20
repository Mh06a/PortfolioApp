package com.apps.PortfolioApp.Service;

import com.apps.PortfolioApp.DTO.ProjectDTO;
import com.apps.PortfolioApp.Model.Entity.Project;
import com.apps.PortfolioApp.Repository.ProjectRepository;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Optional;

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
        List<Project> projects = projectRepository.findAll();
        return projects.stream().map(ProjectDTO::fromEntityToDTO).toList();
    }


    // step5 ----> here I will Create a function to get a project by id :
    public ProjectDTO getProjectByID(int id) {
        Optional<Project> projectOptional = projectRepository.findById(id);
        if (projectOptional.isPresent()) {
            return ProjectDTO.fromEntityToDTO(projectOptional.orElse(null));
        }
        else
            return null;
    }


    // step6 ----> here I will Create a function update a project from db :
    public ProjectDTO updateProject(ProjectDTO projectDTO) {
        Project project = projectRepository.findById(projectDTO.getId()).orElseThrow();
        project.setName(projectDTO.getName());
        project.setDescription(projectDTO.getDescription());
        project.setTechStack(projectDTO.getTechStack());
        project.setGithubLink(projectDTO.getGithubLink());
        return ProjectDTO.fromEntityToDTO(projectRepository.save(project));
    }


    // step7 ----> here I will Create a function delete a project from db :
    public void deleteProject(int id) {
        projectRepository.deleteById(id);
    }


    // step8 ----> here I will Create a function to find by Skill name :
    public ProjectDTO getProjectByName(String name) {
        Optional<Project> projectOptional = projectRepository.findByName(name);
        if (projectOptional.isPresent()) {
            return ProjectDTO.fromEntityToDTO(projectOptional.orElse(null)) ;
        }
        else
            return  null;
    }

}