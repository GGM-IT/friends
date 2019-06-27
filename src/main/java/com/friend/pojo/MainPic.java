package com.friend.pojo;

public class MainPic {

    Integer id;

    Integer user_id;

    String username;

    String url;

    public MainPic() {
    }

    public MainPic(Integer id, Integer user_id, String username, String url) {
        this.id = id;
        this.user_id = user_id;
        this.username = username;
        this.url = url;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUser_id() {
        return user_id;
    }

    public void setUser_id(Integer user_id) {
        this.user_id = user_id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    @Override
    public String toString() {
        return "MainPic{" +
                "id=" + id +
                ", user_id=" + user_id +
                ", username='" + username + '\'' +
                ", url='" + url + '\'' +
                '}';
    }
}
