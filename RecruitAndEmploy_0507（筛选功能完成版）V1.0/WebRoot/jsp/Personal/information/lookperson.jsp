<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'lookperson.jsp' starting page</title>
    
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
	
     <link rel="stylesheet" href="resume/js/style.css" >
     <style type="text/css">
     body{
     	background:white;
     	font-size:15px;
     	     }
     select{
     	margin-top:4px;
     }
 	input[type=text]{
 		border:1px solid black;
 		width:200px;
 		height:25px;
 		
 	}
 my	P {
	background: #A77C47;
	width: 150px;
	height: 35px;
	line-height: 35px;
	text-align: center;
	font-size: 13px;
	color: white;
 }
 	.right_photowai{
	 position:relative;
		display:block;
		float:right;
		margin-right:80px;
		width:140px;
		height:200px;
	} 
     .right_photo{
	border:1px black solid;
	display:block;
	float:right;	
	width:120px;
	height:150px;
	background:url("resume/img/nop.jpg");
	background-size:100%;	
	}  
.img{
		 width:120px;
		  height:149px;
	} 
	dt{
		font-size:20px;
	}
     </style>
  </head>  
  <body>
  <my> <p>基本资料</p></my>
   <a style="margin-left:20%;" href="beforeupdateperson!look.action?idPerson=${OnePerson.idPersonalInformation}"><font style="font-size:16px; color:blue;">编辑基本信息</font></a>
 		<div class="right_photo">
		 	<c:choose>
		    	<c:when test="${OnePerson.picture!=null}">
		     		<img class="img"  src="personPicture/${OnePerson.picture}" />
		   		</c:when>
		    	<c:otherwise>
		    		 <a href="beforeupdateperson!look.action?idPerson=${OnePerson.idPersonalInformation}" class="right_photo"></a>
		   		</c:otherwise>
			</c:choose>
		</div>	
			
    	<div style="margin-left:27%;color:#796B59;">
                   <br>
                        <dt class="text-upper">姓    名:&nbsp;${OnePerson.name}</dt>
                        
                        
                        <dt class="text-upper">籍    贯:&nbsp;${OnePerson.householdRegister}</dt>
                       
                        
                        <dt class="text-upper">政治面貌:&nbsp;${OnePerson.politicalStatus}</dt>
                       

                        <dt class="text-upper">学    历:&nbsp;${OnePerson.education}</dt>
   

                        <dt class="text-upper">毕业院校:&nbsp;${OnePerson.school}</dt>

                       <dt class="text-upper"> 住    址:&nbsp;${OnePerson.address}</dt>
                        <dt class="text-upper">性    别:&nbsp;${OnePerson.sex}</dt>

                        
                        <dt class="text-upper">种    族:&nbsp;${OnePerson.nation}</dt>


                        <dt class="text-upper">电    话:&nbsp;${OnePerson.phone}</dt>


                        <dt class="text-upper">邮    箱:&nbsp;${OnePerson.mailbox}</dt>

                       <dt class="text-upper">出生日期:&nbsp;${OnePerson.birth}</dt>
     

                                            
               </dl>
               </div>
                   
  </body>
</html>
