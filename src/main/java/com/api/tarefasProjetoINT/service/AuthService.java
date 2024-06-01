package com.api.tarefasProjetoINT.service;

import com.api.tarefasProjetoINT.exception.AuthenticationException;
import com.api.tarefasProjetoINT.model.User;
import com.api.tarefasProjetoINT.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class AuthService {

    @Autowired
    private UserRepository userRepository;

    public User authenticate(String username, String password) {
        System.out.println("Authenticating user: " + username);
        Optional<User> userOpt = userRepository.findByUsername(username);
        if (userOpt.isPresent()) {
            User user = userOpt.get();
            if (user.getPassword().equals(password)) { // Verifica o nome de usuário e a senha
                System.out.println("User authenticated successfully: " + user.getUsername());
                return user;
            }
        }
        throw new AuthenticationException("Invalid username or password");
    }
}
