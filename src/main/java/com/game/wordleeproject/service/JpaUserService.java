package com.game.wordleeproject.service;

import com.game.wordleeproject.model.User;
import com.game.wordleeproject.repository.UserRepository;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Optional;

@Service
public class JpaUserService implements UserService{
private final UserRepository userRepository;


    public JpaUserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @Override
    public List<User> getUsers() {
        return userRepository.findAll();
    }

    @Override
    public void add(User user) {
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
}
