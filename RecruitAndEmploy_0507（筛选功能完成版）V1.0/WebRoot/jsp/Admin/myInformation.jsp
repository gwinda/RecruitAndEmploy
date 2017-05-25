<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

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
<a href="lookEI?id=2">验证不通过企业用户</a><br>
<a href="">举报等其他...</a><br>


  </body>
</html>
