package com.api.tarefasProjetoINT.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "game")
public class Game {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_game") // Corrigido para corresponder ao nome da coluna na tabela
    private Long idGame;

    @Column(name = "game_name", nullable = false, length = 100) // Corrigido para corresponder ao nome da coluna na tabela
    private String gameName;

    @Column(name = "genre", nullable = false, length = 50) // Corrigido para corresponder ao nome da coluna na tabela
    private String genre;

    @Column(name = "release_date", nullable = false)
    private String releaseDate;

    @Column(name = "platform", nullable = false, length = 50) // Corrigido para corresponder ao nome da coluna na tabela
    private String platform;

    @Column(name = "priority_rate", nullable = false, length = 10) // Corrigido para corresponder ao nome da coluna na tabela
    private String priorityRate;

    @ManyToOne
    @JoinColumn(name = "user_id_user", nullable = false)
    private User user;

    @Column(name = "description", columnDefinition = "TEXT", nullable = false)
    private String description;
    

    // Getters and Setters    

    public Long getIdGame() {
        return idGame;
    }

    public void setIdGame(Long idGame) {
        this.idGame = idGame;
    }

    public String getGameName() {
        return gameName;
    }

    public void setGameName(String gameName) {
        this.gameName = gameName;
    }

    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    public String getReleaseDate() {
        return releaseDate;
    }

    public void setReleaseDate(String releaseDate) {
        this.releaseDate = releaseDate;
    }

    public String getPlatform() {
        return platform;
    }

    public void setPlatform(String platform) {
        this.platform = platform;
    }

    public String getPriorityRate() {
        return priorityRate;
    }

    public void setPriorityRate(String priorityRate) {
        this.priorityRate = priorityRate;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    
}




   
   
    
