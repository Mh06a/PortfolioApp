package com.apps.PortfolioApp.Model.Entity;

import jakarta.persistence.*;

@Table(name = "projects")
@Entity
public class Project {
    //  here I will Create Class variables :
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id ;
    private String name;
    @Column(length = 500)
    private String description;
    @Column(name = "tech_stack")
    private String techStack;
    @Column(name = "github_link")
    private String githubLink;

    // here I will Create a constructor :
    public Project() {}

    public Project(Integer id, String name, String description, String techStack, String githubLink) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.techStack = techStack;
        this.githubLink = githubLink;
    }

    // Getter && Setter
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
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
}