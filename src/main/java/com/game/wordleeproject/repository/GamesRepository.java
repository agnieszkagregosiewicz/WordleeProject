package com.game.wordleeproject.repository;

import com.game.wordleeproject.model.Games;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;
import java.util.Optional;
@Repository
@Transactional
public interface GamesRepository extends JpaRepository<Games, Long> {


    Optional<Games> findById(Long id);
    void deleteGamesById(Long id);
    List<Games> findAll();

}
