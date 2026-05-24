package com.apps.PortfolioApp.Controller;

import com.apps.PortfolioApp.DTO.UserDTO;
import com.apps.PortfolioApp.Service.UserService;
import jakarta.validation.Valid;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/users")
@Valid
public class UserController {

    //Step1 ----> Create an object from User Service class :
    private final UserService userService;

    //Step2 ----> Create a con:
    public UserController(UserService userService) {
        this.userService = userService;
    }

    //step3 ----> create a function to save the user to db:
    @PostMapping
    public UserDTO insert(@RequestBody UserDTO userDTO) {
        return userService.insertUser(userDTO);
    }

    //step4 ----> create a function to get all users from db:
    @GetMapping
    public List<UserDTO> getAll() {
        return userService.getAllUsers();
    }

    //step5 ----> create a function to get the Specific user by id from db:
    @GetMapping("/id/{id}")
    public UserDTO getById(@PathVariable int id) {
        return userService.getUserByID(id);
    }

    //step6 ----> create a function to get the Specific user by username from db:
    @GetMapping("/username/{username}")
    public UserDTO getByUsername(@PathVariable String username) {
        return userService.getByUsername(username);
    }

    //step7 ----> create a function to update the user to db:
    @PutMapping("/{username}")
    public UserDTO update(@PathVariable String username , @RequestBody UserDTO userDTO) {
        return userService.updateUser(userDTO);
    }

    //step8----> create a function to delete the Specific user by id from db:
    @DeleteMapping("/{id}")
    public void delete(@PathVariable int id) {
        userService.deleteUser(id);
    }

}