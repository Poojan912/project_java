package com.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class projectutil {

	public static Connection createconnection() {

		Connection conn = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/swing4", "root", "");

		} catch (Exception e) {
			e.printStackTrace();
		}

		return conn;
	}
}
