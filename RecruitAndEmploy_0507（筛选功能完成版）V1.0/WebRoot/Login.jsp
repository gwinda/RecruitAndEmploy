<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>

  <head>
    <base href="<%=basePath%>">
    
    <title>登录界面</title>
    
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
body{
	padding:0;
	margin:0;		
	background:url("img/IT.jpg");
	background-size:100%;
	font-family:"黑体";	
	font-weight:bold;
	color:black;
	}
	
#top{
	width:100%;
	height:30px;
	
	
	}
#middle{
	width:40%;	
	margin:0 auto;
	height:400px;	
	}
#middle_center{
	width:100%;
	margin-left:80px;		
	border-spacing:2px;
	background-color: rgba(0,0, 0,0.1 );
	border-radius:20px;

}
#button{
	font-size:16px;
	text-align:center;
	display:block;margin:0 auto;
}
 .form{
font-size:72px;
}
.remmber{
	margin-left:40px;
}
table{
	margin:0 auto;
}
  #bottom_footer{
  margin-top:200px;
  }
</style>
<script src="js/jquery-1.11.3.js"></script>
 <script language="javascript" type="text/javascript" src="js/check.js"></script>
	
	
  </head>
  
  <body>
    ${message}
    <%session.removeAttribute("message") ;%>
    <script type="text/javascript" src="js/vsoheader.js" charset="UTF-8"></script>
<div id="top">
	<h1><a href="index2.jsp">返回首页</a></h1>
</div>

<div id="middle">
	<div id="middle_center" >
		<h1  align="center">登录</h1>
		<form class="form" name="form" method="post" action="loginC!login.action" onsubmit="return turnto();" >
		<br>
	
		<table border="0" align="center" >
		
		<tr>
			<td>邮箱      :
			<input type="text" name="number" id="number" placeholder="请输入您的账号"  /></td>
			<td><font id="num_fail" ></font></td>
		</tr>
		
		<tr>
			<td>密码         : <input type="password" id="password" name="password" /></td>
			<td><font id="psd1_wrong" ></font></td>
		</tr>
		<tr align="center">
			<td><label><input id="ID_type" name="ID_type" type="radio" value="person"  checked="checked" />个人</label> 
			<label><input id="ID_type" name="ID_type" type="radio" value="company" />企业</label> </td>
			
		</tr>
		<tr>
			<td>验证码:
			<input id="veryCode" name="veryCode" type="text" /> </td>
       			<td> <img src="SecurityCodeImageAction.action" id="Verify"  style="cursor:hand;" alt="看不清，换一张"/></td>
        					
		</tr>	
		<tr>
	            <td></td>
	            <td><div id="info"></div> </td>
	    </tr>   
		<tr align="center">
			<td  class="remmber"><input type="checkbox" name="remberme" value="记住我">记住我</td> 			
		</tr>
		
		</table>
			 <span id="button" >
			<input type="submit" value="登录" onclick="return checklogin()" />
			<input type="reset" value="重置" /></span>
			<br>		
			<a href="dd.jsp"  style="font-family:'楷体';border-line:none;align:'center';font-size:14pt">找回密码</a>
		    <input type="hidden" value="bookingbeforeLogin" name="type">
		   	<div><a href="jsp/Personal/LoginAndRegister/Register.jsp" style="font-family:'楷体';border-line:none;align:'center';font-size:14pt">还没注册？点我(用户)</a></div>
		   	<div><a href="jsp/Enterprise/LoginAndRegister/RegisterR.jsp" style="font-family:'楷体';border-line:none;align:'center';font-size:14pt">还没注册？点我(企业)</a></div>
		</form>
		
	</div>
	
</div>

<div id="down">
</div>
 <div id="bottom_footer">
 <script type="text/javascript" src="js/vsofooter.js"></script>
<!--add experience-->
<script type="text/javascript" src="js/experience.js"></script>
</div>   
  </body>
</html>
