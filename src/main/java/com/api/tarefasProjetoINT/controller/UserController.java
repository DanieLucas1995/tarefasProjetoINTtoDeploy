package com.api.tarefasProjetoINT.controller;

import com.api.tarefasProjetoINT.model.User;
import com.api.tarefasProjetoINT.model.Game; // Importe a classe Game
import com.api.tarefasProjetoINT.service.UserService;
import com.api.tarefasProjetoINT.service.GameManagementService; // Importe o GameManagementService
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import java.util.List;
import java.util.Date;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.web.bind.annotation.ModelAttribute;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @ModelAttribute("users")
    public List<User> getAllUsers() {
        return userService.getAllUsers();
    }

    @GetMapping("/register")
    public String showRegistrationForm(Model model) {
        model.addAttribute("user", new User());
        return "register";
    }

    @PostMapping("/register")
    public String registerUser(User user, RedirectAttributes redirectAttributes) {
        try {
            user.setDateJoined(new Date());
            userService.createUser(user);
            return "redirect:/login"; // Após o registro, redirecione para a página de login
        } catch (DataIntegrityViolationException e) {
            e.printStackTrace();
            redirectAttributes.addAttribute("error", "duplicate");
            return "redirect:/register";
        } catch (Exception e) {
            e.printStackTrace();
            redirectAttributes.addAttribute("error", "other");
            return "redirect:/register";
        }
    }

    @GetMapping("/users")
    public String listUsers(Model model) {
        List<User> users = userService.getAllUsers();
        model.addAttribute("users", users);
        return "users"; // Certifique-se de ter um template users.html
    }

    @Autowired
    private GameManagementService gameManagementService; // Injete o GameManagementService

    @PostMapping("/saveGame")
    public String saveGame(@ModelAttribute Game game) {
        try {
            // Aqui você salva os dados do jogo no banco de dados
            gameManagementService.saveGame(game);
            return "redirect:/games"; // Redireciona para a página de listagem de jogos
        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/games?error";
        }
    }

}
