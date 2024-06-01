package com.api.tarefasProjetoINT.controller;

import com.api.tarefasProjetoINT.model.Game;
import com.api.tarefasProjetoINT.model.User;
import com.api.tarefasProjetoINT.service.GameManagementService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class CheckinController {

    @Autowired
    private GameManagementService gameManagementService;

    @GetMapping("/checkin")
    public String showUserGames(HttpSession session, Model model) {
        User loggedUser = (User) session.getAttribute("loggedUser");
        if (loggedUser != null) {
            List<Game> userGames = gameManagementService.getGamesByUserId(loggedUser.getIdUser());
            model.addAttribute("games", userGames);
            return "checkin"; // Retorna a página de listagem de jogos do usuário
        }
        return "redirect:/login"; // Redireciona para a página de login se o usuário não estiver autenticado
    }
}
