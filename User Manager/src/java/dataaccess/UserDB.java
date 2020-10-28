package dataaccess;

import java.sql.*;
import java.util.*;
import models.User;

public class UserDB {

    public User get(String email) {
        // TODO
        return null;
    }

    public List<User> getAll() throws Exception {
        List<User> users = new ArrayList<>();
        ConnectionPool cp = ConnectionPool.getInstance();
        Connection con = cp.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = "SELECT * from user where email=?";
        try {
            ps = con.prepareStatement(sql);
            //ps.setString(1, email);
            rs = ps.executeQuery();
            while (rs.next()) {

            }
        } catch (SQLException e) {
            //
        }

        return users;
    }

    public void insert(User user) {
        // TODO
    }

    public void update(User user) {
        // TODO
    }

    public void delete(User user) {
        // TODO
    }
}
