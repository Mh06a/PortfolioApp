package com.apps.PortfolioApp.Model.Entity;

import jakarta.persistence.Entity;
import jakarta.persistence.Table;

@Table(name = "Skill")
@Entity
public class Skill {
    // here I will Create Class variables :
    private int id;
    private String name;
    private String level;
    private String icon;

    // here I will Create a constructor :
    public Skill() {}

    public Skill(int id, String name, String level, String icon) {
        this.id = id;
        this.name = name;
        this.level = level;
        this.icon = icon;
    }

    // getter && setter
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