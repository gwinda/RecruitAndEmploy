<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'RecruitmentJsp.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	 <link type="text/css" rel="stylesheet" href="css/common.css?v=20150807"/>
    <!--css-->
    <link type="text/css" rel="stylesheet" href="css/common.css?v=20150807"/>
    <!--css-->
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="css/rc_index.css">
    <!--jquery-->
    <script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <!--cookie domain-->
    <script type="text/javascript" src="js/cookie.js"></script>
    <script type="text/javascript" src="js/referer_getter.js"></script>
<style>
.alignright{text-align:right} 
img{  margin-left: 400px;}

</style>
  </head>
  
  <body>
  <BR><BR><BR>
 <tr>

    <s:iterator value="#request.einformation" id="ei" status="status">  
                
    <B style="font-size:28px"><s:property value="#ei.name" /></B></br></br></br>
     联系方式:&nbsp;&nbsp;<s:property value="#ei.phone" /><img width="150" height="100"  src="uploadpic/<s:property value="#ei.trademark" />"></img></br></br>
     邮箱帐号:&nbsp;&nbsp;<s:property value="#ei.mailbox" /></br></br>
     主页地址:&nbsp;&nbsp;<s:property value="#ei.homepage" /></br></br>
     企业地址:&nbsp;&nbsp;<s:property value="#ei.address" /></br></br>
     <!--  企业商标:&nbsp;&nbsp;<s:property value="#ei.trademark" /></br></br>
     营业执照:&nbsp;&nbsp;<s:property value="#ei.BusinessLicense" /></br></br>-->
 
  <hr>
   </s:iterator>
   </tr>
    <B style="font-size:24px">公司介绍</B> &nbsp; &nbsp; &nbsp; &nbsp; <!--  <input type="Button"  value="修改" />--></br></br></br>
       <textarea disabled="disabled" width="400" name="eduhistory" cols="130" rows="15" align="center">1.示例文本&#10;1.示例文本&#10;1.示例文本&#10;1.示例文本&#10;1.示例文本&#10;1.示例文本&#10;1.示例文本&#10;1.示例文本&#10;1.示例文本&#10;1.示例文本&#10;1.示例文本&#10;1.示例文本&#10;1.示例文本&#10;1.示例文本&#10;1.示例文本&#10;1.示例文本&#10;1.示例文本&#10;1.示例文本&#10;1.示例文本&#10;1.示例文本&#10;1.示例文本&#10;1.示例文本&#10;1.示例文本&#10;1.示例文本&#10;1.示例文本&#10;1.示例文本&#10;1.示例文本&#10;1.示例文本&#10;1.示例文本&#10;1.示例文本&#10;1.示例文本&#10;1.示例文本&#10;1.示例文本&#10;1.示例文本&#10;1.示例文本&#10;1.示例文本&#10;1.示例文本&#10;1.示例文本&#10;1.示例文本&#10;</textarea>
    
  </body>
</html>