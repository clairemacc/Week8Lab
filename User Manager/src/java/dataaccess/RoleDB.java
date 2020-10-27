/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dataaccess;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import models.Role;

/**
 *
 * @author 819466
 */
public class RoleDB {
    public List<Role> getAll(String owner) throws Exception {
        List<Role> role = new ArrayList<>();
        ConnectionPool cp = ConnectionPool.getInstance();
        Connection con = cp.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        String sql = "SELECT * FROM note WHERE owner=?";
        
     try {
            ps = con.prepareStatement(sql);
            ps.setString(1, owner);
            rs = ps.executeQuery();
            while (rs.next()) {
              //do something when Role.java is completed
            }
        } finally {
           DBUtil.closeResultSet(rs);  
           DBUtil.closePreparedStatement(ps);  
            cp.freeConnection(con);
        }

        return role;
}
}
