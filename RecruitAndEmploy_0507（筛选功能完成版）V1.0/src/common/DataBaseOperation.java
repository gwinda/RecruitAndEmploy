package common;

import java.sql.ResultSet;
import java.sql.Statement;

/**
 *数据库操作类
 */
public class DataBaseOperation
{
	private DataBaseConn con = new DataBaseConn();
	private Statement stmt;
	private ResultSet rs;

	/**
	 * 获得记录条数 output parameter: nem = -2; Exception nem = -1 ; Error num = 0
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
	 * 数据库插入操作 输入参数: insert SQL 输出参数: num = -2 >Exception num = 0 >nothing num >
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
	 * *数据库更新操作 输入参数: update SQL 输出参数: num = -2 >Exception num = 0 >nothing num
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
	 * 删除操作 输入参数: delete SQL 输出参数: count = -2>Exception num = 0 >nothing count >
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