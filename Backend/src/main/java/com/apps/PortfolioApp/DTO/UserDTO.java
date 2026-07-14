package com.apps.PortfolioApp.DTO;

import com.apps.PortfolioApp.Model.Entity.User;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

public class UserDTO {
    // here I will Create Class variables :
    private Integer id ;
    // ---------------
    @NotBlank(message = "The username must not be blank")
    @Size(min = 4 , max = 20 )
    private String username;
    // ---------------
    @NotBlank(message = "The password must not be blank")
    @Size(min = 8 , max = 12)
    private String password;

    // here I will Create a constructor :
    public UserDTO() {}

    public UserDTO(Integer id, String username, String password) {
        this.id = id;
        this.username = username;
        this.password = password;
    }

    // getter && setter
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }


    // here I will Create a function to transfer data from entity to DTO :
    public static UserDTO fromEntityToDTO(User user) {
        UserDTO userDTO = new UserDTO();
        userDTO.setId(user.getId());
        userDTO.setUsername(user.getUsername());
        userDTO.setPassword(user.getPassword());
        return userDTO;
    }

    // here I will Create a function to transfer data from DTO to Entity :
    public static User fromDTOToEntity(UserDTO userDTO) {
        User user = new User();
        user.setId(userDTO.getId());
        user.setUsername(userDTO.getUsername());
        user.setPassword(userDTO.getPassword());
        return user;
    }
}