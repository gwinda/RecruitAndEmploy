package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.ArrayList;
import java.util.List;

import common.DataBaseConn;
import entity.Einformation;
import entity.Personalinformation;



public class EinformationDAO
{
	/**
	 * 		投递简历
	*/
	public boolean updateB(int id){		
		Connection conn = null;
		PreparedStatement pst=null;
		String sql="update EnterpriseInformation set Authentication=?  where idEnterpriseInformation=? ";
		try {			
			conn = DataBaseConn.getCon();			
			pst= conn.prepareStatement(sql);
			
			pst.setInt(1, 2);
			pst.setInt(2,id);
			
			int i=pst.executeUpdate();
			System.out.println("update dao right");
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
	public boolean updateA(int id){		
		Connection conn = null;
		PreparedStatement pst=null;
		String sql="update EnterpriseInformation set Authentication=?  where idEnterpriseInformation=? ";
		try {			
			conn = DataBaseConn.getCon();			
			pst= conn.prepareStatement(sql);
			
			pst.setInt(1, 1);
			pst.setInt(2,id);
			
			int i=pst.executeUpdate();
			System.out.println("update dao right");
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
	
	
	public void add(Einformation einformation)
	{
		Connection conn = null;
		PreparedStatement ps = null;
		try
		{
			conn = DataBaseConn.getCon();
			
			String sql = "insert into Enterpriseinformation(password,name,phone,mailbox,address,authentication,homepage,trademark,businesslicense) values(?,?,?,?,?,?,?,?,?)";
			
			ps = conn.prepareStatement(sql);
		
			ps.setString(1, einformation.getPassword());
			
			ps.setString(2, einformation.getName());
		
			ps.setString(3, einformation.getPhone());
			
			ps.setString(4, einformation.getMailbox());
		
			ps.setString(5, einformation.getAddress());
			
			ps.setString(6, "0");

			ps.setString(7, einformation.getHomepage());

			ps.setString(8, einformation.getTrademark());
	
			ps.setString(9, einformation.getBusinessLicense());
		
			ps.executeUpdate();
	
			
		}
		catch (Exception e)
		{
			throw new RuntimeException("投递失败........", e);
		}
		finally
		{
			//关闭连接
			DataBaseConn.close(conn,ps,null);
		}
	}
	
	/**
	 *		新闻的列表显示 
	*/
	public List<Einformation> geteInformationsList()
	{
		List<Einformation> einformations = new ArrayList<Einformation>();
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try
		{
			conn = DataBaseConn.getCon();
			
			String sql = "select * from Enterpriseinformation ";
			
			ps = conn.prepareStatement(sql);
	
			rs = ps.executeQuery();

			while(rs.next())
			{
				Einformation  einformation  = new Einformation();
				einformation.setId(rs.getInt(1));
				einformation.setPassword(rs.getString(2));
				einformation.setName(rs.getString(3));
				einformation.setPhone(rs.getString(4));
				einformation.setMailbox(rs.getString(5));
				einformation.setAddress(rs.getString(6));
				einformation.setAuthentition(rs.getString(7));
				einformation.setHomepage(rs.getString(8));
				einformation.setTrademark(rs.getString(9));
				einformation.setBusinessLicense(rs.getString(10));
			
				einformations.add(einformation);
			}
		}
		catch (Exception e)
		{
			throw new RuntimeException("查询申请列表", e);
		}
		
		return einformations;
	}
	public List<Einformation> geteInformationsList(int ispass)
	{
		List<Einformation> einformations = new ArrayList<Einformation>();
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try
		{
			conn = DataBaseConn.getCon();			
			String sql = "select * from Enterpriseinformation where Authentication=?";			
			ps = conn.prepareStatement(sql);
			ps.setInt(1, ispass);	
			rs = ps.executeQuery();

			while(rs.next())
			{
				Einformation  einformation  = new Einformation();
				einformation.setId(rs.getInt(1));
				einformation.setPassword(rs.getString(2));
				einformation.setName(rs.getString(3));
				einformation.setPhone(rs.getString(4));
				einformation.setMailbox(rs.getString(5));
				einformation.setAddress(rs.getString(6));
				einformation.setAuthentition(rs.getString(7));
				einformation.setHomepage(rs.getString(8));
				einformation.setTrademark(rs.getString(9));
				einformation.setBusinessLicense(rs.getString(10));
			
				einformations.add(einformation);
			}
		}
		catch (Exception e)
		{
			throw new RuntimeException("查询申请列表", e);
		}
		
		return einformations;
	}
	public List<Einformation> geteInformationsList(String mailbox)
	{
		List<Einformation> einformations = new ArrayList<Einformation>();
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try
		{
			conn = DataBaseConn.getCon();
			
			String sql = "select * from Enterpriseinformation where mailbox= ?";
			
			ps = conn.prepareStatement(sql);
			ps.setString(1, mailbox);	
			rs = ps.executeQuery();

			while(rs.next())
			{
				Einformation  einformation  = new Einformation();
				einformation.setId(rs.getInt(1));
				einformation.setPassword(rs.getString(2));
				einformation.setName(rs.getString(3));
				einformation.setPhone(rs.getString(4));
				einformation.setMailbox(rs.getString(5));
				einformation.setAddress(rs.getString(6));
				einformation.setAuthentition(rs.getString(7));
				einformation.setHomepage(rs.getString(8));
				einformation.setTrademark(rs.getString(9));
				einformation.setBusinessLicense(rs.getString(10));			
				einformations.add(einformation);
			}
		}
		catch (Exception e)
		{
			throw new RuntimeException("查询申请列表", e);
		}
		
		return einformations;
	}
//	public List<Einformation> geteInformationsList(String mailbox)
//	{
//		List<Einformation> einformations = new ArrayList<Einformation>();
//		
//		Connection conn = null;
//		PreparedStatement ps = null;
//		ResultSet rs = null;
//		try
//		{
//			conn = DataBaseConn.getCon();
//			
//			String sql = "select * from Enterpriseinformation where mailbox= ?";
//			
//			ps = conn.prepareStatement(sql);
//			ps.setString(1, mailbox);	
//			rs = ps.executeQuery();
//
//			while(rs.next())
//			{
//				Einformation  einformation  = new Einformation();
//				einformation.setPassword(rs.getString(2));
//				einformation.setName(rs.getString(3));
//				einformation.setPassword(rs.getString(4));
//				einformation.setMailbox(rs.getString(5));
//				einformation.setAddress(rs.getString(6));
//				einformation.setAuthentition(rs.getString(7));
//				einformation.setHomepage(rs.getString(8));
//				einformation.setTrademark(rs.getString(9));
//				einformation.setBusinessLicense(rs.getString(10));
//			
//				einformations.add(einformation);
//			}
//		}
//		catch (Exception e)
//		{
//			throw new RuntimeException("查询申请列表", e);
//		}
//		
//		return einformations;
//	}
	
	
	
	/**
	 *		通过id查找一个指定的新闻 查看密码
	*/

	public String findNewsByMail(String mail)
	{
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String password = null;
		try
		{
			
			String sql = "select password from Enterpriseinformation where mailbox = ?";
			
			conn = DataBaseConn.getCon();
			
			ps = conn.prepareStatement(sql);
			ps.setString(1, mail);
			
			rs = ps.executeQuery();
			
			while(rs.next())
			{
				password=rs.getString("password");
				
			}
		}
		catch (Exception e)
		{
			throw new RuntimeException("通过id查找......", e);
		}
		
		return password;
	}
	public String findAByMail(String mail)
	{
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String Authentication = null;
		try
		{
			
			String sql = "select Authentication from Enterpriseinformation where mailbox = ?";
			
			conn = DataBaseConn.getCon();
			
			ps = conn.prepareStatement(sql);
			ps.setString(1, mail);
			
			rs = ps.executeQuery();
			
			while(rs.next())
			{
				Authentication=rs.getString("Authentication");
				
			}
		}
		catch (Exception e)
		{
			throw new RuntimeException("通过id查找......", e);
		}
		
		return Authentication;
	}
	
	public int findIDByMail(String mail)
	{
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int id = 0;
		try
		{
			
			String sql = "select idEnterpriseInformation from Enterpriseinformation where mailbox = ?";
			
			conn = DataBaseConn.getCon();
			
			ps = conn.prepareStatement(sql);
			ps.setString(1, mail);
			
			rs = ps.executeQuery();
			
			while(rs.next())
			{
				id=rs.getInt("idEnterpriseInformation");
				
			}
		}
		catch (Exception e)
		{
			throw new RuntimeException("通过id查找......", e);
		}
		
		return id;
	}

public String findNameByMail(String mail)
{
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	String name = null;
	try
	{
		
		String sql = "select name from Enterpriseinformation where mailbox = ?";
		
		conn = DataBaseConn.getCon();
		
		ps = conn.prepareStatement(sql);
		ps.setString(1, mail);
		
		rs = ps.executeQuery();
		
		while(rs.next())
		{
			name=rs.getString("name");
			
		}
	}
	catch (Exception e)
	{
		throw new RuntimeException("通过id查找......", e);
	}
	
	return name;

	
}
public Einformation findyID(int EId)
{
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	String name = null;
	Einformation  einformation  = new Einformation();
	try
	{
		
		String sql = "select * from Enterpriseinformation where idEnterpriseInformation = ?";		
		conn = DataBaseConn.getCon();		
		ps = conn.prepareStatement(sql);
		ps.setInt(1,EId);		
		rs = ps.executeQuery();		
		while(rs.next())
		{			
			einformation.setPassword(rs.getString(2));
			einformation.setName(rs.getString(3));
			einformation.setPhone(rs.getString(4));
			einformation.setMailbox(rs.getString(5));
			einformation.setAddress(rs.getString(6));
			einformation.setAuthentition(rs.getString(7));
			einformation.setHomepage(rs.getString(8));
			einformation.setTrademark(rs.getString(9));
			einformation.setBusinessLicense(rs.getString(10));			
		}
	}
	catch (Exception e)
	{
		throw new RuntimeException("通过id查找......", e);
	}
	
	return einformation ;

	
}
//	public List<Application> findNewsByState(String state)
//	{
//		Connection conn = null;
//		PreparedStatement ps = null;
//		List<Application> applications = new ArrayList<Application>();
//		ResultSet rs = null;
//		
//		try
//		{
//			
//			String sql = "select idapplication,time,state,idResume,idEnterpriseRecruitment from application where state = ? order by Time desc";
//			
//			conn = DataBaseConn.getCon();
//			
//			ps = conn.prepareStatement(sql);
//			ps.setString(1, state);
//			
//			
//			rs = ps.executeQuery();
//			
//			
//			while(rs.next())
//			{
//				Application application = new Application();
//				application.setIdApplication(rs.getInt(1));
//				application.setTime(rs.getDate(2)); 
//				application.setState(rs.getString(3));
//				application.setIdResume(rs.getInt(4));
//				application.setIdEnterpriseRecruitment(rs.getInt(5));
//				applications.add(application);
//				
//			}
//		}
//		catch (Exception e)
//		{
//			throw new RuntimeException("通过state查找......", e);
//		}
//		
//		return applications;
//	}
////	
////	/**
////	 *		更新指定的一个新闻 
//	//*/
	public void updateEInformation(Einformation einformation)
	{
		Connection conn = null;
		PreparedStatement ps = null;
		try
		{
			System.out.println("进入更新");
			
			String sql = "update Enterpriseinformation set  name = ? phone = ? mailbox = ? address = ? authentition = ? homepage = ? trademark = ? businesslicense = ? where id = ? ";
			System.out.println("语句正确");
			conn = DataBaseConn.getCon();
			
			ps = conn.prepareStatement(sql);
			//ps.setString(1, einformation.getPassword());
			ps.setString(1, einformation.getName());
			ps.setString(2,einformation.getPhone());
			ps.setString(3, einformation.getMailbox());
			ps.setString(4, einformation.getAddress());
			ps.setString(5, einformation.getAuthentition());
			ps.setString(6, einformation.getHomepage());
			ps.setString(7, einformation.getTrademark());
			ps.setString(8, einformation.getBusinessLicense());
			ps.setInt(9, einformation.getId());
			System.out.println("操作正确");
			ps.executeUpdate();
			System.out.println("更新成功");
			
		}
		catch (Exception e)
		{
			throw new RuntimeException("更新新闻出错......", e);
		}
		
	}
}
//	
	
	/**
	 *		根据id删除指定的新闻
	*/
//	public void deleteNews(int id)
//	{
//		Connection conn = null;
//		PreparedStatement ps = null;
//		try
//		{
//			String sql = "delete from t_news where id = ?";
//			
//			conn = DataBaseConn.getCon();
//			
//			ps = conn.prepareStatement(sql);
//			ps.setInt(1, id);
//			
//			ps.executeUpdate();
//			
//		}
//		catch (Exception e)
//		{
//			throw new RuntimeException("删除新闻出错......", e);
//		}
//		
//	}
