/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entities;

/**
 *
 * @author User
 */
public class User {
    private int id;
    private String name;
    private String email;
    private String userName;
    private String userPassword;
    private String userRole;
    private String profile;

    public void setProfile(String profile) {
        this.profile = profile;
    }

    public String getProfile() {
        return profile;
    }

    public User() {
    }

    public User(int id, String name, String email, String userName, String userPassword, String userRole) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.userName = userName;
        this.userPassword = userPassword;
        this.userRole = userRole;
    }

    public User(int id, String name, String email, String userName, String userPassword, String userRole, String profile) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.userName = userName;
        this.userPassword = userPassword;
        this.userRole = userRole;
        this.profile = profile;
    }

    public User(String name, String email, String userName, String userPassword, String userRole) {
        this.name = name;
        this.email = email;
        this.userName = userName;
        this.userPassword = userPassword;
        this.userRole = userRole;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public String getUserRole() {
        return userRole;
    }

    public void setUserRole(String userRole) {
        this.userRole = userRole;
    }
    
    
}
