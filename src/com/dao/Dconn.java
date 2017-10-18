package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Dconn {
	private Connection con=null;
	private static final String Driver="com.mysql.jdbc.Driver";
	private static final String URL="jdbc:mysql://localhost:3306/Shopping_Cart";
	private static final String ROOT="root";
	private static final String PASSWORD="Stranger2012";
	
	public Dconn() throws Exception{
		try {
			Class.forName(Driver);

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			System.out.println("驱动程序加载错误");
		}
		try {
			con=DriverManager.getConnection(URL,ROOT,PASSWORD);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String str = (new SimpleDateFormat("yyyy-MM-dd HH:mm:ss:SSS")).format(new Date()); 
		System.out.println("数据库连接开启，用户名："+ROOT+"，时间："+str);
	}
	public Connection getConnection(){
		return this.con;
	}
	public void close() throws Exception{
		if(this.con!=null){
			try {
				this.con.close();
			} catch (Exception e) {
				throw e;
			}
		}
		String str = (new SimpleDateFormat("yyyy-MM-dd HH:mm:ss:SSS")).format(new Date()); 
		System.out.println("数据库连接关闭，时间："+str);
	}
}
