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
	background-size:100%;
	color:black;
	}
	
#top{
	width:100%;
	height:30px;
}
#middle{
	padding-top:32px;
	width:30%;	
	margin-left:32%;	
	height:300px;
	
	}
#middle_center{
	width:100%;
	margin-left:50px;		
	border-spacing:2px;
	background-color: rgba(82, 117, 212, 0.2);
	border-radius:10px;
 	box-shadow:3px 3px 3px 3px;  

}
#button{
	font-size:16px;
	text-align:center;
	display:block;
	margin:0 auto;
}
 .form{
font-size:25px;
}
.remmber{
	padding-left:60px;
	
}
table{
	margin:0 auto;
	margin-bottom:11px;
}
  #bottom_footer{
  margin-top:200px;
  }
  td{
  	padding: 3px;
  }
  .a_href{
  	padding-left:57%;
  }
 .mytop{
       padding-bottom:40px;
       border-bottom: 3px solid #4b4b4b;
       border-top: 0px solid #4b4b4b;
       height:80px;
       line-height:50px;   
       margin-left: 15%;
       margin-right: 15%;
       color:#4b4b4b
 }
</style>
<script src="js/jquery-1.11.3.js"></script>
 <script language="javascript" type="text/javascript" src="js/check.js"></script>
	
	
  </head>
  
  <body>
    ${message}
    <%session.removeAttribute("message") ;%>
    <script type="text/javascript" src="js/vsoheader.js" charset="UTF-8"></script>

<div class="mytop" >
<font size=15><B>珠海招聘网</B></font>
简历多、覆盖广、互动强
</div>

<div id="middle">
	<div id="middle_center" >
		
		<form class="form" name="form" method="post" action="loginC!login.action" onsubmit="return turnto();" >
	
		<table border="0" align="center"  cellpadding="10">
		
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
			<td><input id="ID_type" name="ID_type" type="radio" value="person"  checked="checked" />个人
			<input id="ID_type" name="ID_type" type="radio" value="company" />企业 </td>
			
		</tr>
		<tr>
			<td>验证码:
			<input id="veryCode" name="veryCode" type="text" /> </td>
       			<td> <img src="SecurityCodeImageAction.action" id="Verify"  style="cursor:hand;" alt="看不清，换一张"/></td>
        					
		</tr>
		<br>	
		<tr>
	            <td></td>
	            <td><div id="info"></div> </td>
	    </tr>   
		<tr align="center">
			<td  class="remmber"><input type="checkbox" name="remberme" value="记住我">记住我 &nbsp;
			<input type="checkbox" name="remberme" value="自动登录">自动登录</td> 			
		</tr>
		
		</table>
			 <span id="button" >
			<input type="submit" value="登录" onclick="return checklogin()" />
			<input type="reset" value="重置" /></span>
			<br>
			<div class="a_href">		
			<a href="dd.jsp"  style="font-family:'楷体';border-line:none;align:'center';font-size:12pt">找回密码</a>
		    <input type="hidden" value="bookingbeforeLogin" name="type">
		   	<div><a href="jsp/Personal/LoginAndRegister/Register.jsp" style="font-family:'楷体';border-line:none;align:'center';font-size:12pt">还没注册？点我(用户)</a>
		   <a href="jsp/Enterprise/LoginAndRegister/RegisterR.jsp" style="font-family:'楷体';border-line:none;align:'center';font-size:12pt">还没注册？点我(企业)</a></div>
			</div>
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
