<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@page 
import="java.awt.image.BufferedImage"
import="com.sun.xml.internal.ws.util.StringUtils"
import="javax.imageio.*"
 import="java.io.IOException"
 import="java.io.File"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>注册界面</title>
    
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
	<script src="js/check.js"></script>
	<style type="text/css">
.body{
	padding:0;
	margin:0;
	background:url("img/want.jpg");
	background-size:100%;
	}
.top{	
	width:100%;
	height:100px;
		
	}
.middle{
	padding-top:2px;
	margin-top:8px;
	width:100%;
	height:500px;		
	}
.center{
	
	margin:0 auto;
	width:50%;
	height:100%;	
	font-size:18pt;
	border-spacing:2px;	 
	font-family:"微软雅黑";
	
	}
table{
	margin-left:60px;
	

}
.mytop{
       padding-bottom:40px;
       border-bottom: 3px solid #4b4b4b;
       border-top: 0px solid #4b4b4b;
       height:150px;
       ;
       line-height:150px;   
       margin-left: 15%;
       margin-right: 15%;
       color:#4b4b4b
 }
input[type=submit] {
	font-size:16px;
}
input[type=reset] {
	font-size:16px;
}
input[type=text]{
       margin-top: 5px;
       width:250px;
       height:35px;
       margin-top: 5px;
	
}
input[type=password]{
       margin-top: 5px;
       width:250px;
       height:35px;
       margin-top: 5px;
	
}
	#bottom_footer{
  		margin-top:200px;
  	}

</style>

<script src="js/jquery-1.11.3.js"></script>
 <script language="javascript" type="text/javascript" src="js/check.js"></script>

 </head>
  
<body class="body">
    <script type="text/javascript" src="js/vsoheader.js" charset="UTF-8"></script>
 <div>
  ${message}
  <%session.removeAttribute("message") ;%>
</div>
<div class="mytop">
<font size=15><B>珠海招聘网</B></font>
简历多、覆盖广、互动强<font size="4">-->用户注册</font>
</div>
<div class="middle" >
	<div class="center">
        
        <br />
        <form name="form1" action="registerC!register.action" method="post"  onsubmit="return check()" >
        	<table border="0"  >
        	<tr>
           		<td> *Email  : </td>  
             	<td><input type="text"  name="mailbox" id="mailbox" height="22"   placeholder="格式:XXXXX@XX.com(登录账号) "/></td>
            	<td><div id="email_wrong"></div></td>
            </tr>
        	
            <tr>
            	<td> *真实姓名  :</td>  
            	<td><input type="text"  name="surname"  id="surname" height="22"   /></td>
            	<td><div id="surname_wrong"></div></td>
            </tr>
            <tr>
           		<td> *性别  : </td>  
             	<td><input type="radio"  name="sex" id="sex" value="男" checked="checked" />男
             	 <input type="radio"  name="sex" id="sex" value="女" />女</td>
            	<td><div id="sex_wrong"></div></td>
            </tr>
           	<tr>
            	<td>*手机号码: </td> 
            	<td><input type="text"  name="number"  id ="number" height="22" /></td>
            	<td><div id="num_fail"></div></td>
            </tr>     
           
            <tr>
            	<td>*密码 : </td>
           	    <td><input type="password" name="password" id="password" height="22"  /></td>
            	<td><div id="psd1_wrong"></div></td>
            </tr>
            <tr>
           		<td> *确认密码：</td>
           		<td> <input type="password" name="pwd2" id="pwd2" height="22"   placeholder="再次输入亲的密码"/></td>
             	<td><div id="psd2_wrong"></div></td>
             </tr>
            <tr>
            <td> *验证码 : </td>  
            <td><input id="veryCode" name="veryCode" type="text" /> </td>
       				<td> <img src="SecurityCodeImageAction.action" id="Verify"  style="cursor:hand;" alt="看不清，换一张"/></td>	
            </tr>
            <tr>
	            <td></td>
	            <td><div id="info"></div> </td></tr>
        	</table>
          
           <p align="center"><input type="submit" value="确认注册" style="height:35px;width:80px;"  />
            <input type="reset" value="重置" style="height:35px;width:80px;"/></p>
            <br/>        
             <p align="left"><a href="Login.jsp"><font face="宋体" size="4">我不注册了，回到登录窗口</font></a></p>         
        </form>
         
 </div>


</div>
<div class="bottom">
</div>	
 <div id="bottom_footer">
 <script type="text/javascript" src="js/vsofooter.js"></script>
<!--add experience-->
<script type="text/javascript" src="js/experience.js"></script>
</body>
</html>


