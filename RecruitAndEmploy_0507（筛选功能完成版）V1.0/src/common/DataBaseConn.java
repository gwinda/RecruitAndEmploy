package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * ��������MY SQL���ݿ�
 */
public class DataBaseConn {
    private static Connection con;
    private Statement stmt;
    private ResultSet rs;
    private static final String drivername="com.mysql.jdbc.Driver";
    private static final String url="jdbc:mysql://localhost:3306/RecruitAndEmploy";
    private static final String username="root";
    private static final String password="";
    /*
     * ������ݿ��һ�����Ӷ���
     */
    public static synchronized Connection getCon() throws Exception{
    	try{
    		Class.forName(drivername);
    		con=DriverManager.getConnection(url,username,password);
    	}
    	catch(SQLException e){
    		System.err.println(e.getMessage());
    		throw e;
    	}
    	return con;
    }
    /*
     * ���һ��Statement����ֻ��
     */
    public Statement getStmtread(){
    	try{
    		con=getCon();
    		stmt=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
    		return stmt;
    	}
    	catch(Exception e){
    		System.err.println(e.getMessage());
    		e.printStackTrace();
    	}
    	return null;
    }
    /*
     * ���һ�������
     */
    public ResultSet getRs(String sql){
    	try{
    		stmt=getStmtread();
    		rs=stmt.executeQuery(sql);
    		return rs;
    	}
    	catch(Exception e){
    		System.err.println(e.getMessage());
    		e.printStackTrace();
    	}
    	return null;
    }
    /*
     * ���һ��Statement���� ���Ը��º�insert
     */
    public Statement getStmt(){
    	try{
    		con=getCon();
    		stmt=con.createStatement();
    		return stmt;
    	}
    	catch(Exception e){
    		System.err.println(e.getMessage());
    		e.printStackTrace();
    	}
    	return null;
    }
    /*
     * �ͷŽ����rs Statement���� �ر�����
     */
    public static synchronized void close(Connection conn , Statement statement , ResultSet rs){
    	try{
    		if(rs!=null){
    			rs.close();
    			rs=null;
    		}
    	}
    	catch(Exception e){
    		System.err.println(e.getMessage());
    		e.printStackTrace();
    	}
    	try{
    		if(statement!=null){
    			statement.close();
    			statement=null;
    		}
    	}
    	catch(Exception e){
    		System.err.println(e.getMessage());
    		e.printStackTrace();
    	}
    	try{
    		if(con!=null){
    			con.close();
    			con=null;
    		}
    	}
    	catch(Exception e){
    		System.err.println(e.getMessage());
    		e.printStackTrace();
    	}
    }
    
    
    public synchronized void close(){
    	try{
    		if(rs!=null){
    			rs.close();
    			rs=null;
    		}
    	}
    	catch(Exception e){
    		System.err.println(e.getMessage());
    		e.printStackTrace();
    	}
    	try{
    		if(stmt!=null){
    			stmt.close();
    			stmt=null;
    		}
    	}
    	catch(Exception e){
    		System.err.println(e.getMessage());
    		e.printStackTrace();
    	}
    	try{
    		if(con!=null){
    			con.close();
    			con=null;
    		}
    	}
    	catch(Exception e){
    		System.err.println(e.getMessage());
    		e.printStackTrace();
    	}
    }
}
