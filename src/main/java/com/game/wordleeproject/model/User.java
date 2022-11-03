package com.game.wordleeproject.model;


import lombok.Data;
import javax.persistence.*;
import javax.validation.constraints.NotEmpty;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name="users")
@Data

public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @NotEmpty
    private String login;
    @NotEmpty
    private String password;
    @NotEmpty
    private String email;
    private Double score;
    private Long gamesPlayedQ;
    @OneToOne
    private Ranking ranking;
    //@ManyToMany
    //private List<Games> games = new ArrayList<>();


}
