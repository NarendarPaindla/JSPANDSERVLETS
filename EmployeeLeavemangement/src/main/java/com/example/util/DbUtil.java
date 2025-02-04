package com.example.util;

import java.sql.*;
public class DbUtil {
	private static final String URL="jdbc:mysql://localhost:3306/employee_CSBETA";
	private static final String USER="root";
	private static final String PASS="pass123";
	static {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	public static Connection getConnection() throws SQLException{
		return DriverManager.getConnection(URL,USER,PASS);
	}

}
