package com.apps.PortfolioApp.Service;

import com.apps.PortfolioApp.DTO.SkillDTO;
import com.apps.PortfolioApp.Model.Entity.Skill;
import com.apps.PortfolioApp.Repository.SkillRepository;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Optional;

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
        Skill skill = SkillDTO.fromDTOToEntity(skillDTO);
        return SkillDTO.fromEntityToDTO(skillRepository.save(skill));
    }


    // step4 ----> here I will Create a function to get all Skills from db :
    public List<SkillDTO> getAllSkills() {
        List<Skill> skills = skillRepository.findAll();
        return skills.stream().map(SkillDTO::fromEntityToDTO).toList();
    }


    // step5 ----> here I will Create a function to get a skill by id :
    public SkillDTO getSkillByID(int id) {
        Optional<Skill> skillOptional = skillRepository.findById(id);
        if (skillOptional.isPresent()) {
            return SkillDTO.fromEntityToDTO(skillOptional.orElse(null));
        }
        else
            return null;
    }


    // step6 ----> here I will Create a function update a skill from db :
    public SkillDTO updateSkill(String name,SkillDTO skillDTO) {
        Skill skill = skillRepository.findByName(name).orElseThrow();
        skill.setName(skillDTO.getName());
        skill.setLevel(skillDTO.getLevel());
        skill.setIcon(skillDTO.getIcon());
        return SkillDTO.fromEntityToDTO(skillRepository.save(skill));
    }


    // step7 ----> here I will Create a function delete a skill from db :
    public void deleteSkill(int id) {
        skillRepository.deleteById(id);
    }


    // step8 ----> here I will Create a function to find by Skill name :
    public SkillDTO getByName(String name) {
        Optional<Skill> skillOptional = skillRepository.findByName(name);
        if (skillOptional.isPresent()) {
            return SkillDTO.fromEntityToDTO(skillOptional.orElse(null));
        }
        else
            return null ;
    }

}