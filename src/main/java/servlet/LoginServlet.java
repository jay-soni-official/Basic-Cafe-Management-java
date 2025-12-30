package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import dao.UserDAO;
import model.User;

public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        UserDAO userDAO = new UserDAO();
        User user = userDAO.loginUser(email, password);

        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("currentUser", user);
            response.sendRedirect("home.jsp");
        } else {
            response.sendRedirect("login.html?error=invalid");
        }
    }
}
