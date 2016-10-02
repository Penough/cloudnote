<%@page import="org.springframework.web.servlet.ModelAndView,dao.NoteDao,model.Note"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/noteEditorButton.css" rel="stylesheet">
<html>
<head>
<link href="/springmvc/css/noteeditor.css" rel="stylesheet" type="text/css"> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="/springmvc/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="/springmvc/ckfinder/ckfinder.js"></script>
<title>笔记编辑</title>
</head>
<body style="background:url(/springmvc/img/editbg.jpg);background-size:cover;">
<jsp:include page="index.jsp" flush="true"/>
<%	String rnoteid= request.getParameter("rnoteid");
if(rnoteid==null){ %>
<form role="form"  method="post" action="${pageContext.request.contextPath}/User/noteupload" enctype="multipart/form-data" action="${pageContext.request.contextPath}/User/notesubmit">
<table style="width:1360px;">
<tr>
<th>
	<div class="input-group input-group-lg" style="width:420px;margin-top:20px;margin-left:50px;margin-bottom:20px;">
		<span class="input-group-addon" >笔记名</span>
		<input type="text" name="tit" id="title" maxlength="15" class="form-control" placeholder="TITLE">
	</div>
</th>
<th>
	<div class="input-group input-group-lg" style="width:420px;margin-top:20px;margin-left:50px;margin-bottom:20px;">
	<span class="input-group-addon" >便签</span>
<input type="text" name="tag" id="tag" maxlength="10" class="form-control" placeholder="TAG">
</div>
</th>
<th>
<section>
  	<div class="checkboxThree" >
  		<input type="checkbox" value="1" id="checkboxThreeInput" name="pub" />
	  	<label for="checkboxThreeInput"></label>
  	</div>
</section>

</th>
</tr>
</table>
<table style="width:1360px;margin:0px">
<tr>
<th>
<textarea name="editorarea" id="edit"><p>请键入您的笔记哦~</p>
</textarea>
</th>
</tr>
</table>


<p><input type="submit" id="submit" class="button green" style="width:420px;margin-top:20px;margin-left:50px;margin-bottom:20px;"/></p>
</form>
<%}else{ 
	NoteDao nd=new NoteDao();
	String ussign=nd.notesUser(rnoteid);
	String uses=(String)request.getSession().getAttribute("userID");
	if(uses.equals(ussign)){
		Note note=nd.getNote(rnoteid);
		String ti=note.getTitle();
		String ta=note.getTag();
		String co=note.getContent();
	%>
<form role="form"  method="post" action="${pageContext.request.contextPath}/User/noteupdate" enctype="multipart/form-data" action="${pageContext.request.contextPath}/User/notesubmit">
<table style="width:1360px;">
<tr>
<th>
	<div class="input-group input-group-lg" style="width:420px;margin-top:20px;margin-left:50px;margin-bottom:20px;"><% %>
		<span class="input-group-addon" >笔记名</span>
		<input type="text" name="tit" id="title" maxlength="15" class="form-control" placeholder="TITLE" value="<%=ti %>">
	</div>
</th>
<th>
	<div class="input-group input-group-lg" style="width:420px;margin-top:20px;margin-left:50px;margin-bottom:20px;">
	<span class="input-group-addon" >便签</span>
<input type="text" name="tag" id="tag" maxlength="10" class="form-control" placeholder="TAG" value="<%=ta %>">
</div>
</th>
<th>
<section>
  	<div class="checkboxThree" >
  		<input type="checkbox" value="1" id="checkboxThreeInput" name="pub" />
	  	<label for="checkboxThreeInput"></label>
  	</div>
</section>

</th>
</tr>
</table>
<table style="width:1360px;margin:0px">
<tr>
<th>
<textarea name="editorarea" id="edit"><%=co %>
</textarea>
</th>
</tr>
</table>

<input type="text" id="rn" name="rnote" readonly="true" value="<%=rnoteid %>"/>
<p><input type="submit" id="submit1" class="button green" style="width:420px;margin-top:20px;margin-left:50px;margin-bottom:20px;"/></p>
</form>
<%}else{

	}

	
	
	} %>
</body>
<jsp:include page="footer.jsp" flush="true"/>
<script src="${pageContext.request.contextPath}/js/jquery2.2.4.min.js"></script>
<script src="${pageContext.request.contextPath}/js/context.js"></script>
<script src="${pageContext.request.contextPath}/js/demo.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.easing.1.3.js"></script>
<script src="${pageContext.request.contextPath}/js/animated-menu.js"></script>
<script type="text/javascript">
var editor = null;
window.onload = function(){
	$("#rn").hide();
    editor = CKEDITOR.replace('editorarea',{customConfig:'/springmvc/ckeditor/myconfig.js'});
   // CKFinder.setupCKEditor( editor, '/springmvc/ckfinder/' ); 
};
$("#submit").click(function () {
    /* CKEDITOR.replace("editor1"); */
    var title = $("#title").val(); /*不能用.text()或.html()*/
    var val = CKEDITOR.instances.edit.getData();
    var content = editor.document.getBody().getText();
    if (title.length == 0 || val.length == 0) {
        alert("标题或内容不能为空");
        return false;
    } else {
        alert("提交完成！");
    }
});
$("#submit1").click(function () {
    /* CKEDITOR.replace("editor1"); */
    var $rnoteid= <%=rnoteid %>;
	var ajaxData = {
		rnoteid: $rnoteid
	};
    alert($rnoteid);
	var URL = "/springmvc/User/noteupdate";
     $.ajax({
        type:"POST",
        url:URL,
        dataType: 'json',
        data: ajaxData,
        complete:function(msg){
        	alert(msg.responseText);
        }   
        }); 
});
</script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</html>