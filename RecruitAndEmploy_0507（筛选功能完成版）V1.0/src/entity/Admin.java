package entity;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import common.DataBaseConn;

public class Admin {
	private int Id;//×ÔÔö
	private String number;//ÕËºÅ
	private String password;//ÃÜÂë
	public Admin(){}
	public int getId() {
		return Id;
	}
	public void setId(int id) {
		Id = id;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public boolean check(String number,String password){
		Connection conn = null;
		PreparedStatement pst=null;
		ResultSet rs=null;
		int count = 0;
		String sql="select count(*) from admin where number=? and password=?";
		try {			
			conn = DataBaseConn.getCon();			
			pst=  conn.prepareStatement(sql);
			pst.setString(1, number);
			pst.setString(2,password);
			rs=pst.executeQuery();
			while(rs.next()){
				count=rs.getInt(1);
			}
		    
		    if(count==1){
		    	return true;
		    }
		    else{
		    	return false;
		    }
		   
		}catch(Exception e){
			e.printStackTrace();	
			return false;
		}finally {
			if (pst != null)
				try {
					pst.close();

				}catch (SQLException e) {
			}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException e) {}
		}
			

		
		
	}

	public String findpsdByNumber(String number){
		Connection conn = null;
		PreparedStatement pst=null;
		ResultSet rs=null;
		String  psd = null;
		String sql="select password from admin where number=? ";
		try {			
			conn = DataBaseConn.getCon();			
			pst=  conn.prepareStatement(sql);
			pst.setString(1, number);
			rs=pst.executeQuery();
			while(rs.next()){
				psd=rs.getString(1);
			}
		    
		}catch(Exception e){
			e.printStackTrace();	
			
		}finally {
			if (pst != null)
				try {
					pst.close();

				}catch (SQLException e) {
			}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException e) {}
		}
			
		return psd;
		
	}
}
