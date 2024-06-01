package com.api.tarefasProjetoINT.controller;

import com.api.tarefasProjetoINT.exception.AuthenticationException;
import com.api.tarefasProjetoINT.service.AuthService;
import com.api.tarefasProjetoINT.model.User;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class LoginController {

    @Autowired
    private AuthService authService;

    @GetMapping("/login")
    public String showLoginForm() {
        return "login"; // Retorna o nome da página de login
    }

    @PostMapping("/login")
    public String login(@RequestParam String username, @RequestParam String password, HttpSession session, RedirectAttributes redirectAttributes) {
        System.out.println("Received login request for username: " + username); // Log de solicitação de login

        try {
            User user = authService.authenticate(username, password);
            session.setAttribute("loggedUser", user);
            return "redirect:/games"; // Redireciona para a página de jogos
        } catch (AuthenticationException e) {
            System.out.println("Authentication failed for username: " + username); // Log de falha de autenticação
            redirectAttributes.addFlashAttribute("error", "Invalid username or password");
            return "redirect:/login"; // Redireciona de volta para a página de login com mensagem de erro
        }
    }
}
