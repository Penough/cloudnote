package com.page.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

@org.springframework.stereotype.Controller
@RequestMapping("/Index")
public class IndexController implements Controller {

	@Override
	@RequestMapping("/index")
	public ModelAndView handleRequest(HttpServletRequest arg0,
			HttpServletResponse arg1) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("name", "Li Chunqing");
		mv.setViewName("/index");
		return mv;
	}
	@RequestMapping("/login")
	public ModelAndView login(HttpServletRequest arg0,
			HttpServletResponse arg1) throws Exception {	
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/login");
		return mv;
	}
	@RequestMapping("/register")
	public ModelAndView register(HttpServletRequest arg0,
			HttpServletResponse arg1) throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/Register");
		return mv;
			
	}
	
	@RequestMapping("/successLogin")
	public ModelAndView successLogin(HttpServletRequest arg0,
			HttpServletResponse arg1) throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/successLogin");
		return mv;		
	}
	
	@RequestMapping("/NoteSquare")
	public ModelAndView NoteSquare(HttpServletRequest arg0,
			HttpServletResponse arg1) throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/NoteSquare");
		return mv;		
	}
	@RequestMapping("/noteEdit")
	public ModelAndView noteEdit(HttpServletRequest arg0,
			HttpServletResponse arg1) throws Exception{
		ModelAndView mv = new ModelAndView();
		if(arg0.getSession().getAttribute("userID")==null){
			mv.setViewName("/successLogin");
			return mv;
		}
		
		mv.setViewName("/NoteEditor");
		return mv;		
	}
	@RequestMapping("/zone")
	public ModelAndView zone(HttpServletRequest arg0,
			HttpServletResponse arg1) throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/MyZone");
		return mv;		
	}
	@RequestMapping("/notetext")
	public ModelAndView notetext(HttpServletRequest arg0,
			HttpServletResponse arg1) throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/notetext");
		return mv;		
	}
	@RequestMapping("/search")
	public ModelAndView search(HttpServletRequest arg0,
			HttpServletResponse arg1) throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/search");
		return mv;		
	}

}
