package daoImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


import common.DataBaseConn;
import entity.Personalinformation;
/**
 * mess:关于个人用户基本信息的查改
 * @author wenting
 * 
 */
public class PersonalinformationDAO {
	//注册简单版
	public int findIDByMail(String mail)
	{
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int id = 0;
		try
		{
			
			String sql = "select idPersonalInformation from PersonalInformation where mailbox = ?";
			
			conn = DataBaseConn.getCon();
			
			ps = conn.prepareStatement(sql);
			ps.setString(1, mail);
			
			rs = ps.executeQuery();
			
			while(rs.next())
			{
				id=rs.getInt("idPersonalInformation");
				
			}
		}
		catch (Exception e)
		{
			throw new RuntimeException("通过id查找......", e);
		}
		
		return id;
	}
	
	
public boolean add(Personalinformation personalinformation){	
		Connection conn = null;
		PreparedStatement pst=null;
		String sql="insert into personalinformation(phone,Password,Name,Sex,Mailbox)  values(?,?,?,?,?);";
		try {			
			conn = DataBaseConn.getCon();			
			pst=  conn.prepareStatement(sql);	
			pst.setString(1,personalinformation.getPhone());
			pst.setString(2,personalinformation.getPassword());
			pst.setString(3,personalinformation.getName());			
			pst.setString(4, personalinformation.getSex());			
			pst.setString(5, personalinformation.getMailbox());			
			pst.executeUpdate();
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
		return true;
	}
	
	//用户注册简单版
public boolean registerP(Personalinformation personalinformation){		
		Connection conn = null;
		PreparedStatement pst=null;
		String sql="insert into personalinformation(phone,Password,Name,Sex,Mailbox)  values(?,?,?,?,?);";
		try {			
			conn = DataBaseConn.getCon();			
			pst=  conn.prepareStatement(sql);	
			pst.setString(1,personalinformation.getPhone());
			pst.setString(2,personalinformation.getPassword());
			pst.setString(3,personalinformation.getName());			
			pst.setString(4, personalinformation.getSex());			
			pst.setString(5, personalinformation.getMailbox());			
			pst.executeUpdate();
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
		return true;
	}
	
	 //用户注册（添加用户信息）
	public boolean registerPerson(Personalinformation personalinformation){
		
		Connection conn = null;
		PreparedStatement pst=null;
		String sql="insert into personalinformation  values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
		try {			
			conn = DataBaseConn.getCon();			
			pst=  conn.prepareStatement(sql);
			pst.setInt(1, personalinformation.getIdPersonalInformation());
			pst.setString(2,personalinformation.getPassword());
			pst.setString(3,personalinformation.getName());
			pst.setDate(4, personalinformation.getBirth());
			pst.setString(5, personalinformation.getSex());
			pst.setString(6, personalinformation.getPhone());
			pst.setString(7, personalinformation.getMailbox());
			pst.setString(8, personalinformation.getNation());
			pst.setString(9, personalinformation.getHouseholdRegister());
			pst.setString(10, personalinformation.getAddress());
			pst.setString(11, personalinformation.getEducation());
			pst.setString(12, personalinformation.getSchool());
			pst.setString(13, personalinformation.getPoliticalStatus());
			pst.executeUpdate();
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
		return true;
	}
	//修改用户信息
	public boolean updatePerson(Personalinformation personalinformation){		
		Connection conn = null;
		PreparedStatement pst=null;
		String sql="update personalinformation set Name=?,Phone=?,Mailbox=?,Nation=?,HouseholdRegister=?,Address=?,Education=?,PoliticalStatus=? ,birth=?, sex=? ,school=?  where IdPersonalInformation=? ";
		try {			
			conn = DataBaseConn.getCon();			
			pst= conn.prepareStatement(sql);
			pst.setString(1,personalinformation.getName());
			pst.setString(2, personalinformation.getPhone());
			pst.setString(3, personalinformation.getMailbox());
			pst.setString(4, personalinformation.getNation());
			pst.setString(5, personalinformation.getHouseholdRegister());
			pst.setString(6, personalinformation.getAddress());
			pst.setString(7, personalinformation.getEducation());
			pst.setString(8, personalinformation.getPoliticalStatus());			
			pst.setDate(9, personalinformation.getBirth());
			pst.setString(10, personalinformation.getSex());
			pst.setString(11, personalinformation.getSchool());		
			pst.setInt(12, personalinformation.getIdPersonalInformation());
			int i=pst.executeUpdate();
			System.out.println("update daoImpl right");
			System.out.println(i);
			if(i==1){
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
	//有图片的更新个人信息
	public boolean updatePerson2(Personalinformation personalinformation,String FileName){		
		Connection conn = null;
		PreparedStatement pst=null;
		String sql="update personalinformation set Name=?,Phone=?,Mailbox=?,Nation=?,HouseholdRegister=?,Address=?,Education=?,PoliticalStatus=? ,birth=?, sex=? ,school=?,picture=?  where IdPersonalInformation=? ";
		try {			
			conn = DataBaseConn.getCon();			
			pst= conn.prepareStatement(sql);
			pst.setString(1,personalinformation.getName());
			pst.setString(2, personalinformation.getPhone());
			pst.setString(3, personalinformation.getMailbox());
			pst.setString(4, personalinformation.getNation());
			pst.setString(5, personalinformation.getHouseholdRegister());
			pst.setString(6, personalinformation.getAddress());
			pst.setString(7, personalinformation.getEducation());
			pst.setString(8, personalinformation.getPoliticalStatus());			
			pst.setDate(9, personalinformation.getBirth());
			pst.setString(10, personalinformation.getSex());
			pst.setString(11, personalinformation.getSchool());	
			pst.setString(12,FileName);
			pst.setInt(13, personalinformation.getIdPersonalInformation());
			
			int i=pst.executeUpdate();
			System.out.println("update daoImpl right");
			System.out.println(i);
			if(i==1){
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
	//修改密码
	public boolean updatePassword(int id,String password){
		Connection conn = null;
		PreparedStatement pst=null;
		String sql="update personalinformation set password=? where IdPersonalInformation=? ";
		try {			
			conn = DataBaseConn.getCon();			
			pst=  conn.prepareStatement(sql);			
			pst.setString(1,password);
			pst.setInt(2, id);
			int i=pst.executeUpdate();
			if( i==1){
				return true;
			}
			else{
				return false ;
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
    //查看用户个人基本信息
	public Personalinformation lookOne(int id) throws Exception{
		Personalinformation person=new Personalinformation();
		Connection conn = null;
		PreparedStatement pst=null;
		ResultSet rs=null;
		String sql="select * from personalinformation where IdPersonalInformation=? ";
		try {			
			conn = DataBaseConn.getCon();			
			pst=  conn.prepareStatement(sql);
			pst.setInt(1, id);
			rs=pst.executeQuery();
		    while(rs.next()){
		    	person.setIdPersonalInformation(rs.getInt(1));
		    	person.setName(rs.getString(3));
		    	person.setBirth(rs.getDate(4));
		    	person.setSex(rs.getString(5));
		    	person.setPhone(rs.getString(6));
		    	person.setMailbox(rs.getString(7));
		    	person.setNation(rs.getString(8));
		    	person.setHouseholdRegister(rs.getString(9));		    	
		    	person.setAddress(rs.getString(10));
		    	person.setEducation(rs.getString(11));
		    	person.setSchool(rs.getString(12));
		    	person.setPoliticalStatus(rs.getString(13));
		    	person.setPicture(rs.getString(14));
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
		 return person;
	}
	//判断用户登录账号（邮箱与密码是否一致）
	public boolean checkLogin(String mail,String psd){
		//Personalinformation person=new Personalinformation();
		Connection conn = null;
		PreparedStatement pst=null;
		ResultSet rs=null;
		int count = 0;
		String sql="select count(*) from personalinformation where mailbox=? and password=?";
		try {			
			conn = DataBaseConn.getCon();			
			pst=  conn.prepareStatement(sql);
			pst.setString(1, mail);
			pst.setString(2,psd);
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
	
	//查看密码
	public String LookPsdBymail(String mail){
		Connection conn = null;
		PreparedStatement pst=null;
		ResultSet rs=null;
		String result=null;;
		String sql="select password from personalinformation where mailbox=? ";
		try {			
			conn = DataBaseConn.getCon();			
			pst=  conn.prepareStatement(sql);
			pst.setString(1, mail);
			rs=pst.executeQuery();
			while(rs.next()){
				result=rs.getString(1);
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
			
		return result;
	}
	
	//根据电话号码查主键ID
	public int lookIDByPhone(String phone){
		 Personalinformation person=new Personalinformation();
			Connection conn = null;
			PreparedStatement pst=null;
			ResultSet rs=null;
			int id=0;
			String sql="select idPersonalInformation from personalinformation where phone=? ";
			try {			
				conn = DataBaseConn.getCon();			
				pst=  conn.prepareStatement(sql);
				pst.setString(1, phone);
				rs=pst.executeQuery();
			    while(rs.next()){
			    	id=rs.getInt(1);
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
			 return id;	 
	 }

	//根据邮件地址查主键ID
	public int lookIDBymail(String mail){
			Connection conn = null;
			PreparedStatement pst=null;
			ResultSet rs=null;
			int id=0;
			String sql="select idPersonalInformation from personalinformation where mailbox=? ";
			try {			
				conn = DataBaseConn.getCon();			
				pst=  conn.prepareStatement(sql);
				pst.setString(1, mail);
				rs=pst.executeQuery();
			    while(rs.next()){
			    	id=rs.getInt(1);
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
			 return id;	 
	 }
	//判断账号是否已存在
	public boolean checkExit(int email){
		return true;
	}
	//判断表中是否有空值
	public boolean checknull(int id){
		Personalinformation person=new Personalinformation();
		Connection conn = null;
		PreparedStatement pst=null;
		ResultSet rs=null;
		int count = 0;
		String sql="select count(*) from personalinformation where   IdPersonalInformation=?  and HouseholdRegister  is not null " +
				"and Phone is not null and Mailbox is not null and nation is not null and HouseholdRegister  is not null and Address  is not null and Education  is not null " +
				" and PoliticalStatus is not null and birth is not null and sex is not null and school is not null ;";
      
		try {			
			conn = DataBaseConn.getCon();			
			pst=  conn.prepareStatement(sql);
			pst.setInt(1, id);		
			rs=pst.executeQuery();
			while(rs.next()){
				count=rs.getInt(1);
			}
			System.out.println(count);
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
			
		return true;
	}
/*	////根据email查密码
		public String findNewsByMail(String mailbox)
		{
			Connection conn = null;
			PreparedStatement ps = null;
			String password = null;
			ResultSet rs = null;
			
			try
			{
				
				String sql = "select password from personalinformation where mailbox = ? ";
				
				conn = DataBaseConn.getCon();
				
				ps = conn.prepareStatement(sql);
				ps.setString(1, mailbox);
				
				
				rs = ps.executeQuery();
				
			
				if(rs.next())
				{
					password=rs.getString("password");
					
				}
				
			}
			catch (Exception e)
			{
				throw new RuntimeException("通过state查找......", e);
			}
			
			return password;
		}*/

	//主函数，测试代码
		public static void main(String args[]){
		
	 /* Personalinformation person =new Personalinformation();//实例化
		person.setIdPersonalInformation(123);
	   	person.setName("fsd");
		person.setPassword("fsd");
	   	person.setBirth(null);
	   	person.setSex("fff");
	   	person.setPhone(15678);
	   	person.setMailbox("");
	   	person.setNation("");
	   	person.setHouseholdRegister("");		    	
	   	person.setAddress("");
	   	person.setEducation("");
	   	person.setSchool("");
	   	person.setPoliticalStatus("");
	   	System.out.println(person.getEducation());
	    
		PersonalinformationDAO persondao=new PersonalinformationDAO();				
		boolean result=persondao.updatePassword(1, "123456789");
		//boolean result=persondao.updatePerson(person);
		
			System.out.println( "更新"+result);*/
		PersonalinformationDAO persondao=new PersonalinformationDAO();				
		boolean result=persondao.checknull(7);
		//boolean result=persondao.updatePerson(person);
   }

	
}
