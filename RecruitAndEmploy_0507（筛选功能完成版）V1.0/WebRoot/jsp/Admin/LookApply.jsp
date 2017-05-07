<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'LookApply.jsp' starting page</title>
    
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
    <s:iterator value="#request.einformation" id="ei" status="status">  
                
  name:<s:property value="#ei.name" /></br>
  phone:<s:property value="#ei.phone"/></br>
  mailbox:<s:property value="#ei.mailbox" /></br>
  address:<s:property value="#ei.address" /></br>
     homepage:<s:property value="#ei.homepage" /></br>
    trademark:<s:property value="#ei.trademark" /></br>

     BusinessLicense:<s:property value="#ei.BusinessLicense" /></br>
     <B>  <a href="Pass?passid=<s:property value="#ei.id" />">通过</a></B><br>
  <hr>
   
    </s:iterator>
  </body>
</html>
