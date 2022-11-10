package com.game.wordleeproject.service;

import com.game.wordleeproject.model.Games;
import com.game.wordleeproject.repository.GamesRepository;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Optional;

@Service
public class JpaGamesService implements GamesService {

    private final GamesRepository gamesRepository;


    public JpaGamesService(GamesRepository gamesRepository) {
        this.gamesRepository = gamesRepository;
    }

    @Override
    public void add(Games games) {
        gamesRepository.save(games);
    }

    @Override
    public List<Games> getGames() {
        return gamesRepository.findAll();
    }

    @Override
    public Optional<Games> get(Long id) {
        return gamesRepository.findById(id);
    }

    @Override
    public void delete(Long id) {
        gamesRepository.deleteGamesById(id);
    }

}
