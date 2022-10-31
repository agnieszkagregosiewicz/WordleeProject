package com.game.wordleeproject.model;

import javax.persistence.*;

@Entity
@Table(name="ranking")

public class Ranking {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @OneToOne
    private User user;

    private Long place;

}
