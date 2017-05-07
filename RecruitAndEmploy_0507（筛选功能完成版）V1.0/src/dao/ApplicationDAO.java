package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import common.DataBaseConn;
import entity.Application;



public class ApplicationDAO
{
	/**
	 * 		Ͷ�ݼ���
	*/
	public void add(Application application)
	{
		Connection conn = null;
		PreparedStatement ps = null;
		try
		{
			conn = DataBaseConn.getCon();
			
			String sql = "insert into application(time,state,idResume,idEnterpriseRecruitment) values(?,?,?,?)";
			System.out.println("add enter");
			ps = conn.prepareStatement(sql);
			//ps.setInt(1, application.getIdApplication());
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//�������ڸ�ʽ
			String time=df.format(new Date());// new Date()Ϊ��ȡ��ǰϵͳʱ��
			ps.setString(1, time);
			ps.setString(2, application.getState());
			ps.setInt(3, application.getIdResume());
			ps.setInt(4, application.getIdEnterpriseRecruitment());
			System.out.println("add Q");
			ps.executeUpdate();
			System.out.println("add OK");
			
		}
		catch (Exception e)
		{
			throw new RuntimeException("Ͷ��ʧ��........", e);
		}
		finally
		{
			//�ر�����
			DataBaseConn.close(conn,ps,null);
		}
	}
	
	/**
	 *		���ŵ��б���ʾ 
	*/
	public List<Application> getapplicationsList()
	{
		List<Application> applications = new ArrayList<Application>();
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try
		{
			conn = DataBaseConn.getCon();
			
			String sql = "select * from application order by Time desc";
			
			ps = conn.prepareStatement(sql);
			
			rs = ps.executeQuery();
			
			while(rs.next())
			{
				Application application = new Application();
				
				application.setIdApplication(rs.getInt(1));
				application.setTime(rs.getDate(2)); 
				application.setState(rs.getString(3));
				application.setIdResume(rs.getInt(4));
				application.setIdEnterpriseRecruitment(rs.getInt(5));
				
			
				applications.add(application);
			}
		}
		catch (Exception e)
		{
			throw new RuntimeException("��ѯ�����б�", e);
		}
		
		return applications;
	}
	
	
	
	/**
	 *		ͨ��id����һ��ָ�������� 
	*/
	public List<Application> findNewsByIdI(int id)
	{
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<Application> applications = new ArrayList<Application>();
		Application application = null;
		try
		{
			
			String sql = "select idapplication,time,state,idResume,idEnterpriseRecruitment from application where idEnterpriseRecruitment= ? ";
			
			conn = DataBaseConn.getCon();
			
			ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			
			
			rs = ps.executeQuery();
			
			while(rs.next())
			{
				application = new Application();
				application.setIdApplication(rs.getInt(1));
				application.setTime(rs.getDate(2)); 
				application.setState(rs.getString(3));
				application.setIdResume(rs.getInt(4));
				application.setIdEnterpriseRecruitment(rs.getInt(5));
				applications.add(application);
				System.out.println("����"+applications.size());
			}
		}
		catch (Exception e)
		{
			throw new RuntimeException("ͨ��id����......", e);
		}
		
		return applications;
	}
	public List<Application> findNewsById(int id)
	{
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<Application> applications = new ArrayList<Application>();
		Application application = null;
		try
		{
			
			String sql = "select idapplication,time,state,idResume,idEnterpriseRecruitment from view1 where idEnterpriseInformation= ? ";
			
			conn = DataBaseConn.getCon();
			
			ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			
			
			rs = ps.executeQuery();
			
			while(rs.next())
			{
				application = new Application();
				application.setIdApplication(rs.getInt(1));
				application.setTime(rs.getDate(2)); 
				application.setState(rs.getString(3));
				application.setIdResume(rs.getInt(4));
				application.setIdEnterpriseRecruitment(rs.getInt(5));
				applications.add(application);
			}
		}
		catch (Exception e)
		{
			throw new RuntimeException("ͨ��id����......", e);
		}
		
		return applications;
	}
	public List<Application> findNewsByState(String state,int id)
	{
		Connection conn = null;
		PreparedStatement ps = null;
		List<Application> applications = new ArrayList<Application>();
		ResultSet rs = null;
		
		try
		{
			
			String sql = "select idapplication,time,state,idResume,idEnterpriseRecruitment from view1 where state = ? and idEnterpriseInformation= ? order by Time desc";
			
			conn = DataBaseConn.getCon();
			
			ps = conn.prepareStatement(sql);
			ps.setString(1, state);
			ps.setInt(2, id);
			
			
			rs = ps.executeQuery();
			
			
			while(rs.next())
			{
				Application application = new Application();
				application.setIdApplication(rs.getInt(1));
				application.setTime(rs.getDate(2)); 
				application.setState(rs.getString(3));
				application.setIdResume(rs.getInt(4));
				application.setIdEnterpriseRecruitment(rs.getInt(5));
				applications.add(application);
				
			}
		}
		catch (Exception e)
		{
			throw new RuntimeException("ͨ��state����......", e);
		}
		
		return applications;
	}
	
