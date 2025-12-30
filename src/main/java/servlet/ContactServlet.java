package servlet;


import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.*;

import util.DBConnection;

public class ContactServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name").trim();
        String email = request.getParameter("email").trim();
        String message = request.getParameter("message").trim();

        if (name.isEmpty() || email.isEmpty() || message.isEmpty()) {
            response.sendRedirect("index.html?contact=empty");
            return;
        }

        String sql = "INSERT INTO contacts(name, email, message) VALUES(?,?,?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, message);

            int result = ps.executeUpdate();

            if (result > 0) {
                response.sendRedirect("index.html?contact=success");
            } else {
                response.sendRedirect("index.html?contact=failed");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("index.html?contact=error");
        }
    }
}
