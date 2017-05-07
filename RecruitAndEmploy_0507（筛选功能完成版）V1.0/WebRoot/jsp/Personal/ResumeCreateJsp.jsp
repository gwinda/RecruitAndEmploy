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

<title>My JSP 'ResumeJsp.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style>
input[type="text"]{
       width:250px;
       height:35px;
       margin-top: 5px;
	
}
input[type="submit"]{
       
       width:80px;
       height:35px;
       margin-top: 10px;
}
</style>
</head>

<body>


	<form action="re!createResume.action" method="post">
		<input type="hidden" name="mess" value="create"> 简历名称： <input
			type="text" name="RName"><br> 兴趣爱好： <input type="text"
			name="hobby"><br> 工作经验： <input type="text"
			name="experience"><br> 获奖情况： <input type="text"
			name="award"><br> 应聘职位： <input type="text" name="job"><br>
		工作地点： <input type="text" name="workplace"><br> <input
			type="submit" value="提交">

	</form>
</body>
</html>
