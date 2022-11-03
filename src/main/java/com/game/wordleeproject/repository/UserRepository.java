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

//    public static boolean checkLogin(String email, String password) {
//
//        try (Connection connection = DbUtil.getConnection();
//             PreparedStatement statement = connection.prepareStatement(CHECK_EMAIL)
//        ) {
//            statement.setString(1, email);
//            try (ResultSet resultSet = statement.executeQuery()) {
//                if (!resultSet.next()) {
//                    return false;
//                }
//                if (!resultSet.getString("password").equals(hashPassword(password))) {
//                    System.out.println(hashPassword(password));
//                    System.out.println(resultSet.getString("password"));
//                    return false;
//                }
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return true;
//    }

}
