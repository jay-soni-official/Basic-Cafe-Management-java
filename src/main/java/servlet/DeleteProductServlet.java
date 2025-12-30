package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductDAO;




public class DeleteProductServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            int id = Integer.parseInt(request.getParameter("id"));

            ProductDAO dao = new ProductDAO();
            dao.deleteProduct(id);

            response.sendRedirect("home.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("home.jsp");
        }
    }
}
