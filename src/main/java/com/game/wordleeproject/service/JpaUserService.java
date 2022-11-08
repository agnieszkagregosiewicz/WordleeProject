package com.game.wordleeproject.service;

import com.game.wordleeproject.model.Role;
import com.game.wordleeproject.model.User;
import com.game.wordleeproject.repository.RoleRepository;
import com.game.wordleeproject.repository.UserRepository;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import java.awt.print.Book;
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
    public Optional<User> findByEmail(String email) {
        return userRepository.findByEmail(email);
    }

//    public Long getRanking(User user) {
//            Query query = entityManager.createQuery("SELECT r FROM Ranking r WHERE user_id=:user");
//        query.setParameter("user", user.getId());
//            return query.getResult();
//        }


    //indeksowanie - dodatkowe mapowanie w bazie danych, na zbudowanym drzewie, jpa indexes



}
