package daoImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import common.DataBaseConn;

import dao.EcollectionDAO;
import domain.Ecollection;

public class EcollectionDAOImpl implements EcollectionDAO{

	private Connection conn = null;
	private PreparedStatement ps = null;
	@Override
	public void create(Ecollection ecollection) {
		// TODO Auto-generated method stub
		try
		{
			conn = DataBaseConn.getCon();
			
			String sql = "insert into Ecollection(id,eiid,resumeId,time,eclass) values(?,?,?,?,?) ";
			System.out.println("add enter");
			ps = conn.prepareStatement(sql);
			//ps.setInt(1, application.getIdApplication());
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
			String time=df.format(new Date());// new Date()为获取当前系统时间
			ps.setString(4, time);
			ps.setInt(5,ecollection.getEclass());
			ps.setInt(1, ecollection.getId());
			ps.setInt(2, ecollection.getEiid());
			ps.setInt(3, ecollection.getResumeId());
			System.out.println("add Q");
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

	@Override
	public void update(Ecollection ecollection) {
		// TODO Auto-generated method stub
		try
		{
			System.out.println("进入更新");
			
			String sql = "update Ecollection set  eiid=? , ResumeId = ? time = ? , eclass = ? where id = ? ";
			System.out.println("语句正确");
			conn = DataBaseConn.getCon();
			
			ps = conn.prepareStatement(sql);
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
			String time=df.format(new Date());// new Date()为获取当前系统时间
			ps.setString(3, time);
			ps.setInt(4,ecollection.getEclass());
			ps.setInt(5, ecollection.getId());
			ps.setInt(1, ecollection.getEiid());
			ps.setInt(2, ecollection.getResumeId());
			System.out.println("操作正确");
			ps.executeUpdate();
			System.out.println("更新成功");
			
		}
		catch (Exception e)
		{
			throw new RuntimeException("更新新闻出错......", e);
		}
		finally
		{
			//关闭连接
			DataBaseConn.close(conn,ps,null);
		}
		
	}

	@Override
	public void delete_one(int id) {
		// TODO Auto-generated method stub
		String sql="delete from Ecollection where id=?";
		try {			
			conn = DataBaseConn.getCon();			
			ps=  conn.prepareStatement(sql);
			ps.setInt(1, id);		
			ps.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();

		}finally {
			if (ps != null)
				try {
					ps.close();
				}catch (SQLException e) {
			}

			if (conn != null)
				try {
					conn.close();
				} catch (SQLException e) {		
				}			
		}
		
	}

	@Override
	public void delete_more(int eclass) {
		// TODO Auto-generated method stub
		String sql="delete from Ecollection where eclass=?";
		try {			
			conn = DataBaseConn.getCon();			
			ps=  conn.prepareStatement(sql);
			ps.setInt(1, eclass);		
			ps.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();

		}finally {
			if (ps != null)
				try {
					ps.close();
				}catch (SQLException e) {
			}

			if (conn != null)
				try {
					conn.close();
				} catch (SQLException e) {		
				}			
		}
		
	}

	public List<Ecollection> queryList(int Eclass) {
		// TODO Auto-generated method stub
		List<Ecollection> list = new ArrayList<Ecollection>();
		ResultSet rs = null;
		try
		{
			conn = DataBaseConn.getCon();
			
			String sql = "select * from EcollectionView where Eclass=? order by Time desc";
			
			ps = conn.prepareStatement(sql);
			ps.setInt(1, Eclass);
			rs = ps.executeQuery();
			
			while(rs.next())
			{
				Ecollection ecollection = new Ecollection();
				ecollection.setId(rs.getInt(1));
				ecollection.setEiid(rs.getInt(2));
				ecollection.setResumeId(rs.getInt(3));
				ecollection.setTime(rs.getString(4));
				ecollection.setEclass(rs.getInt(5));
				ecollection.setEname(rs.getString(6));
			
				
			
				list.add(ecollection);
			}
		}
		catch (Exception e)
		{
			throw new RuntimeException("查询申请列表", e);
		}
		finally
		{
			//关闭连接
			DataBaseConn.close(conn,ps,null);
		}
		
		return list;
		
	}
	

}
