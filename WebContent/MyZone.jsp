
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="${pageContext.request.contextPath}/css/noteEditorButton.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ page import="model.User,model.Note,dao.NoteDao,java.lang.String,dao.UserDao,java.io.InputStream" %>
<%String s =(String)request.getSession().getAttribute("userID");
  
  String hid=request.getParameter("homeid");
  User u=UserDao.login(hid);
  String scuUrl=null;
  String name=null;
  String tel=null;
  InputStream in=null;
  String tex=null;
  Note[] notelist=null;
  Note[] colelist=null;
  if(u!=null){
	  name = u.getName();
	  tel=u.getPhonenum();
	  tex=u.getText();
	  in=u.getScul();
	  if(in==null){
		 scuUrl="/springmvc/source/sculpt/default.jpg";
	  }else{
		 scuUrl="/springmvc/source/sculpt/"+hid+".gif";
	  }
	  notelist=NoteDao.usersNote(hid); 
	  colelist=NoteDao.coleNotes(hid);
  }
%>
<style type="text/css">
#identity {width:1360px;height:220px;}
p {text-align:left;font-family:"幼圆","微软雅黑";}
#margin {background:orange;font-size:35px;font-weight:bolder;border-radius:0px 10px 10px 0px;}
#lable {font-size:30px;font-weight:bolder;text-shadow: 0 0px 0 #fff;}
#mesty {margin-right:20px;font-size:20px}
.divline{margin-top:0px;height:30px;border-radius:0px 20px 20px 0px;}
.astyle {font-size:18px;font-family:"黑体","宋体";overflow:auto;text-shadow: 0 0px 0 #fff;}
</style>
<title><%=hid%>的小屋</title>
</head>
<jsp:include page="index.jsp" flush="true"/>
<body style="background:url(/springmvc/img/mybg.jpg);background-size:cover;">
<%
 if(u.getId()==null){
	 System.out.println("error!!!");
 }
%>
<div id="identity">
<p><span id="margin">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</span><span id="lable">个人信息</span></p>
<table style="background:grey;height:150px;width:870px">
<tr>
<th style="width:30%;">
<img src=<%=scuUrl%> onerror="this.src='/springmvc/source/sculpt/default.jpg'" width="120px" height="120px" style="margin-left:141px">
</th>
<th style="width:20%">
<div class="divline" style="background:purple;"></div>
<div class="divline" style="background:yellow;margin-top:15px;"></div>
<div class="divline" style="background:#f20147;margin-top:15px;"></div>
</th>
<th  style="width:35%">
<p style="margin-top:10px;">
	<span id="mesty">Name</span>
	<a class="astyle"><%=name %></a>
</p>
<p style="margin-top:25px;">
	<span id="mesty">Tel</span>
	<a class="astyle"><%=tel %></a>
</p>
<p style="margin-top:25px;">
	<span id="mesty">P.S</span>
	<a class="astyle"><%=tex %></a>
</p>
</th>
<th style="width:15%">
</th>
</tr>
</table>

</div>
<div id="notes">
<p><span id="margin" style="background:green;">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</span><span id="lable">笔记</span></p>
<a name="anchor"></a>
<div style="height:240px;width:1360px;background:grey;overflow-y:scroll;">
<%
String hre=null;
for(int i=0;i<notelist.length;i++){
	hre="/springmvc/Index/notetext?giveyounote="+notelist[i].getNoteID();
%>
<div style="height:200px;width:200px;margin:20px;background:white;float:left;word-break:break-all;box-shadow: 10px 10px 10px #000;border-radius:5px 5px 5px 5px;">
<h><a  href=<%=hre %>><%=notelist[i].getTitle() %></a></h>
<div  style="overflow-y:hidden;height:100px;width:180px;margin:10px;font-family:'宋体';font-size:20px"><%=notelist[i].getContent() %></div>
<%
if(s!=null){
if(request.getSession().getAttribute("userID").equals(hid)){ %>
<button class="button blue" onclick="window.location.href='/springmvc/Index/noteEdit?rnoteid=<%=notelist[i].getNoteID() %>' " style="width:95px;height:60px;margin:0px;margin-top:2px;">修改</button>
<button class="button red" onclick="del(<%=notelist[i].getNoteID()%>)" style="width:95px;height:60px;margin:0px;margin-top:2px;">删除</button>
<%}
} %>
</div>
<%
 }
%>
</div>

</div>
<div id="collection">
<p><span id="margin" style="background:blue;">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</span><span id="lable">收藏</span></p>
<div style="height:240px;width:1360px;background:grey;overflow-y:scroll;">
<%

for(int i=0;i<colelist.length;i++){
	hre="/springmvc/Index/notetext?giveyounote="+colelist[i].getNoteID();
%>
<div style="height:200px;width:200px;margin:20px;background:white;float:left;word-break:break-all;box-shadow: 10px 10px 10px #000;border-radius:5px 5px 5px 5px;">
<h><a  href=<%=hre %>><%=colelist[i].getTitle() %></a></h>
<div  style="overflow-y:hidden;height:100px;width:180px;margin:10px;font-family:'宋体';font-size:20px"><%=colelist[i].getContent() %></div>
<%
if(s!=null){
if(request.getSession().getAttribute("userID").equals(hid)){ %>
<button class="button red" style="width:95px;height:60px;margin:0px;margin-top:2px;" onclick="unco('<%=colelist[i].getNoteID()%>','<%=request.getSession().getAttribute("userID") %>')">取消收藏</button>
<%}} %>
</div>
<%
 }
%>


</div>
</div>





</body>
<jsp:include page="footer.jsp" flush="true"/>
<script src="${pageContext.request.contextPath}/js/jquery2.2.4.min.js"></script>
<script src="${pageContext.request.contextPath}/js/context.js"></script>
<%-- <script src="${pageContext.request.contextPath}/js/demo.js"></script> --%>
<script src="${pageContext.request.contextPath}/js/jquery.easing.1.3.js"></script>
<script src="${pageContext.request.contextPath}/js/animated-menu.js"></script>
<script>
/* $( function() {
	var URL="/springmvc/Welcom/selector";
    $("#test li").click(function(){
            $("#test li").removeClass("active");
            $(this).addClass("active");
             $("#test li").removeAttr("id");
            $(this).attr("id","flag");
            var $x1 = document.getElementById("flag").innerText;
            var ajaxData={
            		tx:$x1,
            };
            $.ajax({
              type:"POST",
       	      url:URL,
       	      dataType: 'json',
       	      data:ajaxData,
       	      success:function(msg){
       	    	  
       	      },
            error:function(){
            	alert("信息错误！");
            } 
            });
	});*/ 
	function del(msg){
		
		//var $con=CKEDITOR.instances.common.getData();
		var ajaxData = {
			noteid: msg
		};
		var URL = "/springmvc/Welcom/delector";
	     $.ajax({
	        type:"POST",
	        url:URL,
	        dataType: 'json',
	        data: ajaxData,
	        complete:function(msg){
	        	//alert("删除完成！");
	        	window.location= window.location;
	        	
	        }   
	        }); 
	};
function unco(msg1,msg2){
		
		//var $con=CKEDITOR.instances.common.getData();
		var ajaxData = {
			noteid: msg1,
			userid:msg2,
		};
		var URL = "/springmvc/Welcom/decoctor";
	     $.ajax({
	        type:"POST",
	        url:URL,
	        dataType: 'json',
	        data: ajaxData,
	        complete:function(msg){
	        	//alert("删除完成！");
	        	window.location= window.location;
	        }   
	        }); 
	};
	
</script>
</html>