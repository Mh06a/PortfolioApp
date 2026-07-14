package com.apps.PortfolioApp.Controller;

import com.apps.PortfolioApp.DTO.SkillDTO;
import com.apps.PortfolioApp.Service.SkillService;
import jakarta.validation.Valid;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/skills")
public class SkillController {

    //Step1 ----> Create an object from Skill Service class :
    private final SkillService skillService;

    //Step2 ----> Create a con:
    public SkillController(SkillService skillService) {
        this.skillService = skillService;
    }

    //step3 ----> create a function to save the skill to db:
    @PostMapping
    public SkillDTO insert(@RequestBody @Valid SkillDTO skillDTO) {
        return this.skillService.insertSkill(skillDTO);
    }

    //step4 ----> create a function to get all skills from db:
    @GetMapping
    public List<SkillDTO> getAll() {
        return this.skillService.getAllSkills();
    }

    //step5 ----> create a function to get the Specific skill by id from db:
    @GetMapping("/id/{id}")
    public SkillDTO getById(@PathVariable int id){
        return this.skillService.getSkillByID(id);
    }

    //step6 ----> create a function to get the Specific skill by skillName from db:
    @GetMapping("/skillName/{name}")
    public SkillDTO getBySkillName(@PathVariable String name) {
        return this.skillService.getByName(name);
    }

    //step7 ----> create a function to update the skill to db:
    @PutMapping("/{name}")
    public SkillDTO update(@PathVariable String name , @RequestBody @Valid SkillDTO skillDTO) {
        return this.skillService.updateSkill(name , skillDTO);
    }

    //step8----> create a function to delete the Specific skill by id from db:
    @DeleteMapping("/{id}")
    public void delete(@PathVariable int id) {
        this.skillService.deleteSkill(id);
    }

}