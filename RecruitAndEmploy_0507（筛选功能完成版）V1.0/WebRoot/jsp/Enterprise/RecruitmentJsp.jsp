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
.mydiv{float:right;
       height:50px;
       width:120px;
        border-style: solid;
       border-color:  66ccff;       
        text-align:center;
       line-height:50px;
       font-size:24px;
       color: 66ccff;
       font-family:"黑体";
     }
     
     
       mydiv1{float:left;
      
     }
</style>
  </head>
  
  <body>
  

   <div class="alignright">
   <a href="Rec?i=0">全部</a>
     <a href="Rec?i=1">正在进行</a>
       <a href="Rec?i=2">已结束</a></br>
       </div>
        <hr>
        
    <s:iterator value="#session.recruitmentlist" id="re" status="status">  

 <s:if test="#re.isending==1">            
    工作职位:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<B><a href="ApplicationAction!selectRecruit?selectRecruit=<s:property value="#re.IdEnterpriseRecruitment" />"><s:property value="#re.name" /></a></B></br>
    </s:if>   
    <s:elseif test="#re.isending==2">
    工作职位:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<s:property value="#re.name" /></br>  
      <div class="mydiv"><B>已结束</B></div> 
    </s:elseif>
     工作分类:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<s:property value="#re.position" /></br>
     职位要求:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<s:property value="#re.requirement" /></br>
     工作地点:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<s:property value="#re.workingPlace" /></br>
     工作月薪:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<s:property value="#re.salary" /></br>
     招聘人数:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<s:property value="#re.number" /></br>
     开始时间:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<s:property value="#re.startTime" /></br>
     结束时间:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<s:property value="#re.endTime" /></br>
     申请人数:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<B><s:property value="#re.n" /></B></br>
   <!--  <B>  <a href="Rec!setEnd?endid=<s:property value="#re.IdEnterpriseRecruitment" />">结束</a></B> --> 
  <hr>
  </div>
 
    </s:iterator>
   
    
  </body>
</html>
