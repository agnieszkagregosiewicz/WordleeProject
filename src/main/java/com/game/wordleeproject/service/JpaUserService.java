package com.game.wordleeproject.service;

import com.game.wordleeproject.model.Role;
import com.game.wordleeproject.model.User;
import com.game.wordleeproject.repository.RoleRepository;
import com.game.wordleeproject.repository.UserRepository;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Optional;


@Service
public class JpaUserService implements UserService {
    private final UserRepository userRepository;
    private final RoleRepository roleRepository;
    private final BCryptPasswordEncoder passwordEncoder;

    public JpaUserService(UserRepository userRepository, RoleRepository roleRepository, BCryptPasswordEncoder passwordEncoder) {
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
        this.passwordEncoder = passwordEncoder;
    }

    @Override
    public List<User> getUsers() {
        return userRepository.findAll();
    }

    @Override
    public void add(User user) {
            user.setPassword(passwordEncoder.encode(user.getPassword()));
            Role userRole = roleRepository.findByName("ROLE_USER");
            user.setRoles(new HashSet<>(Arrays.asList(userRole)));
            user.setScore(0.0);
            user.setWinnings(0.0);
            user.setGamesPlayedQ(0L);
            user.setGames(null);
            userRepository.save(user);
    }

    @Override
    public Optional<User> get(Long id) {
        return userRepository.findById(id);
    }

    @Override
    public void delete(Long id) {
        userRepository.deleteUserById(id);
    }

    @Override
    public void update(User user) {
        userRepository.save(user);
    }

    @Override
    public void updateEdit(User user) {
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        Role userRole = roleRepository.findByName("ROLE_USER");
        user.setRoles(new HashSet<>(Arrays.asList(userRole)));
        user.setGames(user.getGames());
        user.setWinnings(user.getWinnings());
        user.setScore(user.getScore());
        user.setGamesPlayedQ(user.getGamesPlayedQ());
        userRepository.save(user);
    }
    @Override
    public Optional<User> findByEmail(String email) {
        return userRepository.findByEmail(email);
    }
    @Override
    public Optional<User> findByLogin(String login) {
        return userRepository.findUserByLogin(login);
    }

    public Double getScore(User user) {
        return user.getScore();
    }
    public Long getRanking(Double score) {return userRepository.getRanking(score);}
    public List<User> getListRanking() {
        return userRepository.findAllByOrderByScoreDesc();
    }

}
