package dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import util.MyConection;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

import model.Comm;


public class ComDao {
	public Comm[] getComm(String s) throws SQLException{
		Connection conn=MyConection.ConnectDB();
		String goten="select * from noteCommen where NoteID='"+s+"'order by puTime DESC";
		Statement stmt=(Statement) conn.createStatement();
		System.out.println(goten);
		ResultSet rs=stmt.executeQuery(goten);
		rs.last(); 
		//System.out.println(rs.getRow());
		Comm[] icom=new Comm[rs.getRow()];
		int i=0;
		rs.absolute(0);
		//System.out.println(rs.getRow());
		while(rs.next()) {
			String NoteID=rs.getString("NoteID");
			String CostomID=rs.getString("CostomID");
			String Content=rs.getString("comcon");
			String ComID=rs.getString("CommonID");
			String CreateTime=rs.getString("puTime");
			icom[i]=new Comm(ComID, CostomID, Content, NoteID, CreateTime);
			i++;
		}
		conn.close();
		rs.close();
		return icom;
	}
}
