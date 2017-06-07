package daoImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.DataBaseConn;
import entity.Collection;
import entity.Recruitment;

public class CollectionDAO {
	public boolean addCollection(Collection collection){
		Connection conn = null;
		PreparedStatement pst=null;
		String sql="insert into Collection(idPersonalInformation,idEnterpriseRecruitment)  values(?,?);";
		try {			
			conn = DataBaseConn.getCon();			
			pst= conn.prepareStatement(sql);	
			pst.setInt(1,collection.getIdPersonalInformation());
			pst.setInt(2,collection.getIdEnterpriseRecruitment());			
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
	public boolean CollectionExist(Collection collection){
		ResultSet result;
		int i=0;
		Connection conn = null;
		PreparedStatement pst=null;
		String sql="select count(*) from Collection where idPersonalInformation=? and idEnterpriseRecruitment=?  ;";
		try {			
			conn = DataBaseConn.getCon();			
			pst= conn.prepareStatement(sql);	
			pst.setInt(1,collection.getIdPersonalInformation());
			pst.setInt(2,collection.getIdEnterpriseRecruitment());			
			result=pst.executeQuery();
			while(result.next()){
				i=result.getInt(1);
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
		if(i>=1){
			return true;
			}
		else{
			return false;
		}
	}		

	
	public List<Collection> LookCollectionByIdPerson(int IdPerson){
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;		
		try{
			List<Collection>  collectionlist2 = new ArrayList<Collection>();
			conn = DataBaseConn.getCon();
			String sql="select  Collection.idPersonalInformation,enterpriserecruitment.IdEnterpriseRecruitment,enterpriserecruitment.Name,enterpriserecruitment.IdEnterpriseInformation,Collection.collectiontime,enterpriseinformation.name,enterpriserecruitment.endTime,collection.id from Collection,Personalinformation,enterpriserecruitment,enterpriseinformation where"+ 
						"  Personalinformation.idPersonalInformation=Collection.idPersonalInformation "+" and enterpriseinformation.idEnterpriseInformation="+
							"   enterpriserecruitment.idEnterpriseInformation  and  enterpriserecruitment.IdEnterpriseRecruitment = Collection.IdEnterpriseRecruitment"+
				            " and Collection.idPersonalInformation= ? " ;
			ps = conn.prepareStatement(sql);		
		    ps.setInt(1,IdPerson);		    
		    rs = ps.executeQuery();	   
		    while(rs.next())
			{
		    	Collection collection =new  Collection();
		    	
		    	collection.setIdPersonalInformation(rs.getInt(1));
		    	collection.setIdEnterpriseRecruitment(rs.getInt(2));
		    	collection.setName(rs.getString(3));
		    	collection.setIdEnterpriseInformation(rs.getInt(4));
		    	collection.setCreateTime(rs.getDate(5));
		    	collection.setCompany(rs.getString(6));
		    	collection.setEndtime(rs.getDate(7));
		    	collection.setId(rs.getInt(8));
		    	collectionlist2.add(collection);
		    	
			
			}
		    return collectionlist2; 
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
		
	}
	//批量删除收藏
	
	public boolean deleteMuchOF(int []id){
		  Connection conn = null;
		  PreparedStatement pst = null; 
		  
		  String sql = "delete from  collection where Id=?";  		 
		  try { 
			  conn = DataBaseConn.getCon();
			  pst = conn.prepareStatement(sql); 
			  for (int i = 0; i < id.length; i++) { 
			    pst.setInt(1, id[i]); 
			    // 使用批处理 
			    pst.addBatch(); 
			   } 
		   // 执行批处理 
		   int[] result = pst.executeBatch(); 
		   if (result[0] > 0) { 
		    return  true; 
		   } 
		  } catch (Exception e) { 
		   e.printStackTrace(); 
		  } finally { 
			  DataBaseConn.close(conn,pst,null);
		  } 
		  return false; 
	
	}

	
	public boolean delOneBy(int infk,int idREC){
		Connection conn = null;
		  PreparedStatement pst = null; 
		  
		  String sql = "delete from  collection where idPersonalInformation=? and idEnterpriseRecruitment=?";  		 
		  try { 
			  conn = DataBaseConn.getCon();
			  pst = conn.prepareStatement(sql); 		   
			    pst.setInt(1,infk);
			    pst.setInt(2,idREC);
				int result = pst.executeUpdate(); 
			    if (result>=1) { 
			    return  true; 
			    } 
		  } catch (Exception e) { 
			   e.printStackTrace(); 
		 } finally { 
			 DataBaseConn.close(conn,pst,null);
		} 
	 return false; 	
	}
}
