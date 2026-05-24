package com.apps.PortfolioApp.Service;

import com.apps.PortfolioApp.DTO.UserDTO;
import com.apps.PortfolioApp.Model.Entity.User;
import com.apps.PortfolioApp.Repository.UserRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class UserService {

    // step1 ----> Create an object from UserRepository class :
    private final UserRepository userRepository;


    // step2 ----> Create a con :
    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }


    // step3 ----> here I will Create a function to Insert to db :
    public UserDTO insertUser(UserDTO userDTO) {
        User user = UserDTO.fromDTOToEntity(userDTO);
        return UserDTO.fromEntityToDTO(userRepository.save(user));
    }


    // step4 ----> here I will Create a function to get all users from db :
    public List<UserDTO> getAllUsers() {
        List<User> userList = userRepository.findAll();
        return userList.stream().map(UserDTO::fromEntityToDTO).toList();
    }


    // step5 ----> here I will Create a function to get user by id :
    public UserDTO getUserByID(int id) {
        Optional<User> userOptional = userRepository.findById(id);
        if (userOptional.isPresent()) {
            return UserDTO.fromEntityToDTO(userOptional.orElse(null));
        }
        else
            return null;
    }


    // step6 ----> here I will Create a function update user from db :
    public UserDTO updateUser(int id, UserDTO userDTO) {
        User user = userRepository.findById(id).orElseThrow();
        user.setUsername(userDTO.getUsername());
        user.setPassword(userDTO.getPassword());
        return UserDTO.fromEntityToDTO(userRepository.save(user));
    }


    // step7 ----> here I will Create a function delete user from db :
    public void deleteUser(int id) {
        userRepository.deleteById(id);
    }


    // step8 ----> here I will Create a function to find by username :
    public UserDTO getByUsername(String username) {
        Optional<User> userOptional = userRepository.findByUsername(username);
        if (userOptional.isPresent()) {
            return UserDTO.fromEntityToDTO(userOptional.orElse(null));
        }
        else
            return null;
    }

}