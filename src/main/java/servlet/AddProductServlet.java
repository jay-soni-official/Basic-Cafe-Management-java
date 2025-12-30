package servlet;


import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import model.Product;
import dao.ProductDAO;

public class AddProductServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8"); // handle special characters

        // Get form data
        String name = request.getParameter("name");
        String category = request.getParameter("category");
        String priceStr = request.getParameter("price");

        double price = 0;
        try {
            price = Double.parseDouble(priceStr);
        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.sendRedirect("addProduct.jsp?error=invalidprice");
            return;
        }

        // Create Product object
        Product product = new Product();
        product.setName(name);
        product.setCategory(category);
        product.setPrice(price);

        // Save to database
        ProductDAO dao = new ProductDAO();
        boolean added = dao.addProduct(product);

        if (added) {
            response.sendRedirect("home.jsp?success=productadded");
        } else {
            response.sendRedirect("addProduct.jsp?error=failed");
        }
    }
}
