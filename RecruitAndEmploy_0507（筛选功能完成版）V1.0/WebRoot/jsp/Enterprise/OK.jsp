<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<link type="text/css" rel="stylesheet" href="css/common.css?v=20150807" />
<!--css-->
<link type="text/css" rel="stylesheet" href="css/common.css?v=20150807" />
<!--css-->
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="css/rc_index.css">
<!--jquery-->
<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<!--cookie domain-->
<script type="text/javascript" src="js/cookie.js"></script>
<script type="text/javascript" src="js/referer_getter.js"></script>
<script language="javascript" type="text/javascript"
	src="DatePicker/WdatePicker.js"></script>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'OK.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  已结束该招聘<BR>
   <a href="Rec?i=1">返回查看招聘</a></br>
  </body>
</html>
