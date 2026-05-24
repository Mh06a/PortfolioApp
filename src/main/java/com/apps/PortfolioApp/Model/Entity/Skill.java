package com.apps.PortfolioApp.Model.Entity;

import jakarta.persistence.*;

@Table(name = "skills")
@Entity
public class Skill {
    // here I will Create Class variables :
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String name;
    private String level;
    private String icon;

    // here I will Create a constructor :
    public Skill() {}

    public Skill(Integer id, String name, String level, String icon) {
        this.id = id;
        this.name = name;
        this.level = level;
        this.icon = icon;
    }

    // getter && setter
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

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }
}