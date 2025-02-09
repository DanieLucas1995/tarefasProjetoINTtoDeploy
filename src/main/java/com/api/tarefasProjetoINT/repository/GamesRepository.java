package com.api.tarefasProjetoINT.repository;

import com.api.tarefasProjetoINT.model.Game;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface GamesRepository extends JpaRepository<Game, Long> {
    List<Game> findByUserIdUser(Long userIdUser);
}
