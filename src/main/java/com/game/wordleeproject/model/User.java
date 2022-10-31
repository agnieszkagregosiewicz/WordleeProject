package com.game.wordleeproject.model;


import lombok.Data;


import javax.persistence.*;
import javax.validation.constraints.NotEmpty;

@Entity
@Table(name="user")
@Data
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @NotEmpty
    private String login;
    @NotEmpty
    private String password;
    private String email;
    private Double score;
    private Long games;


}
