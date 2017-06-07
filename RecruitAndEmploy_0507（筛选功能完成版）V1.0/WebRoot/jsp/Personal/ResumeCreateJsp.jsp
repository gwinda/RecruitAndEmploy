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
       margin-top: 9px;
       
	
}
textarea{
    width:250px;
	margin-top: 10px;
}
input[type="submit"]{
       
       width:80px;
       height:35px;
       margin-top: 10px;
}
select{
 height:35px;
}
</style>
</head>

<body>


	<form action="re!createResume.action" method="post">
		<input type="hidden" name="mess" value="create">
简历名称：<input type="text" name="RName"><br> 
兴趣爱好：<textarea name="hobby" cols="25" rows="4"></textarea><br> 
工作经验：<textarea  name="experience" cols="25" rows="4"></textarea><br>
获奖情况：<textarea name="award" cols="25" rows="4"></textarea><br>
应聘职位：<input type="text" name="job" cols="25" rows="4"><br><br>
工作地点：<select name="workplace" id="workplace"> 
	            <option value="null">不限</option>
	             <option value="香洲区"> 香洲区</option>
	              <option value="金湾区">  金湾区</option>
	               <option value="斗门区"> 斗门区</option>
	                <option value="高新区">高新区</option>
	                 <option value="万山区"> 万山区</option>
	                  <option value="高栏港经济区"> 高栏港经济区</option>
	                   <option value="保税区"> 保税区</option>	            
	               	    <option value=" 横琴新区"> 横琴新区</option>	               
      		 </select>
			<br> <input type="submit" value="提交">

	</form>
</body>
</html>
