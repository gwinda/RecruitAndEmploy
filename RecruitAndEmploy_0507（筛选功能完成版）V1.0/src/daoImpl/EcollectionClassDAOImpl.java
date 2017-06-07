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

import dao.EcollectionClassDAO;
import domain.Ecollection;
import domain.EcollectionClass;

public  class EcollectionClassDAOImpl implements EcollectionClassDAO{
	
	private Connection conn = null;
	private PreparedStatement ps = null;
	
	@Override
	public void create(EcollectionClass ecollectionClass) {
		// TODO Auto-generated method stub
		try
		{
			conn = DataBaseConn.getCon();
			
			String sql = "insert into EcollectionClass(id,name) values(?,?) ";
			System.out.println("add enter");
			ps = conn.prepareStatement(sql);
			//ps.setInt(1, application.getIdApplication());
			ps.setInt(1,ecollectionClass.getId());
			ps.setString(2, ecollectionClass.getName());
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
	@Override
	public void update(EcollectionClass ecollectionClass) {
		// TODO Auto-generated method stub
		try
		{
			System.out.println("�������");
			
			String sql = "update  EcollectionClass set name=?  where id = ? ";
			System.out.println("�����ȷ");
			conn = DataBaseConn.getCon();
			
			ps = conn.prepareStatement(sql);
			ps.setInt(2,ecollectionClass.getId());

			ps.setString(1, ecollectionClass.getName());
			System.out.println("������ȷ");
			ps.executeUpdate();
			System.out.println("���³ɹ�");
			
		}
		catch (Exception e)
		{
			throw new RuntimeException("�������ų���......", e);
		}
		finally
		{
			//�ر�����
			DataBaseConn.close(conn,ps,null);
		}
		
	}
	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		String sql="delete from EcollectionClass where id=?";
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
	public List<EcollectionClass> queryList() {
		// TODO Auto-generated method stub
		List<EcollectionClass> list = new ArrayList<EcollectionClass>();
		ResultSet rs = null;
		try
		{
			conn = DataBaseConn.getCon();
			
			String sql = "select * from EcollectionClass";
			
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next())
			{
				EcollectionClass ecollectionClass = new EcollectionClass();
				ecollectionClass.setId(rs.getInt(1));
				ecollectionClass.setEiid(rs.getInt(2));
				ecollectionClass.setName(rs.getString(3));

				list.add(ecollectionClass);
			}
		}
		catch (Exception e)
		{
			throw new RuntimeException("��ѯ�����б�", e);
		}
		finally
		{
			//�ر�����
			DataBaseConn.close(conn,ps,null);
		}
		
		return list;
	}

	
	

}
