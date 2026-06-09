package com.tastyco;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;



public class FeedbackDAO {
	
	Connection con;
	
	public FeedbackDAO(Connection con) {
		this.con = con;
		// TODO Auto-generated constructor stub
	}
	
	public boolean addFeedback(Feedback f1) {
		boolean status = true;
		
		String query = "insert into feedback (name,email,message) values (?,?,?)";
		
		try {
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setString(1, f1.getName());
			pstmt.setString(2, f1.getEmail());
			pstmt.setString(3, f1.getMessage());
			
			int n = pstmt.executeUpdate();
			if(n==1) {
				status=true;
			}else {
				status=false;
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return status;
	}

}
