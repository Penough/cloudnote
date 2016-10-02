<%@page import="dao.NoteDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="${pageContext.request.contextPath}/css/noteEditorButton.css" rel="stylesheet">
<style text/css>
#Text {width:760px;height:250.4px;word-break:break-all;text-align: left;margin-left: 40px;margin-right:40px;overflow:auto;  }
#comm {width:489px;}
#common {height:302px;}
#button {height:150px;}
#comsub {margin-top:40px;height:80px;width:100px;margin-right:20px;}
#comshow {margin-top:20px;margin-bottom:10px;width:1360px;height:500px;}
#comarea {font-family : 微软雅黑,宋体;text-align: left;overflow:auto;}
.cutline{width:1360px;height:5px;border-bottom:1px dashed #000;}
.ComTable {font-family : 微软雅黑,宋体; margin-bottom:10px;margin-left:20px;}
.ComTable th{border: 1px solid #000080;}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>笔记浏览</title>
</head>
<body style="background:url(/springmvc/img/ctbg.jpg);">
<%@ page import="model.Note,java.lang.String" %>
<% //String s=request.getAttribute(giveyounote);
	System.out.println("Get");
	String s=(String)request.getParameter("giveyounote");// 做GET的处理
	Note inote=NoteDao.getNote(s);
	String in=inote.getContent();
	String ti=inote.getTitle();
	String nid=inote.getNoteID();
%>
<h><jsp:include page="index.jsp" flush="true"/></h>
<table style="margin-left:10px;background:#333">
	<tr>
	<th style="background:url(/springmvc/img/note2.gif);">
	<p id="title" style="font-family:微软雅黑;font-size:30px;text-align:left"><%=ti%>
	</p>
	<div name="display"  id="Text" class="showyou" readonly="true" style="font-family:微软雅黑;font-size:15px;"><%=in%></div>
	</th>
	<form>
	<th id="comm">
	<textarea id="common"></textarea>
	<div id="button">
	<input type="button" class="button orange" value="提交评论" id="comsub" onclick="comupload()"/>
	<input type="button" class="button pink" value="收藏" id="comsub" onclick="collect()"/>
	</div>
	</th>
	</tr>
</table>
<div class="cutline"></div>
<div id="comshow">
</div>
</body>
<div style="position:fixed;bottom:0">
<jsp:include page="footer.jsp" flush="true"/>
</div>
<script type="text/javascript" src="/springmvc/ckeditor/ckeditor.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery2.2.4.min.js"></script>
<script src="${pageContext.request.contextPath}/js/context.js"></script>
<script src="${pageContext.request.contextPath}/js/demo.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.easing.1.3.js"></script>
<script src="${pageContext.request.contextPath}/js/animated-menu.js"></script>
<script>
var editor = null;
window.onload = function(){
	editor = CKEDITOR.replace('common',{customConfig:'/springmvc/ckeditor/com.js'});
};
$(document).ready(function(){
	  $("#comsub").click(function(e){
		  function trim(str){
			    return str.replace(/(^\s*)|(\s*$)/g, "");
			  }//去掉空格
			   var str=CKEDITOR.instances.common.getData();
			   str=trim(str);
			   alert(str);
			    if(str==""){
			        alert(str+"内容不能为空！");
			        return false;
			    }
	    });
	  var $noteid="noteid="+"<%=nid%>";
	  var URL = "/springmvc/Welcom/comGet";
	  var ajaxData = {
				noteid: $noteid,
			};
	  $.ajax({
		  type:"POST",
	      url:URL,
	      dataType: 'json',
	      data: ajaxData,
	      success:function(msg){
	        	var div=document.getElementById("comshow");
	        	for(var i=0;i<msg.length;i++){
	        		if(msg[i]!=null){
	        			var ctable=document.createElement("table");
	        			var img=document.createElement("img");
	        			var ctabletr1=document.createElement("tr");
	        			var ctabletr2=document.createElement("tr");
	        			var ctableth1=document.createElement("th");
	        			var ctableth2=document.createElement("th");
	        			var ctableth3=document.createElement("th");
	        			var ctableth4=document.createElement("th");
	        			ctable.setAttribute("class","ComTable");
	        			ctable.style.border="1px solid  #000080 ";
	        			ctable.style.height="180px";
	        			ctable.style.width="1200px";
	        			ctableth1.style.width="300px";
	        			img.style.height="100px";
	        			img.style.width="100px";
	        			img.src="/springmvc/source/sculpt/"+msg[i].costomID+".gif";
	        			img.setAttribute("onerror","this.src='http://localhost:8080/springmvc/source/sculpt/default.jpg'");
	        			img.style.margin="20px";
	        			ctableth1.appendChild(img);
	        			ctabletr1.appendChild(ctableth1);
	        			ctableth2.style.width="900px";
	        			ctableth2.style.padding="20px";
	        			ctableth2.id="comarea";
	        			ctableth2.innerHTML=msg[i].comcon;
	        			ctabletr1.appendChild(ctableth2);
	        			ctabletr1.style.height="67px";
	        			ctable.appendChild(ctabletr1);
	        			//ctableth3.style.width="300px";
	        			ctableth3.innerHTML=msg[i].costomID;
	        			//ctableth4.style.width="900px";
	        			ctableth4.innerHTML=msg[i].puTime;
	        			ctabletr2.appendChild(ctableth3);
	        			ctabletr2.appendChild(ctableth4);
	        			ctable.appendChild(ctabletr2);
	        			div.appendChild(ctable);
	        		}
	        	}
	        	
	        	
	        },
	     error:function(){
	     	alert("获取数据失败.");
	     }
	  });
	});
function comupload(){
	var $noteid="noteid="+"<%=nid%>";
	var $con=CKEDITOR.instances.common.getData();
	var ajaxData = {
		noteid: $noteid,
		display: $con
	};
	var URL = "/springmvc/Welcom/comUpload";
     $.ajax({
        type:"POST",
        url:URL,
        dataType: 'json',
        data: ajaxData,
        complete:function(msg){
        	alert(msg.responseText);
        }   
        });     
};
function collect(){
	var $noteid="noteid="+"<%=nid%>";
	var ajaxData = {
			noteid: $noteid,
		};
	var URL = "/springmvc/Welcom/collect";
	$.ajax({
        type:"POST",
        url:URL,
        dataType: 'json',
        data: ajaxData,
        complete:function(msg){
        	alert(msg.responseText);
        }   
        });    
}

</script>
</html>
