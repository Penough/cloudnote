<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册~</title>
</head>
<style type=text/css>
th{text-align:left;}
table{font-family:"幼圆";margin-left:38%;}
</style>

    
<body style="background:url(/springmvc/img/loginbg.gif);background-size:cover;">
<jsp:include page="index.jsp" flush="true"/>
<table id="registertable" style="margin-top:50px">
<form name="Register" role="form" enctype="multipart/form-data" method="post" action="${pageContext.request.contextPath}/User/register" style="margin:20px">
<tr><th><label>账号:</label></th><th><input type="text" id="userid" name="user" maxlength="20" value="请输入用户名" onKeyUp="value=value.replace(/[^a-zA-Z0-9@.]/g,'')" onfocus="this.value=''" onblur="if(this.value==''){this.value='请输入用户名'}"/></th></tr>
<tr><th><label>密码:</label></th><th><input type="password" id="pa" name="password" size="21" maxlength="20"/></th></tr>
<tr><th><label>确认密码:</label></th><th><input type="password" id="pae" name="passwordother" size="21" maxlength="20" onblur="check()"/></th></tr>
<tr><th><label>昵称:</label></th><th><input type="text" name="username" maxlength=10/></th></tr>
<tr><th><label>电话号码:</label></th><th><input type="text" name="phonenum" size="20" maxlength="11" onKeyUp="value=value.replace(/[^0-9]/g,'')" /></th></tr>
<tr><th><label>头像:</label></th><th><input type="file" name="statue" accept="image/gif,image/jpeg,image/pmg" style={length:180px;width:180px;}/></th></tr>
<tr><th><label>P.S.:</label></th><th><input type="text" name="text" maxlength=50/></th></tr>
<tr><th></th><th><input id="register" type="submit" value="提交" style="margin:20px;"/></th></tr>
</table>
<div id="tip" style= {font-family:"微软雅黑";font-size:80px;}></div>
</form>
<script src="${pageContext.request.contextPath}/js/jquery2.2.4.min.js"></script>
<script src="${pageContext.request.contextPath}/js/context.js"></script>
<script src="${pageContext.request.contextPath}/js/demo.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.easing.1.3.js"></script>
<script src="${pageContext.request.contextPath}/js/animated-menu.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	  $("#register").click(function(e){
	    if($("#pa").val() != $("#pae").val()){
	    	alert("两次密码输入不同！");
	    	return false;
	    }
	    if($("#userid").val()==null || $("#pa").val()==null){
	    	alert("账户或密码不能为空！");
	    	return false;
	    }
	  });
	});
</script>
</body>
</html>