<%@page import="java.io.InputStream"%>
<%@page import="com.mysql.jdbc.Blob"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<link href="/springmvc/css/indexstyle.css" rel="stylesheet" type="text/css"/> 
<link rel="stylesheet" type="text/css" href="/springmvc/css/demo.css"/>	
<link rel="stylesheet" type="text/css" href="/springmvc/css/context.standalone.css"/>
<link rel="stylesheet" type="text/css" href="/springmvc/css/animated-menu.css"/>
<!-- <body id="mbody" style="background:#aaaaaa;height:200px;"> -->
<div style="height:160px;width:1360px;">
<nav style="height:160px;">
<%--  <div id="out">
	<table id="menutable“>
	<th>
	<div id="div1">
	<h1 class="logo">
	  <a href="http://www.baidu.com/"></a>
	</h1>
	<div class="guide">
		<ul class="main-menu">
			<li style="background:url(/springmvc/img/gc.gif);margin-left:260px">
			<a href="/springmvc/Index/NoteSquare">笔记广场</a>
			</li>
			<li style="background:url(/springmvc/img/mn.gif);margin-left:30px">
			<a href="/springmvc/Index/noteEdit">创建笔记</a>
			</li>
			<li style="background:url(/springmvc/img/fk.gif);margin-left:30px">
			<a href="/springmvc/help.html">帮助</a>
			</li>
		</ul>
	</div>
	<%
	if(request.getSession().getAttribute("userID")==null){ 
	%>
	<div class="not-users">
	<a href="/springmvc/Index/login">这里是未登录用户</a>
	</div>
	<%
	}else{
	    HttpSession s = request.getSession(); 
	     //System.out.println("!~~"+s.getAttribute("Sculpture"));
	   /* System.out.println("!~~"+s.getAttribute("userID")); */
	    String si=" "+s.getAttribute("Sculpture");
	   String ui="?homeid="+s.getAttribute("userID");
	%>
	<div class="not-users">
	<img src=<%=si%> id="scu" onerror="this.src='http://localhost:8080/springmvc/source/sculpt/default.jpg'" alt="Smiley face" height="185" width="185" onclick="window.location.href='zone<%=ui%>'"/>
	
	</div>
	<%
	}
	%>
	</th>
	</table>
	</div>
</nav> --%>
<ul id="mul">

		<li id="mli1" class="green" style="overflow: hidden; height: 50px;">

			<p id="mp"><a id="ma" href="/springmvc/Index/NoteSquare">笔记广场</a></p>

			<p id="mp" class="subtext">在这里看到别人的笔记</p>

		</li>

		<li id="mli2" class="yellow" style="overflow: hidden; height: 50px;">

			<p id="mp"><a id="ma" href="/springmvc/Index/noteEdit">创建笔记</a></p>

			<p id="mp" class="subtext">创建您的笔记</p>

		</li>

		<li id="mli3" class="blue" style="overflow: hidden; height: 50px;">

			<p id="mp"><a id="ma" href="/springmvc/Index/search">搜索</a></p>

			<p id="mp" class="subtext">搜索您想要的笔记</p>

		</li>

		<li id="mli4" class="purple" style="overflow: hidden; height: 50px;">

			<p id="mp"><a id="ma" href="/springmvc/help.html">帮助</a></p>

			<p id="mp" class="subtext">乐意为您效劳</p>

		</li>


	</ul>
	<%
	if(request.getSession().getAttribute("userID")==null){ 
	%>
	<div class="not-users">
	<a href="/springmvc/Index/login">这里是未登录用户</a>
	</div>
	<%
	}else{
	    HttpSession s = request.getSession(); 
	     //System.out.println("!~~"+s.getAttribute("Sculpture"));
	   /* System.out.println("!~~"+s.getAttribute("userID")); */
	    String si=" "+s.getAttribute("Sculpture");
	   String ui="?homeid="+s.getAttribute("userID");
	%>
	<div class="not-users">
	<img src=<%=si%> id="scu" onerror="this.src='/springmvc/source/sculpt/default.jpg'" alt="Smiley face" height="140" width="140" onclick="window.location.href='zone<%=ui%>'"/>
	
	</div>
	<%
	}
	%>
	</th>
	</table>
	</div>
</nav>
</div>
<!-- </body> -->

<script src="${pageContext.request.contextPath}/js/jquery2.2.4.min.js"></script>
<script src="${pageContext.request.contextPath}/js/context.js"></script>
<script src="${pageContext.request.contextPath}/js/demo.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.easing.1.3.js"></script>
<script src="${pageContext.request.contextPath}/js/animated-menu.js"></script>



