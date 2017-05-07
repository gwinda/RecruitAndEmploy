<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Login.jsp' starting page</title>
    
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
  <h3>个人登录</h3>
  <h4><a href="LoginR.jsp">企业登录</a></h4>
    <s:form action="Login!pinformation">
        <s:textfield name="pinformation.mailbox" label="邮箱" />
        <s:textfield name="pinformation.password" label="密码" />
        <s:submit value="登录"/>
    </s:form>
       <s:a href="RegisterP.jsp">个人注册</s:a>
       <s:a href="RegisterR.jsp">企业注册</s:a>
  </body>
</html>
