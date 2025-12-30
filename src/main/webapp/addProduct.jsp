<%@ page session="true" %>

<%
    model.User currentUser = (model.User) session.getAttribute("currentUser");
    if (currentUser == null) {
        response.sendRedirect("login.html");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Add Product | CafePro</title>

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

.header a {
    color: #fff;
    margin-left: 20px;
    text-decoration: none;
}

.btn-outline {
    border: 1px solid #ff9900;
    padding: 6px 12px;
    border-radius: 5px;
}

/* Form container */
.form-container {
    max-width: 450px;
    margin: 50px auto;
    background: #fff;
    padding: 25px;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0,0,0,0.1);
}

.form-container h2 {
    text-align: center;
    margin-bottom: 20px;
}

/* Inputs */
.form-container input {
    width: 100%;
    padding: 10px;
    margin-bottom: 15px;
    border: 1px solid #ccc;
    border-radius: 4px;
}

/* Button */
.form-container button {
    width: 100%;
    background: #ff9900;
    color: #fff;
    padding: 10px;
    border: none;
    border-radius: 5px;
    font-size: 16px;
    cursor: pointer;
}

.form-container button:hover {
    background: #e68a00;
}

.back-link {
    display: block;
    text-align: center;
    margin-top: 15px;
    text-decoration: none;
    color: #333;
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

<div class="form-container">
    <h2>Add Product</h2>

    <form action="AddProductServlet" method="post">
        <input type="text" name="name" placeholder="Product Name" required>
        <input type="text" name="category" placeholder="Category" required>
        <input type="number" step="0.01" name="price" placeholder="Price" required>

        <button type="submit">Save Product</button>
    </form>

    <a href="home.jsp" class="back-link">← Back to Dashboard</a>
</div>

</body>
</html>
