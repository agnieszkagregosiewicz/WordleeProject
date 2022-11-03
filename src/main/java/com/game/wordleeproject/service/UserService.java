package com.game.wordleeproject.service;

import com.game.wordleeproject.model.User;

import java.awt.print.Book;
import java.util.List;
import java.util.Optional;

public interface UserService {

    List<User> getUsers();
    void add(User user);
    Optional<User> get(Long id);
    void delete(Long id);
    void update(User user);

}
