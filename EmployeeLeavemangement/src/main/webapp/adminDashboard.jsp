<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*, com.example.util.DbUtil" session="true" %>
<%
    // Ensure that only an admin can access this page
    String role = (String) session.getAttribute("role");
    if (role == null || !role.equals("admin")) {
        response.sendRedirect("login.jsp");
    }
%>
<html>
  <head>
    <title>Admin Dashboard</title>
    <style>
      /* Styling for the admin dashboard */
      body {
        font-family: Arial, sans-serif;
        background-color: #f8f9fa;
      }
      .container {
        max-width: 900px;
        margin: 50px auto;
        background: #fff;
        padding: 20px;
        border: 1px solid #dee2e6;
        border-radius: 5px;
      }
      .header {
        display: flex;
        justify-content: space-between;
        align-items: center;
      }
      h2, h3 {
        margin-bottom: 20px;
      }
      .table {
        width: 100%;
        border-collapse: collapse;
        margin-bottom: 20px;
      }
      .table th, .table td {
        border: 1px solid #dee2e6;
        padding: 8px;
        text-align: left;
      }
      .table th {
        background-color: #f1f1f1;
      }
      .btn {
        padding: 8px 12px;
        border: none;
        border-radius: 4px;
        background-color: #007bff;
        color: white;
        text-decoration: none;
        cursor: pointer;
        margin-right: 5px;
      }
      .btn:hover {
        background-color: #0056b3;
      }
      .btn-danger {
        background-color: #dc3545;
      }
      .btn-danger:hover {
        background-color: #c82333;
      }
    </style>
  </head>
  <body>
    <div class="container">
      <div class="header">
         <h2>Admin Dashboard - Welcome, <%= session.getAttribute("username") %></h2>
         <div>
            <a href="adminLeaveManagement.jsp" class="btn">Manage Leaves</a>
            <a href="logout.jsp" class="btn btn-danger">Logout</a>
         </div>
      </div>
      <div>
        <h3>Manage Users</h3>
        <table class="table">
          <thead>
            <tr>
              <th>User ID</th>
              <th>Username</th>
              <th>Email</th>
              <th>Role</th>
              <th>Actions</th>
            </tr>
          </thead>
          <tbody>
            <%
              // Fetch all users for admin management
              try (Connection conn = DbUtil.getConnection()) {
                  String sql = "SELECT * FROM users";
                  Statement stmt = conn.createStatement();
                  ResultSet rs = stmt.executeQuery(sql);
                  while (rs.next()){
            %>
            <tr>
              <td><%= rs.getInt("id") %></td>
              <td><%= rs.getString("username") %></td>
              <td><%= rs.getString("email") %></td>
              <td><%= rs.getString("role") %></td>
              <td>
                <a href="editUser.jsp?id=<%= rs.getInt("id") %>" class="btn">Edit</a>
                <a href="deleteUser.jsp?id=<%= rs.getInt("id") %>" class="btn btn-danger">Delete</a>
              </td>
            </tr>
            <%
                  }
              } catch (Exception e){
                  e.printStackTrace();
              }
            %>
          </tbody>
        </table>
      </div>
    </div>
  </body>
</html>
