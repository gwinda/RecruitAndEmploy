package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import common.DataBaseConn;

import entity.Einformation;
import entity.Industry;
import entity.Job;

public class PositionDao {
	
	//获取所有大类型
	public List<Industry> getIndustry(){
		List<Industry> Industry = new ArrayList<Industry>();		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try
		{
			conn = DataBaseConn.getCon();			
			String sql = "select * from Industry ";			
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next())
			{
				Industry  industry  = new Industry();
				industry.setId(rs.getInt(1));
				industry.setName(rs.getString(2));			
				Industry.add(industry);
			}
		}
		catch (Exception e)
		{
			throw new RuntimeException("查询申请列表", e);
		}
			return Industry;
	}

	public List<Job> getJod(int kid){
		List<Job> JobList = new ArrayList<Job>();		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try
		{
			conn = DataBaseConn.getCon();			
			String sql = "select * from Job where Industryid=? ";			
			ps = conn.prepareStatement(sql);
			ps.setInt(1, kid);
			rs = ps.executeQuery();
			while(rs.next())
			{
				Job  Job  = new Job();
				Job.setId(rs.getInt(1));
				Job.setName(rs.getString(2));
				Job.setIndustryid(rs.getInt(3));
				JobList.add(Job);
			}
		}
		catch (Exception e)
		{
			throw new RuntimeException("查询申请列表", e);
		}
			return JobList;		
	}
}
