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
    
    <title>My JSP 'Register.jsp' starting page</title>
    
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
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="css/rc_index.css">
    <!--jquery-->
    <script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <!--cookie domain-->
    <script type="text/javascript" src="js/cookie.js"></script>
    <script type="text/javascript" src="js/referer_getter.js"></script>
  <style type="text/css">
.mytop{
       padding-bottom:40px;
       border-bottom: 3px solid #4b4b4b;
       border-top: 0px solid #4b4b4b;
       height:150px;
       margin-top: 10px;
       line-height:150px;   
       margin-left: 15%;
       margin-right: 15%;
       color:#4b4b4b}
  #forms{
  	margin:0 auto;
	margin-top: 60px;
	width:30%;
	margin-left: 20%;
	 float:left ;
  }
  .formsright{
  margin-top: 60px;
  float:right ;
  width:30%;
  max-width:427px;
  margin-right: 20%;
  background:#4b4b4b; 
  height:239px;
  color:#FFF;
  font-family:"Microsoft YaHei",微软雅黑,"MicrosoftJhengHei",华文细黑,STHeiti,MingLiu
  }
  	.label{
  		color:black;
  	}
  	#bottom_footer{
  		margin-top:750px;
  	}
  	tr{
       margin-top: 5px;}
       input[type="text"]{
       width:250px;
       height:35px;
       margin-top: 5px;
	
}
 input[type="file"]{
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
<script type="text/javascript" src="js/vsoheader.js" charset="UTF-8"></script>
<div class="mytop">
<font size=15><B>珠海招聘网</B></font>
简历多、覆盖广、互动强
</div>

<div id="forms">
<s:form action="RegisterR" method="post" enctype="multipart/form-data">
		<s:textfield name="einformation.mailbox" label="邮箱" />
		<s:textfield name="einformation.password" label="密码" />
		<s:textfield name="einformation.address" label="地址" />
		<s:textfield name="einformation.name" label="公司名" />
		<s:textfield name="einformation.phone" label="联系方式" />
		<s:textfield name="einformation.homepage" label="主页" />
		<s:textfield name="einformation.trademark" label="商标" value="0" style="display: none;"/>	
		<s:file  name="upload1" id="file" />
        <s:textfield name="einformation.BusinessLicense" value="0" label="营业执照" style="display: none;" />
		<s:file  name="upload2" id="file"  />
		<s:submit value="注册" />
	</s:form>
	
</div>
<div class="formsright">
<img src="images/login/login.png">
</div>
<div id="bottom_footer">
 <script type="text/javascript" src="js/vsofooter.js"></script>
<!--add experience-->
<script type="text/javascript" src="js/experience.js"></script>
</div>
  </body>
   
</html>
