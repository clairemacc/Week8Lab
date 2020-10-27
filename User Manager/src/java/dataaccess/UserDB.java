/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dataaccess;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import models.User;

/**
 *
 * @author 819466
 */
public class UserDB {
      
    public List<User> getAll(String email) throws Exception
    {
        List<User> users = new ArrayList<>();
        ConnectionPool cp = ConnectionPool.getInstance();
        Connection con = cp.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        try{
            ps = con.prepareStatement(sql);
            
            
        }
    }
}
