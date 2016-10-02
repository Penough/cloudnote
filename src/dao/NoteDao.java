package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

import util.MyConection;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;

import model.Note;

public class NoteDao {
	public static Note getNote(String s) throws SQLException{
		Connection conn=MyConection.ConnectDB();
		String goten="select * from note where NoteID='"+s+"'";
		Statement stmt=(Statement) conn.createStatement();
		Note inote=null;
		System.out.println(goten);
		ResultSet rs=stmt.executeQuery(goten);
		if (rs.next()) {
			String NoteID=rs.getString("NoteID");
			String CostomID=rs.getString("CostomID");
			String Content=rs.getString("Content");
			String CreatedTime=rs.getString("CreatedTime");
			String ChangeTime=rs.getString("ChangeTime");
			int Status=rs.getInt("Status");
			String Tag=rs.getString("Tag");
			String Title=rs.getString("Title");
			inote=new Note(NoteID, CostomID, Content, CreatedTime, ChangeTime, Status, Tag, Title);
		}
		return inote;
	}
	
	public void noteUpload(String noteid,String costomid,String comcon) throws SQLException {
		Connection conn=MyConection.ConnectDB();
		String insert="insert into noteCommen values (?,?,?,?,?)";
		PreparedStatement ps =(PreparedStatement) conn.prepareStatement(insert); 
		long t = System.currentTimeMillis();
		long t2 = System.currentTimeMillis();
		Random rnd = new Random(t);
		String tempid=Integer.toString(rnd.nextInt()) ;
		String comid=Long.toString(t2)+tempid;
		System.out.println("noteDao:"+comid);
		Date date = new Date();//获得系统时间.
		String ts = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(date);
		ps.setString(1, comid);
		ps.setString(2, costomid);
		ps.setString(3, comcon);
		ps.setString(4, noteid);
		ps.setString(5, ts);
		ps.executeUpdate();
		System.out.println("noteDao:执行成功");
		conn.close();
		ps.close();
	}
	
	public static Note[] usersNote(String hid) throws SQLException{
		Connection conn=MyConection.ConnectDB();
		String goten="select * from note where CostomID='"+hid+"'";
		Statement stmt=(Statement) conn.createStatement();
		ResultSet rs=stmt.executeQuery(goten);
		rs.last(); 
		Note[] notelist=new Note[rs.getRow()];
		int i=0;
		rs.absolute(0);
		while(rs.next()) {
			String NoteID=rs.getString("NoteID");
			String CostomID=rs.getString("CostomID");
			String Content=rs.getString("Content");
			String CreatedTime=rs.getString("CreatedTime");
			String ChangeTime=rs.getString("ChangeTime");
			int Status=rs.getInt("Status");
			String Tag=rs.getString("Tag");
			String Title=rs.getString("Title");
			notelist[i]=new Note(NoteID, CostomID, Content, CreatedTime, ChangeTime, Status, Tag, Title);
			i++;
			//System.out.println(i);
		}
		rs.close();
		conn.close();
		return notelist;
	}
	public static Note[] coleNotes(String hid) throws SQLException{
		Connection conn=MyConection.ConnectDB();
		String goten="select * from note where NoteID=ANY(select NoteID from collection where CostomID='"+hid+"')";
		//System.out.println("asdfasdfasdfasdfdfasdfasdfsadf    "+goten);
		Statement stmt=(Statement) conn.createStatement();
		ResultSet rs=stmt.executeQuery(goten);
		rs.last(); 
		Note[] notelist=new Note[rs.getRow()];
		int i=0;
		rs.absolute(0);
		while(rs.next()) {
			String NoteID=rs.getString("NoteID");
			String CostomID=rs.getString("CostomID");
			String Content=rs.getString("Content");
			String CreatedTime=rs.getString("CreatedTime");
			String ChangeTime=rs.getString("ChangeTime");
			int Status=rs.getInt("Status");
			String Tag=rs.getString("Tag");
			String Title=rs.getString("Title");
			notelist[i]=new Note(NoteID, CostomID, Content, CreatedTime, ChangeTime, Status, Tag, Title);
			i++;
			//System.out.println(i);
		}
		rs.close();
		conn.close();
		return notelist;
	}
	public void deleteNote(String noteid) throws SQLException{
		Connection conn=MyConection.ConnectDB();
		String del="delete from note where NoteID = '"+noteid+"'";
		Statement stmt=(Statement) conn.createStatement();
		stmt.executeUpdate(del);
		conn.close();
	}
	public static String notesUser(String noteid)throws SQLException{
		Connection conn=MyConection.ConnectDB();
		String get="select * from note where NoteID = '"+noteid+"'";
		String noteUser=null;
		Statement stmt=(Statement) conn.createStatement();
		ResultSet rs=stmt.executeQuery(get);
		if(rs.next()){
			noteUser=rs.getString("CostomID");
		}
		return noteUser;
	}
	public void collect(String noteid,String userid) throws SQLException{
		Connection conn=MyConection.ConnectDB();
		String insert="insert into collection values (?,?)";
		PreparedStatement ps =(PreparedStatement) conn.prepareStatement(insert); 
		ps.setString(1, userid);
		ps.setString(2, noteid);
		ps.executeUpdate();
		System.out.println("noteDao:执行成功");
		conn.close();
		ps.close();
	}
	public void decollect(String noteid,String userid) throws SQLException{
		Connection conn=MyConection.ConnectDB();
		String insert="delete from collection where CostomID =? and NoteID=?";
		PreparedStatement ps =(PreparedStatement) conn.prepareStatement(insert); 
		
		ps.setString(1, userid);
		ps.setString(2, noteid);
		System.out.println(ps);
		ps.executeUpdate();
		System.out.println("deco:执行成功");
		conn.close();
		ps.close();
	}
	public Note[] notesearch(String title) throws SQLException{
		Connection conn=MyConection.ConnectDB();
		String goten="select * from note where Title like '%"+title+"%'";
		System.out.println("asdfasdfasdfasdfdfasdfasdfsadf    "+goten);
		Statement stmt=(Statement) conn.createStatement();
		ResultSet rs=stmt.executeQuery(goten);
		rs.last(); 
		Note[] notelist=new Note[rs.getRow()];
		int i=0;
		rs.absolute(0);
		while(rs.next()) {
			String NoteID=rs.getString("NoteID");
			String CostomID=rs.getString("CostomID");
			String Content=rs.getString("Content");
			String CreatedTime=rs.getString("CreatedTime");
			String ChangeTime=rs.getString("ChangeTime");
			int Status=rs.getInt("Status");
			String Tag=rs.getString("Tag");
			String Title=rs.getString("Title");
			notelist[i]=new Note(NoteID, CostomID, Content, CreatedTime, ChangeTime, Status, Tag, Title);
			i++;
			//System.out.println(i);
		}
		rs.close();
		conn.close();
		return notelist;
	}
}
