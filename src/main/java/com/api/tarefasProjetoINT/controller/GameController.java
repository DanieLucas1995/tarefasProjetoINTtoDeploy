package com.api.tarefasProjetoINT.controller;

import com.api.tarefasProjetoINT.model.Game;
import com.api.tarefasProjetoINT.model.User;
import com.api.tarefasProjetoINT.service.GameManagementService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;


@Controller
public class GameController {

    @Autowired
    private GameManagementService gameManagementService;

    @GetMapping("/games")
    public String showGames(Model model) {
        model.addAttribute("games", gameManagementService.getAllGames());
        return "games"; // Retorna a página de listagem de jogos
    }

    @PostMapping("/games/add")
    public String addGame(Game game, HttpSession session) {
        User loggedUser = (User) session.getAttribute("loggedUser");
        if (loggedUser != null) {
            game.setUser(loggedUser);
            gameManagementService.saveGame(game);
            return "redirect:/games"; // Redireciona de volta para a página de listagem de jogos
        }
        return "redirect:/login"; // Redireciona para a página de login se o usuário não estiver autenticado
    }
}
