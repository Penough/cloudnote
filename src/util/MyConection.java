package util;

import java.sql.DriverManager;
import com.mysql.jdbc.Connection;

public class MyConection {
	private static String manager="root";
	private static String dbhost="jdbc:mysql://localhost:3306/cloudnote";
	private static String password="first.king.21";
	private static Connection conn=null;

	public static Connection ConnectDB() {
	    conn=null;
		try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = (Connection) DriverManager.getConnection(dbhost,manager,password);           
            
      } catch (Exception e) { 
            e.printStackTrace();
      }
		System.out.println("已获得数据库的连接");
		return conn;
	}
	
}
	

