package common;

import java.sql.ResultSet;
import java.sql.Statement;

/**
 *���ݿ������
 */
public class DataBaseOperation
{
	private DataBaseConn con = new DataBaseConn();
	private Statement stmt;
	private ResultSet rs;

	/**
	 * ��ü�¼���� output parameter: nem = -2; Exception nem = -1 ; Error num = 0
	 * ;Nothing num > 0;Right
	 */
	public int getRowCount(String strSql)
	{
		int intCount = 0;
		try
		{
			stmt = con.getStmtread();
			rs = stmt.executeQuery("SELECT COUNT(*) FROM " + strSql);
			if (rs.next())
			{
				intCount = rs.getInt(1);
			}
			else
			{
				intCount = -1;
			}
		}
		catch (Exception e)
		{
			intCount = -2;
			System.err.println(e.getMessage());
			e.printStackTrace();
		}
		finally
		{
			this.con.close();
			// return intCount;
		}
		return intCount;
	}

	/**
	 * ���ݿ������� �������: insert SQL �������: num = -2 >Exception num = 0 >nothing num >
	 * 1 right
	 */
	public int insert(String sql)
	{
		int count = 0;
		stmt = con.getStmt();
		try
		{
			count = stmt.executeUpdate(sql);
		}
		catch (Exception e)
		{
			count = -2;
			System.err.println(e.getMessage());
			e.printStackTrace();
		}
		finally
		{
			con.close();

		}
		return count;
	}

	/**
	 * *���ݿ���²��� �������: update SQL �������: num = -2 >Exception num = 0 >nothing num
	 * > 1 right
	 */
	public int update(String sql)
	{
		int count = 0;
		stmt = con.getStmt();
		try
		{
			count = stmt.executeUpdate(sql);
		}
		catch (Exception e)
		{
			count = -2;
			System.err.println(e.getMessage());
			e.printStackTrace();
		}
		finally
		{
			con.close();

		}
		return count;
	}

	/**
	 * ɾ������ �������: delete SQL �������: count = -2>Exception num = 0 >nothing count >
	 * 1 >right
	 */
	public int delete(String sql)
	{
		int count = 0;
		stmt = con.getStmt();
		try
		{
			count = stmt.executeUpdate(sql);
		}
		catch (Exception e)
		{
			count = -2;
			System.err.println(e.getMessage());
			e.printStackTrace();
		}
		finally
		{
			con.close();

		}
		return count;
	}
}