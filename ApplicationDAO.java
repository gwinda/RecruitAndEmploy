package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import common.DataBaseConn;
import entity.AERR;
import entity.Application;



public class ApplicationDAO
{
	/**
	 * 		投递简历
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
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
			String time=df.format(new Date());// new Date()为获取当前系统时间
			ps.setString(1, time);
			ps.setString(2, application.getState());
			ps.setInt(3, application.getIdResume());
			ps.setInt(4, application.getIdEnterpriseRecruitment());
			System.out.println("ad顶顶顶顶Q");
			ps.executeUpdate();
			System.out.println("add OK");
			
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
			throw new RuntimeException("查询申请列表", e);
		}
		
		return applications;
	}
	
	
	
	/**
	 *		通过id查找一个指定的新闻 
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
				System.out.println("个数"+applications.size());
			}
		}
		catch (Exception e)
		{
			throw new RuntimeException("通过id查找......", e);
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
			throw new RuntimeException("通过id查找......", e);
		}
		
		return applications;
	}
	
	//一个特殊的存在
	public List<AERR> findNewsBySDN(int idE)
	{
		Connection conn = null;
		PreparedStatement ps = null;
		List<AERR> aerrs = new ArrayList<AERR>();
		ResultSet rs = null;
		
		try
		{
			
			
			String sql = "select vtime,vstate,einame,ecname,startTime,endtime,rname" +
					" from view2 where idEnterpriseInformation= ?";
			
			conn = DataBaseConn.getCon();
			
			ps = conn.prepareStatement(sql);
			ps.setInt(1, idE);
			
			
			rs = ps.executeQuery();
			
			
			while(rs.next())
			{
				AERR aerr = new AERR();
				aerr.setVtime(rs.getString(1));
				aerr.setVstate(rs.getString(2)); 
				aerr.setEiname(rs.getString(3));
				aerr.setEcname(rs.getString(4));
				aerr.setStartTime(rs.getString(5));
				aerr.setEndtime(rs.getString(6));
				aerr.setRname(rs.getString(7));
				aerrs.add(aerr);
				
			}
		}
		catch (Exception e)
		{
			throw new RuntimeException("通过state查找......", e);
		}
		
		return aerrs;
	}
	public List<AERR> findNewsBySDN(int idE,String days)
	{
		Connection conn = null;
		PreparedStatement ps = null;
		List<AERR> aerrs = new ArrayList<AERR>();
		ResultSet rs = null;
		
		try
		{
			
			
			String sql = "select vtime,vstate,einame,ecname,startTime,endtime,rname" +
					" from view2 where idEnterpriseInformation= ? and startTime> ?  ";
			
			conn = DataBaseConn.getCon();
			
			ps = conn.prepareStatement(sql);
			ps.setInt(1, idE);
			ps.setString(2, days);

			
			
			rs = ps.executeQuery();
			
			
			while(rs.next())
			{
				System.out.println("非空...........................");
				AERR aerr = new AERR();
				aerr.setVtime(rs.getString(1));
				aerr.setVstate(rs.getString(2)); 
				aerr.setEiname(rs.getString(3));
				aerr.setEcname(rs.getString(4));
				aerr.setStartTime(rs.getString(5));
				aerr.setEndtime(rs.getString(6));
				aerr.setRname(rs.getString(7));
				aerrs.add(aerr);
				
			}
		}
		catch (Exception e)
		{
			throw new RuntimeException("通过state查找......", e);
		}
		
		return aerrs;
	}
	public List<AERR> findNewsBySDN(String daye,int idE)
	{
		Connection conn = null;
		PreparedStatement ps = null;
		List<AERR> aerrs = new ArrayList<AERR>();
		ResultSet rs = null;
		
		try
		{
			
			
			String sql = "select vtime,vstate,einame,ecname,startTime,endtime,rname" +
					" from view2 where startTime< ? and idEnterpriseInformation= ?" +
					"";
			
			conn = DataBaseConn.getCon();
			
			ps = conn.prepareStatement(sql);
			ps.setString(1, daye);
			ps.setInt(2, idE);

			
			
			rs = ps.executeQuery();
			
			
			while(rs.next())
			{
				AERR aerr = new AERR();
				aerr.setVtime(rs.getString(1));
				aerr.setVstate(rs.getString(2)); 
				aerr.setEiname(rs.getString(3));
				aerr.setEcname(rs.getString(4));
				aerr.setStartTime(rs.getString(5));
				aerr.setEndtime(rs.getString(6));
				aerr.setRname(rs.getString(7));
				aerrs.add(aerr);
				
			}
		}
		catch (Exception e)
		{
			throw new RuntimeException("通过state查找......", e);
		}
		
		return aerrs;
	}
	
	public List<AERR> findNewsBySDN(int idE,String days,String daye)
	{
		Connection conn = null;
		PreparedStatement ps = null;
		List<AERR> aerrs = new ArrayList<AERR>();
		ResultSet rs = null;
		
		try
		{
			
			
			String sql = "select vtime,vstate,einame,ecname,startTime,endtime,rname" +
					" from view2 where idEnterpriseInformation= ? and startTime> ? and startTime< ?";
			
			conn = DataBaseConn.getCon();
			
			ps = conn.prepareStatement(sql);
			ps.setInt(1, idE);
			ps.setString(2, days);
			ps.setString(3, daye);
		
			
			
			rs = ps.executeQuery();
			
			
			while(rs.next())
			{
				AERR aerr = new AERR();
				aerr.setVtime(rs.getString(1));
				aerr.setVstate(rs.getString(2)); 
				aerr.setEiname(rs.getString(3));
				aerr.setEcname(rs.getString(4));
				aerr.setStartTime(rs.getString(5));
				aerr.setEndtime(rs.getString(6));
				aerr.setRname(rs.getString(7));
				aerrs.add(aerr);
				
			}
		}
		catch (Exception e)
		{
			throw new RuntimeException("通过state查找......", e);
		}
		
		return aerrs;
	}
	
	public List<AERR> findNewsBySDN(int id,int idr)
	{
		Connection conn = null;
		PreparedStatement ps = null;
		List<AERR> aerrs = new ArrayList<AERR>();
		ResultSet rs = null;
		
		try
		{
			
			
			String sql = "select vtime,vstate,einame,ecname,startTime,endtime,rname" +
					" from view2 where idEnterpriseInformation= ? and idEnterpriseRecruitment= ? ";
			
			conn = DataBaseConn.getCon();
			
			ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ps.setInt(2, idr);
			
			
			rs = ps.executeQuery();
			
			
			while(rs.next())
			{
				AERR aerr = new AERR();
				aerr.setVtime(rs.getString(1));
				aerr.setVstate(rs.getString(2)); 
				aerr.setEiname(rs.getString(3));
				aerr.setEcname(rs.getString(4));
				aerr.setStartTime(rs.getString(5));
				aerr.setEndtime(rs.getString(6));
				aerr.setRname(rs.getString(7));
				aerrs.add(aerr);
				
			}
		}
		catch (Exception e)
		{
			throw new RuntimeException("通过state查找......", e);
		}
		
		return aerrs;
	}
	public List<AERR> findNewsBySDN(int idi,int idr,String days)
	{
		Connection conn = null;
		PreparedStatement ps = null;
		List<AERR> aerrs = new ArrayList<AERR>();
		ResultSet rs = null;
		
		try
		{
			
			
			String sql = "select vtime,vstate,einame,ecname,startTime,endtime,rname" +
					" from view2 where idEnterpriseInformation= ? and startTime> ? and idEnterpriseRecruitment= ? ";
			
			conn = DataBaseConn.getCon();
			
			ps = conn.prepareStatement(sql);
			ps.setInt(1, idi);
			ps.setString(2, days);
			ps.setInt(3, idr);
			
			
			
			rs = ps.executeQuery();
			
			
			while(rs.next())
			{
				AERR aerr = new AERR();
				aerr.setVtime(rs.getString(1));
				aerr.setVstate(rs.getString(2)); 
				aerr.setEiname(rs.getString(3));
				aerr.setEcname(rs.getString(4));
				aerr.setStartTime(rs.getString(5));
				aerr.setEndtime(rs.getString(6));
				aerr.setRname(rs.getString(7));
				aerrs.add(aerr);
				
			}
		}
		catch (Exception e)
		{
			throw new RuntimeException("通过state查找......", e);
		}
		
		return aerrs;
	}
	public List<AERR> findNewsBySDN(String daye,int idi,int idr)
	{
		Connection conn = null;
		PreparedStatement ps = null;
		List<AERR> aerrs = new ArrayList<AERR>();
		ResultSet rs = null;
		
		try
		{
			
			
			String sql = "select vtime,vstate,einame,ecname,startTime,endtime,rname" +
					" from view2 where idEnterpriseInformation= ?" +
					" and startTime<? and idEnterpriseRecruitment=? ";
			
			conn = DataBaseConn.getCon();
			
			ps = conn.prepareStatement(sql);
			ps.setInt(1, idi);
			ps.setString(2, daye);
			ps.setInt(3, idr);
			
			
			
			rs = ps.executeQuery();
			
			
			while(rs.next())
			{
				AERR aerr = new AERR();
				aerr.setVtime(rs.getString(1));
				aerr.setVstate(rs.getString(2)); 
				aerr.setEiname(rs.getString(3));
				aerr.setEcname(rs.getString(4));
				aerr.setStartTime(rs.getString(5));
				aerr.setEndtime(rs.getString(6));
				aerr.setRname(rs.getString(7));
				aerrs.add(aerr);
				
			}
		}
		catch (Exception e)
		{
			throw new RuntimeException("通过state查找......", e);
		}
		
		return aerrs;
	}
	public List<AERR> findNewsBySDN(int idi,String days,String daye,int idr)
	{
		Connection conn = null;
		PreparedStatement ps = null;
		List<AERR> aerrs = new ArrayList<AERR>();
		ResultSet rs = null;
		
		try
		{
			
			
			String sql = "select vtime,vstate,einame,ecname,startTime,endtime,rname" +
					" from view2 where idEnterpriseInformation= ?" +
					" and startTime>? and startTime<? and idEnterpriseRecruitment=? ";
			
			conn = DataBaseConn.getCon();
			if (idr==0){sql="select vtime,vstate,einame,ecname,startTime,endtime,rname" +
					" from view2 where idEnterpriseInformation= ?" +
					" and startTime>? and startTime<? and idEnterpriseRecruitment>? ";}
			if(days.equals("")){days="0001-01-01 00:00:00";}
			if(daye.equals("")){daye="9999-01-01 00:00:00";}
			ps = conn.prepareStatement(sql);
		
			
			
			ps.setInt(1, idi);
			ps.setString(2, days);
			ps.setString(3, daye);
			ps.setInt(4, idr);
			
			
			rs = ps.executeQuery();
			
			
			while(rs.next())
			{
				AERR aerr = new AERR();
				aerr.setVtime(rs.getString(1));
				aerr.setVstate(rs.getString(2)); 
				aerr.setEiname(rs.getString(3));
				aerr.setEcname(rs.getString(4));
				aerr.setStartTime(rs.getString(5));
				aerr.setEndtime(rs.getString(6));
				aerr.setRname(rs.getString(7));
				aerrs.add(aerr);
				
			}
		}
		catch (Exception e)
		{
			throw new RuntimeException("通过state查找......", e);
		}
		
		return aerrs;
	}
	
	public List<AERR> findNewsBySDN(String state,int id,String days,String daye,int idr)
	{
		Connection conn = null;
		PreparedStatement ps = null;
		List<AERR> aerrs = new ArrayList<AERR>();
		ResultSet rs = null;
		
		try
		{
			
			
			String sql = "select vtime,vstate,einame,ecname,startTime,endtime,rname" +
					" from view2 where vstate = ? and idEnterpriseInformation= ?" +
					" and startTime>? and startTime<? and idEnterpriseRecruitment=?";
			
			conn = DataBaseConn.getCon();
			
			if (idr==0){sql="select vtime,vstate,einame,ecname,startTime,endtime,rname" +
					" from view2 where vstate = ? and idEnterpriseInformation= ?" +
					" and startTime>? and startTime<? and idEnterpriseRecruitment>?";}
			if(days.equals("")){days="0001-01-01 00:00:00";}
			if(daye.equals("")){daye="9999-01-01 00:00:00";}
			
			
			ps = conn.prepareStatement(sql);
			ps.setString(1, state);
			ps.setInt(2, id);
			ps.setString(3, days);
			ps.setString(4, daye);
			ps.setInt(5, idr);
			
			
			rs = ps.executeQuery();
			
			
			while(rs.next())
			{
				AERR aerr = new AERR();
				aerr.setVtime(rs.getString(1));
				aerr.setVstate(rs.getString(2)); 
				aerr.setEiname(rs.getString(3));
				aerr.setEcname(rs.getString(4));
				aerr.setStartTime(rs.getString(5));
				aerr.setEndtime(rs.getString(6));
				aerr.setRname(rs.getString(7));
				aerrs.add(aerr);
				
			}
		}
		catch (Exception e)
		{
			throw new RuntimeException("通过state查找......", e);
		}
		
		return aerrs;
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
			throw new RuntimeException("通过state查找......", e);
		}
		
		return applications;
	}
	
	/**
	 *		更新指定的一个新闻 
	*/
	public void updateApplication(String s,int r,int re)
	{
		Connection conn = null;
		PreparedStatement ps = null;
		try
		{
			System.out.println("进入更新");
			
			String sql = "update application set state = ? where idResume = ? and idEnterpriseRecruitment = ? ";
			System.out.println("语句正确");
			conn = DataBaseConn.getCon();
			
			ps = conn.prepareStatement(sql);
			ps.setString(1, s);
			ps.setInt(2, r);
			ps.setInt(3,re);
			System.out.println("操作正确");
			ps.executeUpdate();
			System.out.println("更新成功");
			
		}
		catch (Exception e)
		{
			throw new RuntimeException("更新新闻出错......", e);
		}
		
	}
	
	
	
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
				System.out.println("个数"+applications.size());
			}
		}
		catch (Exception e)
		{
			throw new RuntimeException("通过id查找......", e);
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
//			throw new RuntimeException("通过id查找......", e);
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
			throw new RuntimeException("通过state查找......", e);
		}
		
		return applications;
	}
	
	
	
	
}