package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;



import common.DataBaseConn;
import entity.Resume;



/**
 * 
 * @author Administrator
 * ���˼����Ľ����Ͳ鿴
 */
public class ResumeDAO {
	//�û�����һ���µļ���
	public boolean addResume(Resume resume){
		Connection conn = null;
		PreparedStatement pst=null;
		String sql="insert into resume(name,hobby,HandsOnBackground,awardSituation,position,workingplace,idPersonalInformation,createTime) values(?,?,?,?,?,?,?,?)";
		try {			
			conn = DataBaseConn.getCon();			
			pst=  conn.prepareStatement(sql);
			pst.setString(1, resume.getName());
			pst.setString(2,resume.getHobby());
			pst.setString(3,resume.getHandsOnBackground());
			pst.setString(4, resume.getAwardSituation());
			pst.setString(5, resume.getPosition());
			pst.setString(6, resume.getWorkingPlace());
			pst.setInt(7, resume.getIdPersonalInformation());
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//�������ڸ�ʽ
			String time=df.format(new Date());// new Date()Ϊ��ȡ��ǰϵͳʱ��
			pst.setString(8,time);
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

				} catch (SQLException e) {
					
				}
		
			
		}
		return true;
	}

	//��������û�ID ��ȡ�û��������ļ���
	public List<Resume> searchAllResume(int idPersonalInformation){
		 List<Resume> resumelist=null;		
			Connection conn = null;
			Statement stmt = null;
			ResultSet rs = null;
			PreparedStatement pStmt=null;
			try {			
				conn = DataBaseConn.getCon();
				stmt = conn.createStatement();			
				pStmt = conn.prepareStatement("select * from resume where idPersonalInformation=?");	
				pStmt.setInt(1, idPersonalInformation);					
				rs = pStmt.executeQuery();	
				resumelist=new ArrayList<Resume>();
				while(rs.next())
				{
					Resume mess =new Resume();
					mess.setIDResume(rs.getInt(1));
					mess.setName(rs.getString(2));
					mess.setHobby(rs.getString(3));
					mess.setHandsOnBackground(rs.getString(4));
					mess.setAwardSituation(rs.getString(5));
					mess.setPosition(rs.getString(6));				
					mess.setWorkingPlace(rs.getString(7));
					mess.setIdPersonalInformation(rs.getInt(8));
					mess.setCreateTime(rs.getTimestamp(9));
					mess.setUpdateTime(rs.getTimestamp(10));					
					resumelist.add(mess);
				}
			}
			catch(Exception e){
				System.out.println(e.getMessage());
			} finally {
				if (stmt != null){
					try {
						stmt.close();
					 } catch (SQLException e) {
					  }
				}
				if (conn != null){
					try {
						conn.close();
					} catch (SQLException e) {						
						}
				}					
			}
		return resumelist;//���ؽ����		
	}
	
	//�鿴ĳ������ļ������������˻�����Ϣ,���ݾ������ID��
	public Resume OnesearchByID(int idResume){
		Resume list=new Resume();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		PreparedStatement pStmt=null;
		try {			
			conn = DataBaseConn.getCon();
			stmt = conn.createStatement();			
			pStmt = conn.prepareStatement("select * from resume where idResume=?");	
			pStmt.setInt(1, idResume);					
			rs = pStmt.executeQuery();
			System.out.println("rs OK");
			while(rs.next()){
				list.setIDResume(rs.getInt(1));			
				list.setName(rs.getString(2));
				list.setHobby(rs.getString(3));
				list.setHandsOnBackground(rs.getString(4));
				list.setAwardSituation(rs.getString(5));
				list.setPosition(rs.getString(6));
				list.setWorkingPlace(rs.getString(7));
				list.setIdPersonalInformation(rs.getInt(8));
				list.setCreateTime(rs.getTimestamp(9));
				System.out.println("sucee");
			}
		}
		catch(Exception e){
			System.out.println(e.getMessage());
		} finally {
			if (stmt != null){
				try {
					stmt.close();
				 } catch (SQLException e) {
				  }
			}
			if (conn != null){
				try {
					conn.close();
				} catch (SQLException e) {						
					}
			}					
		}
		return list;
		
			}
	//�޸��Ѵ����ɹ��ļ���
	public boolean updateOneResume(Resume resume){
		System .out.println("update start");
		Connection conn = null;
		PreparedStatement pst=null;
		String sql="update resume set name=?, hobby=?,HandsOnBackground=?,awardSituation=?,position=?,workingplace=?,updateTime=?  where idResume=? ";
		try {			
			conn = DataBaseConn.getCon();			
			pst=  conn.prepareStatement(sql);
			pst.setString(1, resume.getName());
			pst.setString(2,resume.getHobby());
			pst.setString(3,resume.getHandsOnBackground());
			pst.setString(4, resume.getAwardSituation());
			pst.setString(5, resume.getPosition());
			pst.setString(6, resume.getWorkingPlace());
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//�������ڸ�ʽ
			String time=df.format(new Date());// new Date()Ϊ��ȡ��ǰϵͳʱ��
			pst.setString(7,time);
			pst.setInt(8,resume.getIDResume());
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
				} catch (SQLException e) {				
				}
		}
		return true;		
	}
	
	//ɾ���Ѵ����ļ���	(�����û���ID)
	public boolean delOneResume(int idResume){
		Connection conn = null;
		PreparedStatement pst=null;
		String sql="delete from resume where idResume=?";
		try {			
			conn = DataBaseConn.getCon();			
			pst=  conn.prepareStatement(sql);
			pst.setInt(1, idResume);		
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
				} catch (SQLException e) {		
				}			
		}
		return true;
	}
 
	//�鿴���˼�������
	public int sumOfResume(int idPersonalInformation){
		int count=0;
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement pStmt=null;
		try {			
			conn = DataBaseConn.getCon();						
			pStmt = conn.prepareStatement("select count(*) from resume where idPersonalInformation=?");	
			pStmt.setInt(1, idPersonalInformation);					
			rs = pStmt.executeQuery();	
		    count=rs.getInt(1);
		    System.out.println(count);
		   
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			if (pStmt != null)
				try {
					pStmt.close();
				}catch (SQLException e) {
			}

			if (conn != null)
				try {
					conn.close();
				} catch (SQLException e) {		
				}			
		}
		 return count;
	}
	
	public static void main(String args[]){
		try{
		Resume resume=new Resume();
		resume.setIDResume(2);
		resume.setName("ôô��");
		resume.setHobby("ôô��");
		resume.setHandsOnBackground("ôô��");
		resume.setAwardSituation("ôô��");
		resume.setPosition("ôô��");
		resume.setWorkingPlace("ôô��");				
		ResumeDAO dao=new ResumeDAO();
		boolean end=dao.updateOneResume(resume);
		System.out.println("update"+end);		
		}catch(Exception e)	{
			e.printStackTrace();
		}
		
	}
}
	
	
	//�鿴��Ͷ�ݼ���
	/*public List<Resume> searchResumetojob(int idPersonalInformation){
		 List<Resume> resumelist=null;		
			Connection conn = null;
			Statement stmt = null;
			ResultSet rs = null;
			PreparedStatement pStmt=null;
			try {			
				conn = DataBaseConn.getCon();
				stmt = conn.createStatement();			
				pStmt = conn.prepareStatement("select * from resume where idPersonalInformation=?");	
				pStmt.setInt(1, idPersonalInformation);					
				rs = pStmt.executeQuery();	
				resumelist=new ArrayList<Resume>();
				while(rs.next())
				{
					Resume mess =new Resume();
					mess.setIDResume(rs.getInt(1));
					mess.setName(rs.getString(2));
					mess.setHobby(rs.getString(3));
					mess.setHandsOnBackground(rs.getString(4));
					mess.setAwardSituation(rs.getString(5));
					mess.setPosition(rs.getString(6));				
					mess.setWorkingPlace(rs.getString(7));
					resumelist.add(mess);
				}
			}
			catch(Exception e){
				System.out.println(e.getMessage());
			} finally {
				if (stmt != null){
					try {
						stmt.close();
					 } catch (SQLException e) {
					  }
				}
				if (conn != null){
					try {
						conn.close();
					} catch (SQLException e) {						
						}
				}					
			}
		return resumelist;//���ؽ����		
		
	}
*/


