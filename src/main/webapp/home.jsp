<%@ page import="java.util.*, dao.ProductDAO, model.Product" %>
<%@ page session="true" %>

<%
    model.User currentUser = (model.User) session.getAttribute("currentUser");
    if (currentUser == null) {
        response.sendRedirect("login.html");
        return;
    }

    ProductDAO productDAO = new ProductDAO();
    List<Product> products = productDAO.getAllProducts();
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Dashboard | CafePro</title>

<style>
body {
    margin: 0;
    font-family: Arial, sans-serif;
    background: #f4f4f4;
}

/* Header */
.header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    background: #333;
    color: #fff;
    padding: 12px 20px;
}

.logo {
    font-size: 20px;
    font-weight: bold;
}

.logo span {
    color: #ff9900;
}

.header nav a {
    color: #fff;
    margin-left: 20px;
    text-decoration: none;
}

.header nav a:hover {
    color: #ff9900;
}

.btn-outline {
    border: 1px solid #ff9900;
    padding: 6px 12px;
    border-radius: 5px;
}

/* Section */
.section {
    max-width: 1100px;
    margin: 30px auto;
    background: #fff;
    padding: 25px;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0,0,0,0.1);
}

.section h2 {
    margin-bottom: 15px;
}

/* Add button */
.add-product-btn {
    display: inline-block;
    background: #ff9900;
    color: #fff;
    padding: 10px 16px;
    border-radius: 5px;
    text-decoration: none;
    font-weight: bold;
    margin-bottom: 15px;
}

.add-product-btn:hover {
    background: #e68a00;
}

/* Table */
table {
    width: 100%;
    border-collapse: collapse;
}

table th {
    background: #333;
    color: #fff;
    padding: 12px;
    text-align: left;
}

table td {
    padding: 12px;
    border-bottom: 1px solid #ddd;
}

/* Zebra striping */
tbody tr:nth-child(even) {
    background: #f9f9f9;
}

tbody tr:hover {
    background: rgba(255, 153, 0, 0.15);
}

/* Action buttons */
.action-btn {
    padding: 6px 12px;
    border-radius: 4px;
    text-decoration: none;
    color: #fff;
    font-size: 13px;
}

.edit-btn {
    background: #007bff;
}

.edit-btn:hover {
    background: #0056b3;
}

.delete-btn {
    background: #dc3545;
    margin-left: 5px;
}

.delete-btn:hover {
    background: #b02a37;
}

/* Empty message */
.empty-msg {
    text-align: center;
    color: #777;
    padding: 20px;
}
</style>
</head>

<body>

<header class="header">
    <div class="logo">Cafe<span>Pro</span></div>
    <nav>
        <span>Hello, <%= currentUser.getFullName() %></span>
        <a href="logout" class="btn-outline">Logout</a>
    </nav>
</header>

<section class="section">
    <h2>Product Management</h2>

  <a href="addProduct.jsp" class="add-product-btn">+ Add Product</a>

    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Category</th>
                <th>Price (₹)</th>
                <th>Actions</th>
            </tr>
        </thead>

        <tbody>
        <% if (products.isEmpty()) { %>
            <tr>
                <td colspan="5" class="empty-msg">No products available</td>
            </tr>
        <% } else {
            for (Product p : products) { %>
            <tr>
                <td><%= p.getProductId() %></td>
                <td><%= p.getName() %></td>
                <td><%= p.getCategory() %></td>
                <td><%= String.format("%.2f", p.getPrice()) %></td>
                <td>
                    <a href="editProduct.jsp?id=<%= p.getProductId() %>" class="action-btn edit-btn">Edit</a>
                    <a href="DeleteProductServlet?id=<%= p.getProductId() %>"
                       class="action-btn delete-btn"
                       onclick="return confirm('Are you sure you want to delete this product?');">
                       Delete
                    </a>
                </td>
            </tr>
        <% } } %>
        </tbody>
    </table>
</section>

</body>
</html>
