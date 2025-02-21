package com.kakao.user.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.kakao.user.model.UserDAO;
import com.test.util.JdbcUtil;

public class UserDAO {
	private DataSource ds;
	
	private Connection conn =null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	private static UserDAO instance = new UserDAO();
	
	private UserDAO() {
		try {
			InitialContext ct = new InitialContext();
			ds = (DataSource)ct.lookup("java:comp/env/jdbc/oracle");
			
			
		}catch (Exception e) {
			System.out.println("클래스 로딩중 에러");
		}
	}
	public static UserDAO getInstance() {
		return instance;
	}

	public int checkId(String id) {
		int result = 0;
		String sql = "select * from users where id = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {//중복의 의미
				result=1;
			}else {
				result=0;
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(conn, pstmt, rs);
		}
		return result;
	}
	public int login(String id,String pw) {
		int result =0;
		
		String sql = "select * from user1 where id = ? and pw =?";
		
		try {
			
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				result = 1;
			}else{
				result = 0;
			}
			
		}catch (Exception e) {
			e.printStackTrace();
			
		}finally{
			JdbcUtil.close(conn, pstmt, rs);
		}
		return result;
	}
}

	

