package com.friend.pojo;

public class User {

    Integer id;

    String username;

    String password;

    String role;  //admin

    String gender;

    String charact;

    Integer salary;

    Integer height;

    String email;

    public User() {
    }

    public User(Integer id, String username, String password, String role,
                String gender, String charact, Integer salary, Integer height, String email) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.role = role;
        this.gender = gender;
        this.charact = charact;
        this.salary = salary;
        this.height = height;
        this.email = email;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getCharact() {
        return charact;
    }

    public void setCharact(String charact) {
        this.charact = charact;
    }

    public Integer getSalary() {
        return salary;
    }

    public void setSalary(Integer salary) {
        this.salary = salary;
    }

    public Integer getHeight() {
        return height;
    }

    public void setHeight(Integer height) {
        this.height = height;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", role='" + role + '\'' +
                ", gender='" + gender + '\'' +
                ", charact='" + charact + '\'' +
                ", salary=" + salary +
                ", height=" + height +
                ", email='" + email + '\'' +
                '}';
    }
}
