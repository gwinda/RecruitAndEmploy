<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="/struts-tags" prefix="s"%>

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
<style>
.alignright {
	text-align: right
}
</style>

</head>


<body>
	<div class="alignright">
		<a href="ApplicationAction.action?opera=all&user=1">全部</a> <a
			href="ApplicationAction.action?opera=notsee&user=1">未查看</a> <a
			href="ApplicationAction.action?opera=see&user=1">已查看</a> <a
			href="ApplicationAction.action?opera=invite&user=1">职位邀请</a> <a
			href="ApplicationAction.action?opera=refuse&user=1">拒绝</a>
		<hr>
	</div>
	<s:iterator value="#request.applitionlist" id="myapplition" status="status">  
                  简历名称：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="ApplicationAction!lookResumeByR.action?mess=lookOne&idResume=<s:property value="#myapplition.idResume"/>"><s:property value="#myapplition.resumename" /> </a>
		<br> 
                  招聘名称：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<s:property value="#myapplition.recruitname" /> </a>
		<br> 
                  公司名称：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<A href="Ei?eiid=<s:property
			value="#myapplition.eiid" />"><s:property
			value="#myapplition.ename" /></A>
		<br>        
                  简历状态：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<B><s:property value="#myapplition.state" /> </B>
		<br> 
                  投递时间：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<s:property value="#myapplition.time" />
		<br> 
                  结束时间：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<s:property value="#myapplition.endtime" />
		<br>
		<s:if test="#myapplition.state=='邀请'">
		<B>面试时间：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<s:property value="#myapplition.remark" /> </B>
		<br>
		</s:if>
		<s:elseif test="#myapplition.state=='拒绝'">
		<B> 拒绝理由：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<s:property value="#myapplition.remark" /> </B>
		<br>
		</s:elseif>
		<s:else></s:else>
		<hr>

	</s:iterator>
</body>
</html>
