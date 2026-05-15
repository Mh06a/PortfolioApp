package com.apps.PortfolioApp.Model.Entity;

import jakarta.persistence.*;

@Table(name = "Project")
@Entity
public class Project {
    //  here I will Create Class variables :
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id ;
    private String name;
    private String description;
    private String techStack;
    private String githubLink;

    // here I will Create a constructor :
    public Project() {}

    public Project(int id, String name, String description, String techStack, String githubLink) {
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
}