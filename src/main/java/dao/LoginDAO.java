package dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import util.DBConnection;


public class LoginDAO {

    public String validateUser(String email, String password) {
        String sql = "SELECT role FROM users WHERE email=? AND password=? AND status='ACTIVE'";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getString("role");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
