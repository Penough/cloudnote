package com.page.controller;

import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Comm;
import model.Note;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

import dao.ComDao;
import dao.NoteDao;
import util.MyConection;


@org.springframework.stereotype.Controller
@RequestMapping("/Welcom")
public class WelcomeController implements Controller{

	@Override
	public ModelAndView handleRequest(HttpServletRequest arg0, HttpServletResponse arg1) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	@ResponseBody
	@RequestMapping(value = "/welcomeControl",method = RequestMethod.POST)
	public Note[] noteRecord(HttpServletRequest arg0,
			HttpServletResponse arg1) throws Exception {
		// TODO Auto-generated method stub
		Connection conn=MyConection.ConnectDB();
		//ORDER BY RAND() limit 8
		String goten="select * from note where Status!=1 ORDER BY RAND() limit 8 ";
		Statement stmt=(Statement) conn.createStatement();
		ResultSet rs=stmt.executeQuery(goten);
		Note contentlist[]=new Note[8];
		String NoteID,CostomID,Content,CreatedTime,ChangeTime,Tag,Title;
		int Status;
		
		if (rs.next()) {
			for (int i = 0; i < 8; i++) {
				NoteID=rs.getString("NoteID");
				//System.out.println(" ///*\\"+NoteID);
				CostomID=rs.getString("CostomID");
				Content=rs.getString("Content");
				CreatedTime=rs.getString("CreatedTime");
				ChangeTime=rs.getString("ChangeTime");
				Status=rs.getInt("Status");
				Tag=rs.getString("Tag");
				Title=rs.getString("Title");
				contentlist[i]=new Note(NoteID, CostomID, Content, CreatedTime, ChangeTime, Status, Tag, Title);
				System.out.println(contentlist[i]);
				if(!rs.next())break;
			}
		}
		conn.close();
		rs.close();
		return contentlist;
	}
	
	@ResponseBody
	@RequestMapping(value = "/comUpload",method = RequestMethod.POST)
	public String comUpload(@RequestParam("display") String comcon,
			HttpServletRequest arg0,
			HttpServletResponse arg1) throws SQLException{
		String temp=null;
		
		if(arg0.getSession().getAttribute("userID")==null){
			temp="您还没有登录，请登录后评论！";
			//System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!11");
			return temp;
		}
		String userID=(String) arg0.getSession().getAttribute("userID");
		String noteid=arg0.getParameter("noteid");
		noteid=noteid.substring(7);
		//System.out.println("comupload:"+noteid);
		//System.out.println("comupload:"+userID);
		NoteDao ndDao=new NoteDao();
		ndDao.noteUpload(noteid, userID, comcon);
		temp="评论成功!";
		return temp;
	}
	
	@ResponseBody
	@RequestMapping(value = "/comGet",method = RequestMethod.POST)
	public Comm[] scpGet(HttpServletRequest arg0,
			HttpServletResponse arg1) throws SQLException{
			ComDao cDao=new ComDao();
			String noteid=arg0.getParameter("noteid");
			noteid=noteid.substring(7);
			System.out.print("comGet:"+noteid);
			return cDao.getComm(noteid);
	}
/*	@ResponseBody
	@RequestMapping(value = "/selector",method = RequestMethod.POST)
	public int selector(HttpServletRequest arg0,
			HttpServletResponse arg1) throws SQLException{
		String tag=(String)arg0.getParameter("tx");
		String s1="个人信息\n";
		String s2="我的笔记\n";
		String s3="我的笔记圈\n";
		if(tag.equals(s1)){
			return 1;
		}else if(tag.equals(s2)){
			return 2;
		}else if(tag.equals(s3)){
			return 3;
		}else{
			return 0;
		}
	}*/
	@RequestMapping(value = "/delector",method = RequestMethod.POST)
	public void delector(HttpServletRequest arg0,
			HttpServletResponse arg1) throws SQLException{
		//System.out.println(arg0.getParameter("noteid"));
		NoteDao ndDao=new NoteDao();
		String idString=arg0.getParameter("noteid");
		ndDao.deleteNote(idString);
	}
	@RequestMapping(value = "/decoctor",method = RequestMethod.POST)
	public void decoctor(HttpServletRequest arg0,
			HttpServletResponse arg1) throws SQLException{
		System.out.println(arg0.getParameter("noteid"));
		System.out.println(arg0.getParameter("userid"));
		NoteDao ndDao=new NoteDao();
		String idString=arg0.getParameter("noteid");
		String usersString=arg0.getParameter("userid");
		ndDao.decollect(idString,usersString);
	}
	@ResponseBody
	@RequestMapping(value = "/collect",method = RequestMethod.POST)
	public String collect(
			HttpServletRequest arg0,
			HttpServletResponse arg1) throws SQLException{
		String temp=null;	
		if(arg0.getSession().getAttribute("userID")==null){
			temp="您还没有登录，请登录后收藏！";
			return temp;
		}
		String userID=(String) arg0.getSession().getAttribute("userID");
		String noteid=arg0.getParameter("noteid");
		noteid=noteid.substring(7);
		NoteDao ndDao=new NoteDao();
		ndDao.collect(noteid, userID);
		temp="收藏成功!";
		return temp;
	}
	
	@ResponseBody
	@RequestMapping(value = "/notesearch",method = RequestMethod.POST)
	public Note[] notesearch(
			HttpServletRequest arg0,
			HttpServletResponse arg1) throws SQLException{	
		String title=arg0.getParameter("title");
		NoteDao ndDao=new NoteDao();
		Note[] list=ndDao.notesearch(title);
		//System.out.println(list[0].getTitle());
		return list;
	}
	
}


