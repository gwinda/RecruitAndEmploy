<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>管理员界面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  <style type="text/css">
.top{ width:100%; height:100px;border:1px solid #039; }
.middle{ width:100%; height:700px;border:1px solid #039;}

</style>
</head>

<body>
<B>Admin</B><br>
<hr>
<a href="lookEI?id=0">待验证企业用户</a><br>
<a href="lookEI?id=1">已验证企业用户</a><br>
<a href="lookEI?id=2">验证不通过企业用户</a><br><BR>
<h4>广告更换</h4>
<table border="1"|>
	<tr>
		<td>广告图片</td>
		<td><img src="personPicture/f.jpg" width="80px" height="80px" ></td>
		<td><img src="personPicture/b.jpg" width="80px" height="80px" ></td>
		<td><img src="personPicture/c.jpg" width="80px" height="80px" ></td>
		<td><img src="personPicture/d.jpg" width="80px" height="80px" ></td>
		<td><img src="personPicture/e.jpg" width="80px" height="80px" ></td>
	</tr>
	<tr align="center">
		<td>图片编码</td>
		<td>1</td>
		<td>2</td>
		<td>3</td>
		<td>4</td>
		<td>5</td>
	</tr>	
</table><br>
企业页面广告：企业信息页面头部-6,企业信息页面侧部-7,简历处理页面头部-8,查看已发布招聘头部-9<BR>
<h5>在文本框中输入想更换图片的编号，请选择一个图片放入</h5>
	<s:form action="ad" method="post" enctype="multipart/form-data">
		<s:select label="选择要更改的图片编码" name="position" list="{'1','2','3','4','5','6','7','8','9'}"      />
		<s:file name="upload"/>
		<s:submit/>
	</s:form>
<br>
<BR><BR>
<a href="">举报等其他...</a><br>


  </body>
</html>
