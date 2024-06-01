package com.api.tarefasProjetoINT.service;

import com.api.tarefasProjetoINT.model.Game;
import com.api.tarefasProjetoINT.repository.GamesRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class GameManagementService {

    @Autowired
    private GamesRepository gameRepository;

    public Game saveGame(Game game) {
        return gameRepository.save(game);
    }

    public List<Game> getAllGames() {
        return gameRepository.findAll();
    }

    public List<Game> getGamesByUserId(Long userId) {
        return gameRepository.findByUserIdUser(userId);
    }
}
