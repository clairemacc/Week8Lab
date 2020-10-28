package services;

import dataaccess.UserDB;
import java.sql.SQLException;
import java.util.List;
import models.User;

public class UserService {

    public User get(String email) throws Exception {
        UserDB userDB = new UserDB();
        User user = userDB.get(email);
        return user;
    }

    public List<User> getAll() throws Exception {
        UserDB userDB = new UserDB();
        List<User> users = userDB.getAll();
        return users;
    }

    public void insert(String email, boolean active, String firstname, String lastname, String password, String role) throws SQLException {
        User user = new User(email, active, firstname, lastname, password, role);
        UserDB userDB = new UserDB();
        userDB.insert(user);
    }

    public void update(String email, boolean active, String firstname, String lastname, String password, String role) throws SQLException {
        User user = new User(email, active, firstname, lastname, password, role);
        UserDB userDB = new UserDB();
        userDB.update(user);
    }

    public void delete(String email, boolean active, String firstname, String lastname, String password, String role) throws SQLException {
        User user = new User(email, active, firstname, lastname, password, role);
        UserDB userDB = new UserDB();
        userDB.delete(user);
    }
}
