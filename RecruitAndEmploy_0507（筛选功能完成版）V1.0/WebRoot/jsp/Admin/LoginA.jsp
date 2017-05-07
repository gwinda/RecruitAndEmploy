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
    
    <title>My JSP 'LoginA.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
.form{
	width:50%;
	height:400px;
	margin:0 auto;
	text-align:center;
}	
	
</style>
  </head>
  
  <body>
  <div class="form"> 
    <s:form action="LoginAdmin!LoginAdmin">
        <s:textfield name="admin.number" label="账号" />
        <s:textfield name="admin.password" label="密码" />
        <s:submit value="登录" />
    </s:form>
   </div>
  </body>
</html>
