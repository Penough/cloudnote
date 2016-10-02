
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page isELIgnored ="false" %>
<html id="loginhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/noteEditorButton.css" rel="stylesheet">
<title>登陆~</title>
<style tyle="text/css">
#tip {color:red;margin:26px;font-family:"微软雅黑";font-size:20px;}
#loginhtml {background:url(/springmvc/img/bing-3.jpg);}
#logintable{-moz-box-shadow: 10px 10px 10px #909090;
-webkit-box-shadow: 10px 10px 10px #909090;
box-shadow:10px 10px 10px #000}
</style>

</head>
<body>
<jsp:include page="index.jsp" flush="true"/>
<table id="logintable" style="width:570px;margin-left:360px;margin-top:100px;border-space:0;">
<form name="Login" role="form" method="post" action="${pageContext.request.contextPath}/User/login" style="margin:20px">
<tr><th>
<div class="input-group input-group-lg" style="width:420px;margin-top:40px;margin-left:50px;margin-bottom:20px;padding-left:60px;">
	<span class="input-group-addon" >用户名</span>
	<input type="text" name="user" maxlength="20" class="form-control" placeholder="请输入用户名" onKeyUp="value=value.replace(/[^a-zA-Z0-9@.]/g,'')" onfocus="this.value=''" onblur="if(this.value==''){this.value='请输入用户名'}"/>
</div>
</th></tr>
<tr><th>
<div class="input-group input-group-lg" style="width:420px;margin-top:20px;margin-left:50px;margin-bottom:20px;padding-left:60px;">
	<span class="input-group-addon" >密码</span>
<input type="password" name="password" class="form-control" size="20" maxlength="20"/></th></tr>
<tr><th><input type="submit" class="button green" value="登陆" style="margin:20px;margin-left:110px;"/><input type="button" class="button orange" style="float:right;margin:20px;margin-right:100px;" value="注册"  onclick='window.open("/springmvc/Index/register")'/></th></tr>
</form>
</table>
<p id="tip">${errormessage}<p>
<jsp:include page="footer.jsp" flush="true"/>
</body>
<script src="${pageContext.request.contextPath}/js/jquery2.2.4.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery2.2.4.min.js"></script>
<script src="${pageContext.request.contextPath}/js/context.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.easing.1.3.js"></script>
<script src="${pageContext.request.contextPath}/js/animated-menu.js"></script>
</html>
