package com.game.wordleeproject.model;

import lombok.Data;
import org.hibernate.validator.constraints.Range;
import javax.persistence.*;
@Entity
@Table(name="games")
@Data
public class Games {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String data;
    @Range(min = 0, max = 1, message = "Range 0- 1")
    private int result;
    @Range(min = 1, max = 7, message = "Range 1- 7")
    private int numberOfAttempt;
}
