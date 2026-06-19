package com.apps.PortfolioApp.Service;

import com.apps.PortfolioApp.DTO.SkillDTO;
import com.apps.PortfolioApp.ExceptionHandler.DuplicateSkillException;
import com.apps.PortfolioApp.ExceptionHandler.SkillNotFoundException;
import com.apps.PortfolioApp.Model.Entity.Skill;
import com.apps.PortfolioApp.Repository.SkillRepository;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class SkillService {

    // step1 ----> Create an object from SkillRepository class :
    private final SkillRepository skillRepository;

    // step2 ----> Create a con :
    public SkillService(SkillRepository skillRepository) {
        this.skillRepository = skillRepository;
    }

    // step3 ----> here I will Create a function to Insert to db :
    public SkillDTO insertSkill(SkillDTO skillDTO) {
        if (skillRepository.findByName(skillDTO.getName()).isPresent()) {
            throw new DuplicateSkillException("Skill already exists with name:" + skillDTO.getName());
        }
        Skill skill = SkillDTO.fromDTOToEntity(skillDTO);
        return SkillDTO.fromEntityToDTO(skillRepository.save(skill));
    }

    // step4 ----> here I will Create a function to get all Skills from db :
    public List<SkillDTO> getAllSkills() {
        if (skillRepository.findAll().isEmpty()) {
            throw new SkillNotFoundException("You don't have any skill");
        } else {
            List<Skill> skills = skillRepository.findAll();
            return skills.stream().map(SkillDTO::fromEntityToDTO).toList();
        }
    }

    // step5 ----> here I will Create a function to get a skill by id :
    public SkillDTO getSkillByID(int id) {
        Skill skill = skillRepository.findById(id).orElseThrow(
                () -> new SkillNotFoundException("Skill not found with id: " + id));
        return SkillDTO.fromEntityToDTO(skill);
    }

    // step6 ----> here I will Create a function update a skill from db :
    public SkillDTO updateSkill(String name, SkillDTO skillDTO) {
        Skill skill = skillRepository.findByName(name).orElseThrow(
                () -> new SkillNotFoundException("Skill not found with name: " + name));
        skill.setName(skillDTO.getName());
        skill.setLevel(skillDTO.getLevel());
        skill.setIcon(skillDTO.getIcon());
        return SkillDTO.fromEntityToDTO(skillRepository.save(skill));
    }

    // step7 ----> here I will Create a function delete a skill from db :
    public void deleteSkill(int id) {
        Skill skill = skillRepository.findById(id).orElseThrow(
                () -> new SkillNotFoundException("Skill not found with id: " + id));
        skillRepository.delete(skill);
    }

    // step8 ----> here I will Create a function to find by Skill name :
    public SkillDTO getByName(String name) {
        Skill skill = skillRepository.findByName(name).orElseThrow(
                () -> new SkillNotFoundException("Skill not found with skill name: " + name));
        return SkillDTO.fromEntityToDTO(skill);
    }

}