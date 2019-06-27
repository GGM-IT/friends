package com.friend.pojo;

public class LogInfo {

    String userName;

    String userRole;

    Integer id;

    public LogInfo(String userName, String userRole, Integer id) {
        this.userName = userName;
        this.userRole = userRole;
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserRole() {
        return userRole;
    }

    public void setUserRole(String userRole) {
        this.userRole = userRole;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    @Override
    public String toString() {
        return "LogInfo{" +
                "userName='" + userName + '\'' +
                ", userRole='" + userRole + '\'' +
                ", id=" + id +
                '}';
    }
}
