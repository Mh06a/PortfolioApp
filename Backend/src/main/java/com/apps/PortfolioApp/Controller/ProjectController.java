package com.apps.PortfolioApp.Controller;

import com.apps.PortfolioApp.DTO.ProjectDTO;
import com.apps.PortfolioApp.Service.ProjectService;
import jakarta.validation.Valid;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/projects")
public class ProjectController {

    //Step1 ----> Create an object from Project Service class :
    private final ProjectService projectService;

    //Step2 ----> Create a con:
    public ProjectController(ProjectService projectService) {
        this.projectService = projectService;
    }

    //step3 ----> create a function to save the project to db:
    @PostMapping
    public ProjectDTO insert(@RequestBody @Valid ProjectDTO projectDTO) {
        return this.projectService.insertProject(projectDTO);
    }

    //step4 ----> create a function to get all projects from db:
    @GetMapping
    public List<ProjectDTO> getAll() {
        return this.projectService.getAllProjects();
    }

    //step5 ----> create a function to get the Specific project by id from db:
    @GetMapping("/id/{id}")
    public ProjectDTO getById(@PathVariable int id) {
        return this.projectService.getProjectByID(id);
    }

    //step6 ----> create a function to get the Specific project by projectName from db:
    @GetMapping("/projectName/{name}")
    public ProjectDTO getByName(@PathVariable String name) {
        return this.projectService.getProjectByName(name);
    }

    //step7 ----> create a function to update the project to db:
    @PutMapping("/{name}")
    public ProjectDTO update(@PathVariable String name , @RequestBody @Valid ProjectDTO projectDTO){
        return this.projectService.updateProject(name, projectDTO);
    }

    //step8----> create a function to delete the Specific project by id from db:
    @DeleteMapping("/{id}")
    public void delete(@PathVariable int id) {
        this.projectService.deleteProject(id);
    }

}