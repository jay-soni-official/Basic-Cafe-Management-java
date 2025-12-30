package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import dao.UserDAO;
import model.User;

public class SignupServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");

        UserDAO userDAO = new UserDAO();

        if (userDAO.isEmailExists(email)) {
            response.sendRedirect("signup.html?error=email_exists");
            return;
        }

        User user = new User();
        user.setFullName(fullName);
        user.setEmail(email);
        user.setPassword(password);
        user.setPhone(phone);

        boolean success = userDAO.registerUser(user);

        if (success) {
            response.sendRedirect("login.html?signup=success");
        } else {
            response.sendRedirect("signup.html?error=failed");
        }
    }
}
