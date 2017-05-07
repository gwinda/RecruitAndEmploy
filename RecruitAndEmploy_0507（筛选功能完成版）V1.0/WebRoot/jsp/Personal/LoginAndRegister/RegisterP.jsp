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
    
    <title>My JSP 'RegisterP.jsp' starting page</title>
    
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
  <a href="index2.jsp">返回首页</a>
  <h3>个人注册</h3>
   <s:form action="registerC">
        <s:textfield name="pinformation.mailbox" label="邮箱" />
        <s:textfield name="pinformation.password" label="密码" />
        <s:textfield name="pinformation.sex" label="性别" />
        <s:textfield name="pinformation.name" label="姓名" />
        <s:textfield name="pinformation.phone" label="联系方式" />

        <s:submit value="注册"/>
    </s:form>
  </body>
</html>
