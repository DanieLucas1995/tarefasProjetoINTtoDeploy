package com.api.tarefasProjetoINT.service;

import com.api.tarefasProjetoINT.model.User;
import com.api.tarefasProjetoINT.repository.UserRepository;
import java.util.Date;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    public User createUser(User user) {
        user.setDateJoined(new Date());
        return userRepository.save(user);
    }

    public List<User> getAllUsers() {
        return userRepository.findAll();
    }

    @Service
    public class AuthService {

        @Autowired
        private UserRepository userRepository;

        public User authenticate(String username, String password) {
            Optional<User> userOpt = userRepository.findByUsername(username);
            if (userOpt.isPresent()) {
                User user = userOpt.get();
                if (user.getPassword().equals(password)) { // Use hashed passwords in a real application
                    return user;
                }
            }
            return null;
        }
    }
}
