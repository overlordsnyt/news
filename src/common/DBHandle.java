package common;

import java.sql.*;

public class DBHandle {
	//声明私有静态常量：驱动、数据库连接位置、登录名、密码
	private static final String 
	DRIVERNAME="com.mysql.jdbc.Driver",
	URL="jdbc:mysql://localhost:3306/mytest_db",
	LOGIN="root",
	PASSWORD="1234";
	//声明私有静态属性：数据库连接、sql语句执行对象、查询结果集
	private static Connection conn;
	private static Statement st;
	private static ResultSet rs;
	
	/**
	 * 获取到数据库的连接conn
	 */
	private static void getConnection(){
		try {
			Class.forName(DRIVERNAME);
			conn=DriverManager.getConnection(URL, LOGIN, PASSWORD);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 获取执行sql语句的对象st
	 */
	private static void createStatement(){
		/*if(conn==null)*/getConnection();
			try {
				/*if(st==null)*/st=conn.createStatement();
			} catch (SQLException e) {
				e.printStackTrace();
			}
	}
	/**
	 * 得到sql语句查询结果的行数
	 * @param sql	要查询的sql语句
	 * @return		查询结果的行数
	 */
	public static int executeInt(String sql){
		int resultLines=-1;
		createStatement();
		try {
			//创建rs结果集并获取随后一行的行数
			rs=st.executeQuery(sql);
			rs.last();
			resultLines=rs.getRow();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		close();
		return resultLines;
	}
	
	/**
	 * 执行查询的sql语句并返回查询结果
	 * @param sql	查询语句
	 * @return		字符串形式的结果
	 */
	public static String executeQuery(String sql){
		//创建执行sql语句的对象
		createStatement();
		try {
			//获取查询的rs结果
			rs=st.executeQuery(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		//判断没有结果时函数返回空值
		if(rs==null)return null;
		/*String[] str = null;
		try {
			//获取查询结果的行数
			rs.last();
			int rowNumber=rs.getRow();
			//根据行数创建相应字符串数组
			str=new String[rowNumber];
			//提取rs里的查询结果到str字符串数组
			rs.beforeFirst();
			int i=0;
			while(rs.next()){
				str[i++]=rs.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}*/
		String str=null;
		try {
			if(rs.next())str=rs.getString(1);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		close();		//关闭数据库查询结果、执行对象以及连接
		return str;
	}
	/**
	 * 以二维数组的形式返还查询表的结果
	 * @param sql	查询语句
	 * @param line	要查询的行数
	 * @param col	要查询的列数
	 * @return	字符串类型的二维数组
	 */
	public static String[][] executeResult(String sql,int line,int col){
		if(line<1)return null;
		createStatement();
		try {
			rs=st.executeQuery(sql);
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		String[][] res=new String[line][col];
		for(int i=0;i<line;i++){
			try {
				rs.next();
				for(int j=0;j<col;j++){
					res[i][j]=
							rs.getString(j+1);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		close();
		return res;
	}
	/**
	 * 执行更新数据库数据的sql语句并返回成功条目数
	 * @param sql	增删改数据的语句
	 * @return		成功的条目数
	 */
	public static int executeUpdate(String sql){
		int upLines =0 ;
		createStatement();
		try {
			upLines=st.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		close();
		return upLines;
	}
	/**
	 * 关闭数据库查询结果、执行对象以及连接
	 */
	private static void close(){
		try{
			//判断是否关闭，若未关闭则关闭
			if(/*不为空*/rs!=null&&!rs.isClosed())rs.close();
			if(!st.isClosed())st.close();
			if(!conn.isClosed())conn.close();
		} catch (Exception e){
			e.printStackTrace();
		}
	}
}
