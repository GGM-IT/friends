package com.friend.pojo;

public class Appealfriend {

    Integer id;

    String username;

    public Appealfriend() {
    }

    public Appealfriend(Integer id, String username) {
        this.id = id;
        this.username = username;
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

    @Override
    public String toString() {
        return "Appealfriend{" +
                "id=" + id +
                ", username='" + username + '\'' +
                '}';
    }
}
