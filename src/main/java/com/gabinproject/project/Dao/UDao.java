package com.gabinproject.project.Dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource; // 임폴트 주의 꼭 이걸로 해야 함 2번째꺼

import com.gabinproject.project.Dto.BDto;

public class UDao {
	
	DataSource dataSource;
	
	public UDao() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/oracle");
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int login(String id, String pw) {

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
				
	try {
			
			connection = dataSource.getConnection();
			
			String query = "select pw from MVC_user where id = ?";
			
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, id);

			
			resultSet = preparedStatement.executeQuery();
			
			if(resultSet.next()) {
				if(pw.equals(resultSet.getString("pw"))) {
					return 1; // 로그인 성공
				}else {
					return -1; // 로그인 실패
				}
			}else{
					return 0; //아이디가 존재하지 않음(미가입 회원)
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return -2; // 데이터베이스 오류
	}
	
	public void join(String name, String id, String pw, String mail, String phone) {

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
				
	try {
			
			connection = dataSource.getConnection();
			
			String query = "insert into MVC_USER (num, name, id, pw, email, phone) values(MVC_USER_seq.nextval, ?, ?, ?, ?, ?)";
			
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, name);
			preparedStatement.setString(2, id);
			preparedStatement.setString(3, pw);
			preparedStatement.setString(4, mail);
			preparedStatement.setString(5, phone);
		
			int rn = preparedStatement.executeUpdate();
						
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	
	
	
}