	/**
	 *		����ָ����һ������ 
	*/
	public void updateApplication(String s,int r,int re)
	{
		Connection conn = null;
		PreparedStatement ps = null;
		try
		{
			System.out.println("�������");
			
			String sql = "update application set state = ? where idResume = ? and idEnterpriseRecruitment = ? ";
			System.out.println("�����ȷ");
			conn = DataBaseConn.getCon();
			
			ps = conn.prepareStatement(sql);
			ps.setString(1, s);
			ps.setInt(2, r);
			ps.setInt(3,re);
			System.out.println("������ȷ");
			ps.executeUpdate();
			System.out.println("���³ɹ�");
			
		}
		catch (Exception e)
		{
			throw new RuntimeException("�������ų���......", e);
		}
		
	}
	
	
	
	/**
	 *		����idɾ��ָ��������
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
//			throw new RuntimeException("ɾ�����ų���......", e);
//		}
//		
//	}
	
	
	
	public List<Application> findNewsByIdP(int id)
	{
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<Application> applications = new ArrayList<Application>();
		Application application = null;
		try
		{
			
			String sql = "select idapplication,time,state,Resume.idResume,idEnterpriseRecruitment from Resume,view1 where idPersonalInformation= ? and Resume.idResume=view1.idResume";
			
			conn = DataBaseConn.getCon();
			
			ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			
			
			rs = ps.executeQuery();
			
			while(rs.next())
			{
				application = new Application();
				application.setIdApplication(rs.getInt(1));
				application.setTime(rs.getDate(2)); 
				application.setState(rs.getString(3));
				application.setIdResume(rs.getInt(4));
				application.setIdEnterpriseRecruitment(rs.getInt(5));
				applications.add(application);
				System.out.println("����"+applications.size());
			}
		}
		catch (Exception e)
		{
			throw new RuntimeException("ͨ��id����......", e);
		}
		
		return applications;
	}
//	public List<Application> findNewsById(int id)
//	{
//		Connection conn = null;
//		PreparedStatement ps = null;
//		ResultSet rs = null;
//		List<Application> applications = new ArrayList<Application>();
//		Application application = null;
//		try
//		{
//			
//			String sql = "select idapplication,time,state,idResume,idEnterpriseRecruitment from view1 where idEnterpriseInformation= ? ";
//			
//			conn = DataBaseConn.getCon();
//			
//			ps = conn.prepareStatement(sql);
//			ps.setInt(1, id);
//			
//			
//			rs = ps.executeQuery();
//			
//			while(rs.next())
//			{
//				application = new Application();
//				application.setIdApplication(rs.getInt(1));
//				application.setTime(rs.getDate(2)); 
//				application.setState(rs.getString(3));
//				application.setIdResume(rs.getInt(4));
//				application.setIdEnterpriseRecruitment(rs.getInt(5));
//				applications.add(application);
//			}
//		}
//		catch (Exception e)
//		{
//			throw new RuntimeException("ͨ��id����......", e);
//		}
//		
//		return applications;
//	}
	public List<Application> findNewsByStateP(String state,int id)
	{
		Connection conn = null;
		PreparedStatement ps = null;
		List<Application> applications = new ArrayList<Application>();
		ResultSet rs = null;
		
		try
		{
			
			String sql = "select idapplication,time,state,view1.idResume,idEnterpriseRecruitment from Resume,view1  where Resume.idResume=view1.idResume and  state = ? and idPersonalInformation= ? order by Time desc";
			
			conn = DataBaseConn.getCon();
			
			ps = conn.prepareStatement(sql);
			ps.setString(1, state);
			ps.setInt(2, id);
			
			
			rs = ps.executeQuery();
			
			
			while(rs.next())
			{
				Application application = new Application();
				application.setIdApplication(rs.getInt(1));
				application.setTime(rs.getDate(2)); 
				application.setState(rs.getString(3));
				application.setIdResume(rs.getInt(4));
				application.setIdEnterpriseRecruitment(rs.getInt(5));
				applications.add(application);
				
			}
		}
		catch (Exception e)
		{
			throw new RuntimeException("ͨ��state����......", e);
		}
		
		return applications;
	}
	
	
	
	
}