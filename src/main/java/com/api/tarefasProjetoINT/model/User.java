package com.api.tarefasProjetoINT.model;

import jakarta.persistence.*;
import java.util.Date;

@Entity
@Table(name = "user")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idUser")
    private Long idUser;

    @Column(name = "name", nullable = false, length = 45)
    private String name;

    @Column(name = "user_name", nullable = false, unique = true)
    private String username;

    @Column(name = "gender", length = 20)
    private String gender;

    @Column(name = "age", nullable = false)
    private int age;

    @Column(name = "email", nullable = false, length = 45, unique = true)
    private String email;

    @Column(name = "password", nullable = false, length = 45)
    private String password;

    @Column(name = "phone_number", nullable = false, length = 20)
    private String phone_number;

    @Column(name = "city", nullable = false, length = 45)
    private String city;

    @Column(name = "nationality", nullable = false, length = 50)
    private String nationality;

    @Column(name = "date_joined", nullable = false)
    @Temporal(TemporalType.DATE)
    private Date dateJoined;

    @Column(name = "bio", columnDefinition = "MEDIUMTEXT", nullable = false)
    private String bio;

    @Column(name = "access_type", nullable = false, length = 45)
    private String access_type;



    // Getters and Setters

    public Long getIdUser() {
        return idUser;
    }

    public void setIdUser(Long idUser) {
        this.idUser = idUser;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone_number() {
        return phone_number;
    }

    public void setPhone_number(String phone_number) {
        this.phone_number = phone_number;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getNationality() {
        return nationality;
    }

    public void setNationality(String nationality) {
        this.nationality = nationality;
    }

    public Date getDateJoined() {
        return dateJoined;
    }

    public void setDateJoined(Date dateJoined) {
        this.dateJoined = dateJoined;
    }

    public String getBio() {
        return bio;
    }

    public void setBio(String bio) {
        this.bio = bio;
    }

    public String getAccess_type() {
        return access_type;
    }

    public void setAccess_type(String access_type) {
        this.access_type = access_type;
    }

    
}