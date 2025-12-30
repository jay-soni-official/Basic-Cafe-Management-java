<%@ page import="dao.ProductDAO, model.Product" %>
<%@ page session="true" %>

<%
    model.User currentUser = (model.User) session.getAttribute("currentUser");
    if (currentUser == null) {
        response.sendRedirect("login.html");
        return;
    }

    int id = Integer.parseInt(request.getParameter("id"));
    ProductDAO dao = new ProductDAO();
    Product product = dao.getProductById(id);

    if (product == null) {
        response.sendRedirect("home.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Product | CafePro</title>
<link rel="stylesheet" href="css/style.css">

<style>
/* Page background */
body {
    margin: 0;
    font-family: Arial, sans-serif;
    background: #f4f4f4;
}

/* Center container */
.container {
    min-height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
}

/* Card box */
.card {
    background: #fff;
    padding: 30px;
    width: 350px;
    border-radius: 8px;
    box-shadow: 0 10px 25px rgba(0,0,0,0.15);
}

/* Title */
.card h2 {
    text-align: center;
    margin-bottom: 20px;
}

/* Inputs */
.card input {
    width: 100%;
    padding: 10px;
    margin-bottom: 15px;
    border-radius: 5px;
    border: 1px solid #ccc;
    font-size: 14px;
}

/* Button */
.card button {
    width: 100%;
    padding: 10px;
    background: #ff9900;
    color: #fff;
    border: none;
    border-radius: 5px;
    font-size: 16px;
    cursor: pointer;
}

.card button:hover {
    background: #e68a00;
}

/* Back link */
.back-link {
    display: block;
    text-align: center;
    margin-top: 15px;
    text-decoration: none;
    color: #333;
    font-size: 14px;
}

.back-link:hover {
    text-decoration: underline;
}
</style>
</head>

<body>

<div class="container">
    <div class="card">
        <h2>Edit Product</h2>

        <form action="EditProductServlet" method="post">
            <input type="hidden" name="id" value="<%= product.getProductId() %>">

            <input type="text" name="name" value="<%= product.getName() %>" required>
            <input type="text" name="category" value="<%= product.getCategory() %>" required>
            <input type="number" step="0.01" name="price" value="<%= product.getPrice() %>" required>

            <button type="submit">Update Product</button>
        </form>

        <a href="home.jsp" class="back-link">← Back to Dashboard</a>
    </div>
</div>

</body>
</html>
