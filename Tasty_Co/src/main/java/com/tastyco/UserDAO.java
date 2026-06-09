package com.tastyco;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class UserDAO {
	
	Connection con;
	
	public UserDAO(Connection con) {
		this.con = con;
	}
	
	public boolean addUser(User u1) {
		String query = "insert into users (name, username, email, password) values (?,?,?,?)";
		
		try (PreparedStatement pstmt = con.prepareStatement(query)) {
			pstmt.setString(1, u1.getName());
			pstmt.setString(2, u1.getUsername());
			pstmt.setString(3, u1.getEmail());
			pstmt.setString(4, PasswordUtil.hashPassword(u1.getPassword()));
			int n = pstmt.executeUpdate();
			return n == 1;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

}
