<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Welcome</title>
<link href="/springmvc/css/notesquare.css" rel="stylesheet" type="text/css"> 

</head>
<body id="nsbody">
<jsp:include page="index.jsp" flush="true"/>
<div id="con">
<table id="cta">
<tr>
<th><div id="t1">1</div><div id="c1">2</div><div id="h1">3</div></th><th style="background:url(/springmvc/img/1.gif);"></th>
<th><div id="t2">1</div><div id="c2">2</div><div id="h2">3</div></th><th style="background:url(/springmvc/img/2.gif);"></th>
</tr>
<tr>
<th style="background:url(/springmvc/img/3.gif);"></th><th><div id="t3">1</div><div id="c3">2</div><div id="h3">3</div></th>
<th style="background:url(/springmvc/img/4.gif);"></th><th><div id="t4">1</div><div id="c4">2</div><div id="h4">3</div></th>
</tr>
<tr>
<th><div id="t5">1</div><div id="c5">2</div><div id="h5">3</div></th><th style="background:url(/springmvc/img/5.gif);"></th>
<th><div id="t6">1</div><div id="c6">2</div><div id="h6">3</div></th><th style="background:url(/springmvc/img/6.gif);"></th>
</tr>
<tr>
<th style="background:url(/springmvc/img/7.gif);"></th><th><div id="t7">1</div><div id="c7">2</div><div id="h7">3</div></th>
<th style="background:url(/springmvc/img/8.gif);"></th><th><div id="t8">1</div><div id="c8">2</div><div id="h8">3</div></th>
</tr>
</table>
</div>
<div>
<jsp:include page="footer.jsp" flush="true"/>
</div>
</body>

<script src="${pageContext.request.contextPath}/js/jquery2.2.4.min.js"></script>
<script src="${pageContext.request.contextPath}/js/context.js"></script>
<script src="${pageContext.request.contextPath}/js/demo.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.easing.1.3.js"></script>
<script src="${pageContext.request.contextPath}/js/animated-menu.js"></script>

<script>
$(document).ready(function(){
var URL = "/springmvc/Welcom/welcomeControl";
    $.ajax({
        type:"POST",
        dataType: 'json',
        url:URL,
        success:function(msg){
        	//console.log(msg);
        	for(var i=0;i<msg.length;i++){
        		if(msg[i]!=null){
        			var h=i+1;
        			$("#t"+h).html("<a href='/springmvc/Index/notetext?giveyounote="+msg[i].noteID+"'>"+msg[i].title+"</a>");
        			$("#c"+h).html(msg[i].content);
        			$("#h"+h).html(msg[i].costomID);
        			//document.write(msg[i]);
        		}
        		//document.write(msg[i]);
        	}
        },
        error:function(){
        	alert("获取数据失败.");
        }
    });
});
</script>
</html>