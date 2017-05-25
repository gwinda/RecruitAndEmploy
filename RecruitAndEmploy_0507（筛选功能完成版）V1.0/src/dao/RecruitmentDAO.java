package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import common.DataBaseConn;
import entity.Personalinformation;
import entity.Recruitment;

public class RecruitmentDAO {
	/**
	 * 企业发布招聘信息
	 */
	public void update(){
		Connection conn = null;
		PreparedStatement ps = null;
		try
		{
			conn = DataBaseConn.getCon();
			
			String sql = "update EnterpriseRecruitment set isending=2  where endtime < now();";
			ps = conn.prepareStatement(sql);
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
	
	public boolean updateEnd(int id){		
		Connection conn = null;
		PreparedStatement pst=null;
		String sql="update enterpriserecruitment set isending=?  where idEnterpriseRecruitment=? ";
		try {			
			conn = DataBaseConn.getCon();			
			pst= conn.prepareStatement(sql);
			pst.setInt(1,2);
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
	
	
	
	
	public boolean add(Recruitment recruitment){
		Connection conn = null;
		PreparedStatement ps = null;
		
		try{
			conn = DataBaseConn.getCon();
			
			String sql="insert into enterpriserecruitment(name,requirement,startTime,endTime,position,workingPlace,idEnterpriseInformation,salary,number) values(?,?,?,?,?,?,?,?,?)";
	
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
			String time=df.format(new Date());// new Date()为获取当前系统时间
			
			ps = conn.prepareStatement(sql);
		
		    ps.setString(1,recruitment.getName());
		    ps.setString(2,recruitment.getRequirement());
		    ps.setString(3, time);    //获取当前时间为开始时间
		    ps.setString(4, recruitment.getEndTime());
		    //ps.setBoolean(5, recruitment.getIsending());
		    ps.setInt(5, recruitment.getPosition());
		    ps.setString(6, recruitment.getWorkingPlace());
		    ps.setInt(7, recruitment.getIdEnterpriseInformation());
		    ps.setInt(8, recruitment.getSalary());
		    ps.setInt(9,recruitment.getNumber());
		    ps.executeUpdate();
		    
		    
		    
		}catch(Exception e)
		{
			e.printStackTrace();
			throw new RuntimeException("发布招聘失败", e);
		}
		finally
		{
			//关闭连接
			DataBaseConn.close(conn,ps,null);
		}
		
		return true;
	}
	
	
	/**
	 * 按职位名称查找企业已经发布的招聘表
	 */
public List<Recruitment> searchbyname(String name){
		
		List<Recruitment> recruitments = new ArrayList<Recruitment>();
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		
		try{
			conn = DataBaseConn.getCon();
			//name,requirement,startTime,endTime,isending,position,workingPlace,idEnterpriseInformation,salary,number
			String sql="select * from  enterpriserecruitment where name like  ? ";
			
			ps = conn.prepareStatement(sql);		
		    ps.setString(1,"%"+name+"%");
		    
		    rs = ps.executeQuery();		   
		    while(rs.next())
			{
		    	Recruitment  recruitment = new Recruitment();
		        recruitment.setIdEnterpriseRecruitment(rs.getInt(1));
		    	recruitment.setName(rs.getString(2));
		    	recruitment.setRequirement(rs.getString(3));
		    	recruitment.setStartTime(rs.getDate(4));
		    	recruitment.setEndTime(rs.getString(5));
		    	recruitment.setPosition(rs.getInt(7));
		    	recruitment.setWorkingPlace(rs.getString(8));
		    	recruitment.setIdEnterpriseInformation(rs.getInt(9));
		    	recruitment.setSalary(rs.getInt(10));
		    	recruitment.setNumber(rs.getInt(11));
		    	recruitments.add(recruitment);
		    	System.out.println("haha");
			}
		    
		}catch(Exception e)
		{
			throw new RuntimeException("按职业名称查询", e);
		}
		finally
		{
			//关闭连接
			DataBaseConn.close(conn,ps,null);
		}
		
		return recruitments;
		
	}

public List<Recruitment> searchbyjobid(int id){
	
	List<Recruitment> recruitments = new ArrayList<Recruitment>();
	
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;	
	try{
		conn = DataBaseConn.getCon();
		//name,requirement,startTime,endTime,isending,position,workingPlace,idEnterpriseInformation,salary,number
		String sql="select * from  enterpriserecruitment where position =  ? ";		
		ps = conn.prepareStatement(sql);		
	    ps.setInt(1,id);
	    
	    rs = ps.executeQuery();		   
	    while(rs.next())
		{
	    	Recruitment  recruitment = new Recruitment();
	        recruitment.setIdEnterpriseRecruitment(rs.getInt(1));
	    	recruitment.setName(rs.getString(2));
	    	recruitment.setRequirement(rs.getString(3));
	    	recruitment.setStartTime(rs.getDate(4));
	    	recruitment.setEndTime(rs.getString(5));
	    	recruitment.setPosition(rs.getInt(7));
	    	recruitment.setWorkingPlace(rs.getString(8));
	    	recruitment.setIdEnterpriseInformation(rs.getInt(9));
	    	recruitment.setSalary(rs.getInt(10));
	    	recruitment.setNumber(rs.getInt(11));
	    	recruitments.add(recruitment);	    	
		}
	    
	}catch(Exception e)
	{
		throw new RuntimeException("按职业名称查询", e);
	}
	finally
	{
		//关闭连接
		DataBaseConn.close(conn,ps,null);
	}
	
	return recruitments;
	
}
		
		/**
		 * 展示所有发布的招聘信息
		 */
		public List<Recruitment> getrecruitmentsList(){
			
			List<Recruitment> recruitments = new ArrayList<Recruitment>();
			
			Connection conn = null;
			PreparedStatement ps = null;
			ResultSet rs = null;
			
			try{
				conn = DataBaseConn.getCon();
				
				String sql="select * from  enterpriserecruitment ";
				
				ps = conn.prepareStatement(sql);
				
				rs = ps.executeQuery();
				
				while(rs.next()){
					
					
					Recruitment recruitment = new Recruitment();
					recruitment.setIdEnterpriseRecruitment(rs.getInt(1));
			    	recruitment.setName(rs.getString(2));
			    	recruitment.setRequirement(rs.getString(3));
			    	recruitment.setStartTime(rs.getDate(4));
			    	recruitment.setEndTime(rs.getString(5));
			    	recruitment.setIsending(rs.getInt(6));
			    	recruitment.setPosition(rs.getInt(7));
			    	recruitment.setWorkingPlace(rs.getString(8));
			    	recruitment.setIdEnterpriseInformation(rs.getInt(9));
			    	recruitment.setSalary(rs.getInt(10));
			    	recruitment.setNumber(rs.getInt(11));
			    	recruitments.add(recruitment);
			    	System.out.println("haha");
					
				}
				
			    
			}catch(Exception e)
			{
				throw new RuntimeException("按职业名称查询", e);
			}
			finally
			{
				//关闭连接
				DataBaseConn.close(conn,ps,null);
			}
			
			return recruitments;
		}
	
public List<Recruitment> getrecruitmentsList(int id){
	
	List<Recruitment> recruitments = new ArrayList<Recruitment>();
	
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	try{
		conn = DataBaseConn.getCon();
		
		String sql="select * from  enterpriserecruitment where idEnterpriseInformation=? order by isending asc" ;
		
		ps = conn.prepareStatement(sql);
	
		ps.setInt(1, id);
		rs = ps.executeQuery();
		
		while(rs.next()){
			
			
			Recruitment recruitment = new Recruitment();
			recruitment.setIdEnterpriseRecruitment(rs.getInt(1));
	    	recruitment.setName(rs.getString(2));
	    	recruitment.setRequirement(rs.getString(3));
	    	recruitment.setStartTime(rs.getDate(4));
	    	recruitment.setEndTime(rs.getString(5));
	    	recruitment.setIsending(rs.getInt(6));
	    	recruitment.setPosition(rs.getInt(7));
	    	recruitment.setWorkingPlace(rs.getString(8));
	    	recruitment.setIdEnterpriseInformation(rs.getInt(9));
	    	recruitment.setSalary(rs.getInt(10));
	    	recruitment.setNumber(rs.getInt(11));
	    	recruitments.add(recruitment);
	    	System.out.println("haha");
			
		}
		
	    
	}catch(Exception e)
	{
		throw new RuntimeException("按职业名称查询", e);
	}
	finally
	{
		//关闭连接
		DataBaseConn.close(conn,ps,null);
	}
	
	return recruitments;
}

public List<Recruitment> getrecruitmentsList(int id,int i){
	
	List<Recruitment> recruitments = new ArrayList<Recruitment>();
	
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	try{
		conn = DataBaseConn.getCon();
		
		String sql="select * from  enterpriserecruitment where idEnterpriseInformation=? and isending=? ";
		
		ps = conn.prepareStatement(sql);
	
		ps.setInt(1, id);
		ps.setInt(2, i);
		rs = ps.executeQuery();
		
		while(rs.next()){
			
			
			Recruitment recruitment = new Recruitment();
			recruitment.setIdEnterpriseRecruitment(rs.getInt(1));
	    	recruitment.setName(rs.getString(2));
	    	recruitment.setRequirement(rs.getString(3));
	    	recruitment.setStartTime(rs.getDate(4));
	    	recruitment.setEndTime(rs.getString(5));
	    	recruitment.setIsending(rs.getInt(6));
	    	recruitment.setPosition(rs.getInt(7));
	    	recruitment.setWorkingPlace(rs.getString(8));
	    	recruitment.setIdEnterpriseInformation(rs.getInt(9));
	    	recruitment.setSalary(rs.getInt(10));
	    	recruitment.setNumber(rs.getInt(11));
	    	recruitments.add(recruitment);
	    	System.out.println("haha");
			
		}
		
	    
	}catch(Exception e)
	{
		throw new RuntimeException("按职业名称查询", e);
	}
	finally
	{
		//关闭连接
		DataBaseConn.close(conn,ps,null);
	}
	
	return recruitments;
}




public Recruitment getrecruitment(int id){
	Recruitment recruitment=new Recruitment();
	Connection conn = null;
	PreparedStatement pst=null;
	ResultSet rs=null;
	String sql="select * from  enterpriserecruitment where idEnterpriseRecruitment=? order by isending";
	try {			
		conn = DataBaseConn.getCon();			
		pst=  conn.prepareStatement(sql);
		pst.setInt(1, id);
		rs=pst.executeQuery();
	   while(rs.next()){
	    	recruitment.setIdEnterpriseRecruitment(rs.getInt(1));
		    recruitment.setName(rs.getString(2));
		    recruitment.setRequirement(rs.getString(3));
		    recruitment.setStartTime(rs.getDate(4));
		    recruitment.setEndTime(rs.getString(5));
		    recruitment.setIsending(rs.getInt(6));
		    recruitment.setPosition(rs.getInt(7));
		    recruitment.setWorkingPlace(rs.getString(8));
		    recruitment.setIdEnterpriseInformation(rs.getInt(9));
		    recruitment.setSalary(rs.getInt(10));
		    recruitment.setNumber(rs.getInt(11));
		    System.out.println(" getrecruitment(int id) haha");    					
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
	 return recruitment;
}

//分页获取模糊搜寻的结果并返回
public List<Recruitment> searchbyname(String name,int pageNo){	
	List<Recruitment> recruitments = new ArrayList<Recruitment>();	
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	int pageSize=12;
	int page=(pageNo-1)*12;	
	try{
		conn = DataBaseConn.getCon();
		//name,requirement,startTime,endTime,isending,position,workingPlace,idEnterpriseInformation,salary,number
		String sql="select * from  enterpriserecruitment where name like  ? limit ?,?";		
		ps = conn.prepareStatement(sql);		
	    ps.setString(1,"%"+name+"%");
	    ps.setInt(2, page);
		ps.setInt(3, pageSize);
	    rs = ps.executeQuery();		   
	    while(rs.next())
		{
	    	Recruitment  recruitment = new Recruitment();
	        recruitment.setIdEnterpriseRecruitment(rs.getInt(1));
	    	recruitment.setName(rs.getString(2));
	    	recruitment.setRequirement(rs.getString(3));
	    	recruitment.setStartTime(rs.getDate(4));
	    	recruitment.setEndTime(rs.getString(5));
	    	recruitment.setPosition(rs.getInt(7));
	    	recruitment.setWorkingPlace(rs.getString(8));
	    	recruitment.setIdEnterpriseInformation(rs.getInt(9));
	    	recruitment.setSalary(rs.getInt(10));
	    	recruitment.setNumber(rs.getInt(11));
	    	recruitments.add(recruitment);
	    	System.out.println("haha");
		}
	    
	}catch(Exception e)
	{
		throw new RuntimeException("按职业名称查询", e);
	}
	finally
	{
		//关闭连接
		DataBaseConn.close(conn,ps,null);
	}
	
	return recruitments;
	
}

public List<Recruitment> searchbykey(String positionkey,String workkey,String moneykey,int pageNo){	
	List<Recruitment> recruitments = new ArrayList<Recruitment>();	
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	int pageSize=12;
	int page=(pageNo-1)*12;	
	try{
		conn = DataBaseConn.getCon();
		//name,requirement,startTime,endTime,isending,position,workingPlace,idEnterpriseInformation,salary,number
		String sql="select * from  enterpriserecruitment where  1=1";	
		if(positionkey!=null&&positionkey!=""){
			sql+=" and workingplace='"+positionkey+"'";
		}
		if(workkey!=null&&workkey!=""){
			sql+=" and position="+workkey;
		}
		if(moneykey!=null&&moneykey!=""){
			if(moneykey.contains("-")){
				System.out.println("aa");
				String []array=moneykey.split("-");
				System.out.println(array[0]);
				System.out.println(array[0]);
				sql+=" and salary between  "+array[0]+" and "+array[1];
			}
			if(moneykey.contains("上")){
				System.out.println("aa");
				//String []array=moneykey.split("-");
				sql+=" and salary > 20000 ";
				System.out.println(moneykey);
			}
			if(moneykey.contains("下")){
				System.out.println("aa");
				sql+=" and salary< 1000 ";
				System.out.println(moneykey);
			}			
		}
		sql+=" limit ?,?";
		ps = conn.prepareStatement(sql);			       
	    ps.setInt(1, page);
		ps.setInt(2, pageSize);
	    rs = ps.executeQuery();		   
	    while(rs.next())
		{
	    	Recruitment  recruitment = new Recruitment();
	        recruitment.setIdEnterpriseRecruitment(rs.getInt(1));
	    	recruitment.setName(rs.getString(2));
	    	recruitment.setRequirement(rs.getString(3));
	    	//recruitment.setStartTime(rs.getDate(4));
	    	//recruitment.setEndTime(rs.getString(5));
	    	recruitment.setPosition(rs.getInt(7));
	    	recruitment.setWorkingPlace(rs.getString(8));
	    	recruitment.setIdEnterpriseInformation(rs.getInt(9));
	    	recruitment.setSalary(rs.getInt(10));
	    	recruitment.setNumber(rs.getInt(11));
	    	recruitments.add(recruitment);
	    	System.out.println("haha");
		}
	    
	}catch(Exception e)
	{
		e.printStackTrace();
		throw new RuntimeException("按职业名称查询", e);
	}
	finally
	{
		//关闭连接
		DataBaseConn.close(conn,ps,null);
	}
	
	return recruitments;
	
}

//分页前获取总条数
		public int getPage(String name) throws Exception {
			// TODO Auto-generated method stub
			int recordCount=0,t1=0,t2=0;
			PreparedStatement pstmt=null;
			ResultSet result=null;
			Connection conn = null;
			conn=DataBaseConn.getCon();
			String sql="select count(*) from  enterpriserecruitment where name like  ? ";
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, "%"+name+"%");
				result=pstmt.executeQuery();
				result.next();
				recordCount=result.getInt(1);
				t1=recordCount%12;
				t2=recordCount/12;
			} catch (Exception e) {
			// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				if (pstmt != null)
					try {
						pstmt.close();
					}catch (SQLException e) {
				}
				if (conn != null)
					try {
						conn.close();
					} catch (SQLException e) {}
			}
			if(t1 != 0){
				t2=t2+1;
			}
				return t2;
		}
}

