package com.game.wordleeproject.repository;

import com.game.wordleeproject.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.awt.print.Book;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.Optional;

@Repository
@Transactional
public interface UserRepository extends JpaRepository<User, Long> {

    List<User> findAll();
    Optional<User> findById(Long id);
    @Modifying
    void deleteUserById(Long id);
    Optional<User> findByEmail(String email);

    //Query("select user_score from Ranking r where user_id=:user")
    //Long getRanking(User user);

    //Long
    //Long findUsers;


}
