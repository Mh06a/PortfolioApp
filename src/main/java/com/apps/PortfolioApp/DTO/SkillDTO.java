package com.apps.PortfolioApp.DTO;

import com.apps.PortfolioApp.Model.Entity.Skill;
import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.NotBlank;

public class SkillDTO {
    // here I will Create Class variables :
    private int id;
    // ---------------
    @NotBlank(message = "The skill name must not be empty")
    @Max(50)
    private String name;
    // ---------------
    @NotBlank(message = "The skill level must not be empty")
    @Max(50)
    private String level;
    // ---------------
    @NotBlank(message = "The skill logo should not be empty")
    @Max(100)
    private String icon;


    // here I will Create a constructor :
    public SkillDTO() {}

    public SkillDTO(int id, String name, String level, String icon) {
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


    // here I will Create a function to transfer data from entity to DTO :
    public static SkillDTO fromEntityToDTO(Skill skill) {
        SkillDTO skillDTO = new SkillDTO();
        skillDTO.setId(skill.getId());
        skillDTO.setName(skill.getName());
        skillDTO.setLevel(skill.getLevel());
        skillDTO.setIcon(skill.getIcon());
        return skillDTO;
    }

    // here I will Create a function to transfer data from DTO to Entity :
    public static Skill fromDTOToEntity(SkillDTO skillDTO) {
        Skill skill = new Skill();
        skill.setId(skillDTO.getId());
        skill.setName(skillDTO.getName());
        skill.setLevel(skillDTO.getLevel());
        skill.setIcon(skillDTO.getIcon());
        return skill;
    }
}