<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
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
  <a href="index2.jsp">shouye</a>
  <h2>个人用户</h2>
           <h3><a href="jsp/Personal/ResumeCreateJsp.jsp">新建简历</a></h3>
           <h3><a href="">查找工作</a></h3>
           <h3><a href="look.action">查看所有简历</a></h3>
           <h3><a href="ApplicationAction.action?opera=invite&user=1">查看以投递简历</a></h3>
           <h3><a href="lookpersoninformation!look.action?idFK=2">查看个人基本信息</a></h3>          
  <h2>企业用户</h2>
           <h3><a href="jsp/Enterprise/RecruitmentCreateJsp.jsp">发布招聘</a></h3>
           <h3><a href="Rec?i=1">查看招聘</a></h3>
           <h3><a href="ApplicationAction.action?opera=notsee&user=2">查看以投递简历</a></h3>
           <h3><a href="Ei">查看企业信息</a></h3>
  </body>
</html>
