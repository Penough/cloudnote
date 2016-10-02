package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.mysql.jdbc.Blob;

import org.springframework.stereotype.Component;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;

import java.io.InputStream;

import model.User;
import util.MyConection;

@Component
public class UserDao {
	public UserDao(){
		
	}
	
	public User login(String username, String passwd) throws SQLException{
		Connection conn=MyConection.ConnectDB();
		String sql = "SELECT * FROM COSTOM WHERE CostomID='"+username+"'AND Password='"+passwd+"'";
		//System.out.println(sql);
		Statement stmt=(Statement) conn.createStatement();
		ResultSet rs=stmt.executeQuery(sql);
		try {
			User user = new User();
			if (rs.next()) {
				String temp=rs.getString("CostomID");
				user.setId(temp);
				temp=rs.getString("Name");
				user.setName(temp);
				temp=rs.getString("PhoneNum");
				user.setPhonenum(temp);
				Blob btemp=null;
				InputStream input=null;
				if(rs.getBlob("Sculpture")!=null){
					btemp=(Blob) rs.getBlob("Sculpture");
					input=btemp.getBinaryStream();
				}		
				//System.out.println(user.getId()+"/////");
				user.setScul(input);
				temp=rs.getString("Text");
				user.setText(temp);
				temp=rs.getString("Role");
				user.setRole(temp);
			}
			rs.close();
			return user;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		} finally {
			if (conn != null) {
				conn.close();
			}
		}
		
	}
	public static User login(String username) throws SQLException{
		Connection conn=MyConection.ConnectDB();
		String sql = "SELECT * FROM COSTOM WHERE CostomID='"+username+"'";
		Statement stmt=(Statement) conn.createStatement();
		ResultSet rs=stmt.executeQuery(sql);
		if(rs==null){
			return null;
		}
		try {
			User user = new User();
			if (rs.next()) {
				String temp=rs.getString("CostomID");
				user.setId(temp);
				temp=rs.getString("Name");
				user.setName(temp);
				temp=rs.getString("PhoneNum");
				user.setPhonenum(temp);
				Blob btemp=null;
				InputStream input=null;
				if(rs.getBlob("Sculpture")!=null){
					btemp=(Blob) rs.getBlob("Sculpture");
					input=btemp.getBinaryStream();
				}		
				System.out.println(user.getId()+"/////");
				user.setScul(input);
				temp=rs.getString("Text");
				user.setText(temp);
				temp=rs.getString("Role");
				user.setRole(temp);
			}
			rs.close();
			return user;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		} finally {
			if (conn != null) {
				conn.close();
			}
		}
		
	}

	public boolean registUser(String userid, String password,String username,String phonenum,InputStream statue,String text) 
			throws SQLException{
		Boolean flag=false;
		Connection conn=MyConection.ConnectDB();
		String sql = "SELECT * FROM COSTOM WHERE CostomID='"+userid+"'";
		System.out.println(sql);
		Statement stmt=(Statement) conn.createStatement();
		ResultSet rs=stmt.executeQuery(sql);
		int count=0;
		try {
			while(rs.next()){
			   count++;
			}
				if(count==0){
					System.out.println(count);
					//return flag;
				}else{
					return flag;
				}
		} catch (SQLException e) {
			// TODO: handle exception
			System.out.println("sqlerror!");
		}
		System.out.println("执行成功！");
		//fis=new FileInputStream(statue);
		System.out.println(statue); 
		String insert="insert into costom values (?,?,?,?,?,?,?)";
		PreparedStatement ps =(PreparedStatement) conn.prepareStatement(insert); 
		ps.setString(1, userid);
		ps.setString(2, password);
		ps.setString(3, username);
		ps.setString(4, phonenum);
		ps.setBinaryStream(5, statue);
		ps.setString(6, text);
		ps.setString(7,"C");
		ps.executeUpdate();
		ps.close();
		conn.close();
		flag=true;
		return flag;
	}

	public void noteUpload(String costomid,String content,String tag,int flag,String title) throws SQLException{
		Connection conn=MyConection.ConnectDB();
		Date date = new Date();//获得系统时间.
		String ts = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(date);//将时间格式转换成符合Timestamp要求的格式.
		String insert="insert into note values (?,?,?,'"+ts+"','"+ts+"',?,?,?)";
		PreparedStatement ps =(PreparedStatement) conn.prepareStatement(insert); 
		long lst=System.currentTimeMillis();
		String st=Long.toString(lst);
		ps.setString(1, st);
		ps.setString(2, costomid);
		ps.setString(3,content);
		ps.setInt(4, flag);
		ps.setString(5, tag);
		ps.setString(6, title);
		ps.executeUpdate();
		System.out.println(ps);
		ps.close();
		
	}
	
	public void noteUpdate(String content,String tag,int flag,String title,String noteid) throws SQLException{
		Connection conn=MyConection.ConnectDB();
		Date date = new Date();//获得系统时间.
		String ts = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(date);//将时间格式转换成符合Timestamp要求的格式.
		String insert="update note set Title=?,Content=?,Tag=?,Status=?,ChangeTime='"+ts+"'where NoteID=?";
		PreparedStatement ps =(PreparedStatement) conn.prepareStatement(insert); 
		ps.setString(1, title);
		ps.setString(2, content);
		ps.setString(3,tag);
		ps.setInt(4, flag);
		ps.setString(5, noteid);
		ps.executeUpdate();
		//System.out.println(ps);
		ps.close();
		
	}


}
