package servlet;



import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductDAO;
import model.Product;

public class EditProductServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String category = request.getParameter("category");
        double price = Double.parseDouble(request.getParameter("price"));

        Product p = new Product();
        p.setProductId(id);
        p.setName(name);
        p.setCategory(category);
        p.setPrice(price);

        ProductDAO dao = new ProductDAO();
        dao.updateProduct(p);

        response.sendRedirect("home.jsp");
    }
}
