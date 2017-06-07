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
    
    <title>My JSP 'updateperson.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
    <!--css-->
  
    <!--jquery-->
    <script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <!--cookie domain-->
    <script type="text/javascript" src="js/cookie.js"></script>
    <script type="text/javascript" src="js/referer_getter.js"></script>
	<script src="js/check.js"></script>

 
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
		margin-right:60px;
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
.file{  right:80px; width:220px ;filter:alpha(opacity:0);} 
     </style>
 </style>
 <script src="js/jquery-1.11.3.js"></script>
 <script>
 $(function(){
 	$("#file").change(function(e){
 	$("#photo").empty();
 	var file = e.target.files[0]||e.dataTransfer.files[0];
 	if(file){
 		var reader = new FileReader();     	
 		reader.onload=function(){
 		$("<img src='"+this.result+"'/>").appendTo("#photo");
 		$("#photo img").css("width","120px");//设置test下的图片宽为30px
		$("#photo img").css("height","149px");//设置test下的图片高为30px
 	 };
 		reader.readAsDataURL(file);
 		}
 	});
 });

 </script>
  </head>
  
  <body>
  
    	<my> <p>编辑资料</p></my>
   <form action="afterupdteperson.action" method="post" enctype="multipart/form-data">
  
    <section class="section brd-btm">
    <div class="right_photowai">
               <span align="center">我的照片</span>
    	 <div class="right_photo" id="photo">
    		<c:choose>
		    	<c:when test="${OnePerson.picture!=null}">
		     		<img class="img" src="personPicture/${OnePerson.picture}" />
		   		</c:when>
			</c:choose>
    	 </div>   	
    	
    	  
    	<input type="file" name="upload" id="file" class="file" > </a>
 
    	<s:fielderror/>
    	 </div>
    	 <div style="margin-left:20%;">
           <table class="text-upper">
           		<tr>
           			<td>姓    名: </td>
           			<td><input type="text" name=" personalinformation.name" value="${OnePerson.name}"></td>
           		</tr>
           		<tr>
           			<td>籍    贯:</td>
           			<td> <input type="text" name=" personalinformation.householdRegister" value="${OnePerson.householdRegister}"></td>
           		</tr>
           		<tr>
           			<td>政治面貌:</td>
           			<td>
           				<select style="background:#F4F5FB;height:30px;" name="personalinformation.politicalStatus" id="personalinformation.politicalStatus"> 
					             <option value="${OnePerson.politicalStatus}">${OnePerson.politicalStatus}</option>
					             <option value="中共党员" check="checked"> 中共党员</option>
					             <option value="预备党员"> 预备党员</option>
					             <option value="共青团员"> 共青团员</option>
					             <option value="群众"> 群众</option>     
					             <option value="其他党派"> 其他党派</option>
					            
					         </select>
           			</td>
           		</tr>
           		<tr>
           			<td>学    历:</td>
           			<td>
           				<select style="background:#F4F5FB;height:30px;" name=" personalinformation.education" id="personalinformation.education"> 
					             <option value="${OnePerson.education}">${OnePerson.education}</option>
					             <option value="博士生及以上">博士生及以上</option>
					             <option value="研究生">研究生</option>
					             <option value="本科">本科</option>
					             <option value="大专">大专</option>
					             <option value="中专">中专</option>     
					             <option value="高中">高中</option>
					             <option value="高中以下">高中以下</option>
					         </select>
           				
           			</td>
           		</tr>
           		<tr>
           			<td>毕业院校:</td>
           			<td> <input type="text" name=" personalinformation.school" value="${OnePerson.school}"></td>
           		</tr>
           		<tr>
           			<td>性    别:</td>
           			
           			<td><input type="text" name=" personalinformation.sex" value="${OnePerson.sex}"></td>
           		</tr>
           		<tr>
           			<td>种    族:</td>
           			<td> <input type="text" name=" personalinformation.nation" value="${OnePerson.nation}"></td>
           		</tr>
           		<tr>
           			<td>电    话:</td>
           			<td> <input type="text" name=" personalinformation.phone" value="${OnePerson.phone}"></td>
           		</tr>
           		<tr>
           			<td>邮    箱:</td>
           			<td><input type="text" name=" personalinformation.mailbox" value="${OnePerson.mailbox}"></td>
           		</tr>
           		<tr>
           			<td>出生日期:</td>
           			<td> <input type="date" name="personalinformation.birth" value="${OnePerson.birth}" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Select date';}"> </td>
           			<%-- <td><input type="text" name=" personalinformation.birth" value="${OnePerson.birth}"></td> --%>
           		</tr>
           		<tr>
           			<td>住    址:</td>
           			<td> <input type="text" name=" personalinformation.address" value="${OnePerson.address}"></td>
           		</tr>
           
           
           </table>
        </div>               
                                 
        <input type="hidden" name="personalinformation.idPersonalInformation" value="${OnePerson.idPersonalInformation}"/>
       		<p align="center"> 
       				<input type="submit" value="确认修改">
       				<input type="button" value="返回" onclick="javascript:window.location.href='jsp/Personal/information/lookperson.jsp'">
       		</p>
        </form>
       
  </body>
</html>
