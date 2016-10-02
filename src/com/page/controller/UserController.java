package com.page.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import dao.UserDao;
import model.User;

@org.springframework.stereotype.Controller
@RequestMapping("/User")
public class UserController implements Controller {

	@Autowired     
	UserDao userDao;
	@Override
	public ModelAndView handleRequest(HttpServletRequest arg0, HttpServletResponse arg1) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView login(@RequestParam("user") String username,
			@RequestParam("password") String password,
			HttpServletRequest arg0, HttpServletResponse arg1) throws Exception {		
		User user = userDao.login(username, password);	
		ModelAndView mv = new ModelAndView();
		if(user.getId()==null||username=="请输入用户名"){		
			mv.addObject("errormessage","用户名或密码错误请重新输入！");
	        mv.setViewName("login");
		}else{
			//System.out.println("已执行");
			arg0.getSession().setAttribute("userID", user.getId());
			arg0.getSession().setAttribute("name",user.getName());
			//System.out.println(arg0.getSession().getAttribute("userID")+"/////");
			//System.out.println(arg0.getSession().getAttribute("Scuplture"));
			String temp=null;
			if(arg0.getSession().getAttribute("userID")!=null){
				FileOutputStream output = null;
				InputStream input = null;
				input=user.getScul();
				// 设置写出路径。
				//System.out.println("OUT");
				if(input!=null){
					//System.out.println("xxxx"+input.toString());
					temp = arg0.getSession().getServletContext().getRealPath("/source/sculpt");
					temp=temp+"\\"+user.getId()+".gif";
					File file =new File(temp);
						if (!file.exists()) {
							output = new FileOutputStream(temp);
					// set read buffer size 
					byte[] rb = new byte[1024000];
					int ch = 0;
					// process blob
					try {
					// 写入本地文件系统
					while ((ch = input.read(rb)) != -1) {
						output.write(rb, 0, ch);
					}
					} catch (IOException e) {
						e.printStackTrace();
					}
					try {
						input.close();
					} catch (IOException e) {
						e.printStackTrace();
					}
					try {
						output.close();
					} catch (IOException e) {
						e.printStackTrace();
						}
					}
					temp="/springmvc/source/sculpt/"+user.getId()+".gif";
				}//else {
					//temp = "http://localhost:8080/springmvc/source/sculpt/default.jpg";
					//System.out.println("xxxx"+temp);
				//}
			}
			
			arg0.getSession().setAttribute("Sculpture", temp);
			//System.out.println("!!!!"+arg0.getSession().getAttribute("Sculpture"));
			arg0.getSession().setAttribute("phone", user.getPhonenum());
			arg0.getSession().setAttribute("Text", user.getText());	
			arg0.getSession().setAttribute("CKFinder_UserRole", user.getRole());
			mv.setViewName("successLogin");
			
		}
		return mv;
	}
	
	@RequestMapping(value = "/register", headers=("content-type=multipart/*"), method = RequestMethod.POST)
	public ModelAndView Register(@RequestParam("user") String userid,
			@RequestParam("password") String password,
			@RequestParam("passwordother") String passwordother,
			@RequestParam("username") String username,
			@RequestParam("phonenum") String phonenum,
			@RequestParam("statue") MultipartFile statue,
			@RequestParam("text") String text,
			HttpServletRequest arg0, HttpServletResponse arg1) throws Exception {
			statue.getInputStream();
			new ModelAndView();
			if(password.equals(passwordother)){
				if(userDao.registUser(userid, password, username, phonenum, statue.getInputStream(), text)){
					System.out.println("插入成功！");
					return login(userid, password, arg0, arg1);
				}
			}
			return null;
	}
	
	@RequestMapping(value = "/noteupload", headers=("content-type=multipart/*"), method = RequestMethod.POST)
	public ModelAndView noteUpload(@RequestParam("editorarea") String content,
		@RequestParam("tit") String title,	
		@RequestParam("tag") String tag,
		HttpServletRequest arg0, HttpServletResponse arg1) throws Exception{
		arg0.setCharacterEncoding("UTF-8"); 
		String costomid=(String) arg0.getSession().getAttribute("userID");
		if(costomid==null){
			return new ModelAndView("redirect:/Index/successLogin");
		}
		String sta=null;
		sta=arg0.getParameter("pub");
		int flag=0;
		if(sta!=null){
			flag=1;
		}
        userDao.noteUpload( costomid,content,tag,flag, title);
        ModelAndView mv=new ModelAndView();
        mv.setViewName("redirect:/Index/NoteSquare");
		return mv;	
	}
	@RequestMapping(value = "/noteupdate", headers=("content-type=multipart/*"), method = RequestMethod.POST)
	public ModelAndView noteUpdate(@RequestParam("editorarea") String content,
		@RequestParam("tit") String title,	
		@RequestParam("tag") String tag,
		@RequestParam("rnote") String rnote,
		HttpServletRequest arg0, HttpServletResponse arg1) throws Exception{
		arg0.setCharacterEncoding("UTF-8"); 
		String costomid=(String) arg0.getSession().getAttribute("userID");
		if(costomid==null){
			return new ModelAndView("redirect:/Index/successLogin");
		}
		String sta=null;
		sta=arg0.getParameter("pub");
		int flag=0;
		if(sta!=null){
			flag=1;
		}
		System.out.println(" ===== "+rnote);
        userDao.noteUpdate(content, tag, flag, title, rnote);
        ModelAndView mv=new ModelAndView();
        mv.setViewName("redirect:/Index/NoteSquare");
		return mv;	
	}
	
	@RequestMapping(value = "/writtenoff",method = RequestMethod.POST)
	public void writtenoff(HttpServletRequest arg0,HttpServletResponse arg1){
		System.out.println("执行");
		if(arg0.getSession()!=null){
			arg0.getSession().removeAttribute("userID");
			arg0.getSession().invalidate();
			System.out.println("成功执行！");
		}
	}
}
