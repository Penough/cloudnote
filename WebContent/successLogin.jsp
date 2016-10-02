<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登陆成功？</title>
</head>
<body>
<%
if(request.getSession().getAttribute("userID")!=null){
	response.setHeader("refresh", "3;URL=/springmvc/Index/NoteSquare");
	//System.out.println(request.getSession().getAttribute("userID"));
%>
<font size="2"> 登陆成功！三秒后将跳转到首页，如果没有跳转,请按 <a href="/springmvc/Index/NoteSquare">这里</a>!!!
</font>
<%
} else {
response.setHeader("refresh", "3;URL=/springmvc/Index/login");//这里的3,是你要确定的时间秒URL是要跳转的地址
%>
<font size="2"> 您还未登录,请您先登录,三秒后将跳转到登录页面,如果没有跳转,请按 <a href="/springmvc/Index/login">这里</a>!!!
</font>
<%
				}
%>
</body>

</html>