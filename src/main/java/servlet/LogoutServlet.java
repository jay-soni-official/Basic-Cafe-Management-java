package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class LogoutServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false); // do not create a new session
        if (session != null) {
            session.invalidate(); // invalidate session
        }

        response.sendRedirect("login.html"); // redirect to login page
    }
}
