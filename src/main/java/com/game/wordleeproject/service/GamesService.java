package com.game.wordleeproject.service;

import com.game.wordleeproject.model.Games;
import java.util.List;
import java.util.Optional;

public interface GamesService {
    List<Games> getGames();
    void add(Games game);
    Optional<Games> get(Long id);
    void delete(Long id);

}
