package com.game.wordleeproject.model;


import lombok.Data;
import org.springframework.security.core.GrantedAuthority;
import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Set;

@Entity
@Table(name="users")
@Data
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @NotEmpty
    @Column(unique = true)
    private String login;
    @NotEmpty
    @Size(min = 7, message = "Hasło musi mieć conajmniej 7 znaków")
    private String password;
    @NotEmpty
    @Column(unique = true)
    @Email (message = "Wpisz poprawny email")
    private String email;
    private Double winnings;
    private Long gamesPlayedQ;
    private Double score;
    @OneToMany  (cascade = CascadeType.ALL, fetch = FetchType.EAGER)//(mappedBy = "user_id")
    private List<Games> games = new ArrayList<>();
    @ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    @JoinTable(name = "user_role", joinColumns = @JoinColumn(name = "user_id"),
            inverseJoinColumns = @JoinColumn(name = "role_id"))
    private Set<Role> roles;


    public User(String login, String password, Collection<? extends GrantedAuthority> authorities) {

    }

    public User() {

    }
}
