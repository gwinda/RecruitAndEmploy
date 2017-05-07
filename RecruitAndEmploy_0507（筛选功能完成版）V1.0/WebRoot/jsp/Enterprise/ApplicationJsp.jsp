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
    
    <title>My JSP 'HaveResumeJsp.jsp' starting page</title>
    
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
</style>
 
  </head>

  
  <body>
   <div class="alignright">
  <a href="ApplicationAction.action?opera=all&user=2">全部</a>  
  <a href="ApplicationAction.action?opera=notsee&user=2">未查看</a>
  <a href="ApplicationAction.action?opera=see&user=2">已查看</a>  
  <a href="ApplicationAction.action?opera=invite&user=2">职位邀请</a>  
  <a href="ApplicationAction.action?opera=refuse&user=2">拒绝</a>
  <a href="">已结束</a><br> <hr>
  </div>
     <s:iterator value="#request.applitionlist" id="myapplition" status="status">  
                  简历名称&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <a href="ApplicationAction!lookResumeByR.action?mess=lookOneByER&idResume=<s:property value="#myapplition.idResume"/>&idEnterpriseRecruitemnt=<s:property value="#myapplition.idEnterpriseRecruitment"/>">
  <s:property value="#myapplition.resumename"/></a><br> 
                  申请用户&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <a href=""></a><br> 
                  招聘名称&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <a href=""><s:property value="#myapplition.idEnterpriseRecruitment"/></a><br> 
                  公司名称&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <br>        
                  简历状态&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <s:property value="#myapplition.state"/><br> 
                  投递时间&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <s:property value="#myapplition.time"/> <br> 
                  结束时间&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>          
     <a href="ApplicationAction!lookResumeByR.action?mess=inviteclick&idResume=<s:property value="#myapplition.idResume"/>&idEnterpriseRecruitemnt=<s:property value="#myapplition.idEnterpriseRecruitment"/>">
                 邀请面试</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     <a href="ApplicationAction!lookResumeByR.action?mess=rufuseclick&idResume=<s:property value="#myapplition.idResume"/>&idEnterpriseRecruitemnt=<s:property value="#myapplition.idEnterpriseRecruitment"/>">
                 拒绝</a>            
     <hr>
   
    </s:iterator> 


  </body>
</html>
