package com.example.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import com.example.util.DbUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/register")
public class RegisterServlet extends HttpServlet{
	protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException {
		String username=request.getParameter("username");   
		String email=request.getParameter("email");
		   String password=request.getParameter("password");
		   String role=request.getParameter("role");
		   try(Connection conn= DbUtil.getConnection()){
			   String sql="INSERT INTO users(username,email,password,role) VALUES(?,?,?,?)";
			   PreparedStatement ps=conn.prepareStatement(sql);
			   ps.setString(1, username);
			   ps.setString(2, email);
			   ps.setString(3, password);
			   ps.setString(4, role);
			   ps.executeUpdate();
			   response.sendRedirect("login.jsp?msg=Registration successful! plaease long in.");
		   }catch(Exception e) {
			   e.printStackTrace();
			   response.sendRedirect("register.jsp?msg=Error in registration");
		   }
	   }
}
