<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'RecruitmentJsp.jsp' starting page</title>

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
<link type="text/css" rel="stylesheet" href="css/common.css?v=20150807" />
<!--css-->
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="css/rc_index.css">
<!--jquery-->
<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<!--cookie domain-->
<script type="text/javascript" charset="utf-8"
	src="http://account.vsochina.com/static/js/global_nav.js?t=20150824"></script>
<script type="text/javascript" src="js/cookie.js"></script>
<script type="text/javascript" src="js/referer_getter.js"></script>
<script type="text/javascript" src="DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="DatePicker/calendar"></script>
<script type="text/javascript">
  $(document).ready(function(){
  //	$("#selectkind").click(function(){
		$.ajax({  //异步刷新，可不要
                url :"Lookkind1.action",  //后台处理程序          
                type:"post",    //数据发送方式  
                async:false,  
                dataType:"json",   //接受数据格式             
                error: function(){  
                  alert("error");
             	},  
  				success: function(data){  
  				 	$("#selectkind").empty();			
	  				var d=eval(data);
	  				var obj = eval(data["qq"] ); 			 				
	  				$.each(obj,function(i,value) {    				  		
	                     $("#selectkind").append("<option value=" + value.id +" >" + value.name + "</option>");    
	                });                         
            }   
      	 });       	 
    	//});	
    $("#selectkind").change(function(){
		var kid=$("#selectkind").val();
		//alert(kid);
		$.ajax({  //异步刷新，可不要
                url :"Lookposition.action?kid="+kid,  //后台处理程序                 
                type:"get",    //数据发送方式  
                async:false,  
                dataType:"json",   //接受数据格式        
                 error: function(){  
                  alert("error");
              },  
                success:function(data){ 
                	$("#selectposition").empty();
                	var json=eval(data["Joblist"]);
                	//alert(json);
					$.each(json,function(i,value){ 
						$("#selectposition").append("<option value=" + value.id +" >" + value.name + "</option>");     
				}) ;			
    }
    });    				
	});				
});

</script>
<script>
	function zhuxiao() {
		if (confirm("你确信要注销吗？")) {
			//如果是true ，那么就把页面转向thcjp.cnblogs.com	 
			alert("ok");
			deleteCookie("userName", "/", "");//删除cookie
			window.location.href = "cancelC!cancel.action";

			//window.location.replace("index2.jsp");
		} else { //否则说明下了，赫赫	 

		}
	}
</script>
<script>
function openLogin(){
   document.getElementById("win").style.display="";
}
function closeLogin(){
   document.getElementById("win").style.display="none";
}
function openLogin1(){
   document.getElementById("win1").style.display="";
}
function closeLogin1(){
   document.getElementById("win1").style.display="none";
}
function openLogin2(){
   document.getElementById("win2").style.display="";
}
function closeLogin2(){
   document.getElementById("win2").style.display="none";
}
</script>
<style>
.alignright {
	text-align: left
}

.mydiv {
	float: right;
	height: 40px;
	width: 80px;
	border-style: solid;
	border-width: 1px;
	border-color: #6c6;
	text-align: center;
	line-height: 40px;
	font-size: 15px;
	color: #6c6;
	margin-right: 30px;
}

P {
	background: #6f6;
	width: 150px;
	height: 35px;
	line-height: 35px;
	text-align: center;
	font-size: 13px;
	color: white;
}

my P {
	background: #fff;
	width: 150px;
	height: 35px;
	line-height: 35px;
	text-align: left;
	font-size: 13px;
	color: #000;
}

table {
    width:100%;
    margin-top: 20px;
	padding-left: 5px;
}

td {
	padding-right: 20px;
	padding-left: 20px;
	padding-top: 10px;
	padding-bottom: 10px;
	margin-right: 30px;
	font-size:13px;
}

mydiv1 {
	float: left;
}

hr {
	height: 1px;
	border: none;
	border-top: 1px solid #6c6 ;
	width: 95%
}
body{
padding-left: 15%;
	padding-right: 15%;
}
.alignright {
	text-align: left;
}

.alignleft {
	float: left;
}

.vso-copyright-wrap {
	margin-top: 25px;
}

input[type="date"]{
       width:250px;
       height:35px;
       margin-top: 5px;
	
}
select{
       width:125px;
       height:35px;
       margin-top: 5px;
	
}
my select{
       width:250px;
       height:35px;
       margin-top: 5px;
	
}
textarea{
       width:250px;
       height:70px;
       margin-top: 5px;
	
}
input[type="submit"]{
     
       width:80px;
       height:35px;
       margin-top: 10px;
}

input[type="button"] {
	width: 56px;
	height: 18px;
	margin-left: 11px;
}

my input[type="button"] {
	width: 56px;
	height: 22px;
	margin-left: 5px;
}

my1 input[type="text"] {
	width: 80px;
	height: 18px;
	margin-bottom: 40px;
}
my input[type="text"]{
       width:250px;
       height:35px;
       margin-top: 5px;
	
}

my1 input[type="submit"] {
	width: 36px;
	height: 18px;
	margin-left: 5px;
}

P {
	background: #6f6;
	width: 150px;
	height: 35px;
	line-height: 35px;
	text-align: center;
	font-size: 13px;
	color: white;
}

hr {
	height: 1px;
	border: none;
	border-top: 1px solid #cffcff;
	width: 75%
}
body{
padding-left:15%;
padding-right:15%}

table {
	padding-left: 5px;
}

td {
	padding-left: 20px;
	margin-right: 30px;
	font-size: 13px;
}
.m-header-top {
	width: 100%;
	min-width: 500px;
}
.m-header-top-bg: {
	position: absolute;
	width: 100%;
	height: 100%;
	z-index: -1;
	background-color: #4b4b4b;
	opacity: 90;
	filter: alpha(opacity = 90);
	-moz-opacity: 0.9;
	-webkit-opacity: 0.9;
	opacity: 0.9;
	background-color: #ffffff;
	background-color: #ffffff;
	color: #000;
}

.m-header-top {
	background: #ffffff;
	color: #000;
}

.row {
	margin: 0 12px;
	margin-right: 15%;
	margin-left: 15%;
}

.m-warp {
	width: 100%;
}

.m-header-top .m-header-top-bg {
	position: absolute;
	width: 100%;
	height: 100%;
	z-index: -1;
	background-color: #ffffff;
	opacity: 90;
	filter: alpha(opacity = 90);
	-moz-opacity: 0.9;
	-webkit-opacity: 0.9;
	opacity: 0.9;
}

.nav-down cur {
	
}

.nav-down {
	background-color: #fff;
}

.m-header-top a.m-orange-bg {
	background: #fff;
}
.mytop {
	width: 100%;
	height: 100px;
	background: #ddd;
}
.addiv{text-align:right;width: 10%; height: 200px; position: fixed; top: 170px;opacity:1;background: #ddd;
margin-left: 60%;}
.addiv1{text-align:right;width: 10%; height: 200px; position: fixed; top: 400px;opacity:1;background: #ddd;
margin-left: 60%;}
</style>
<STYLE TYPE="text/css">
</style>
</head>

<body>
	<div id="append_parent"></div>

	<div class="m-header-top">

		<div class="m-header-top-bg"></div>

		<div class="m-warp">

			<div class="row">

				<ul class="m-header-top-l">
					<li><a href="index2.jsp"><font color="#000">首页</font>
					</a>
					</li>
					</li>
					<li></li>
				</ul>
				<ul class="m-header-top-r">		
              	已登录    
                <li class="nav-down">

								<div class="m-header-top-down-bg"></div> 我的
								<div class="m-header-top-down w-116">

									<div class="m-header-top-down-c-bg"></div>

									<ul class="m-location-ul">
										<li><a target="_blank"> <a href="Ei"
												target="rightlook">我的信息</a></font> </a></li>
										<li><a target="_blank"> <font color="white"><a
													href="javascript:openLogin();"
													target="rightlook" target="_blank">发布招聘</a>
											</font> </a></li>
										<li><a target="_blank"
											<a href="Rec?i=1" target="rightlook">查看招聘</a></a>
										</li>
										<li><a target="_blank"
											<a href="http://localhost:8080/RecruitAndEmploy/EcollectionClass" target="rightlook">收藏夹</a></a>
										</li>
										<li><a target="_blank"
											<a href="ApplicationAction.action?opera=notsee&user=2" target="rightlook">查看已投递简历</a></a>
									</ul>
								</div></li>
							<a class="m-orange-bg" onclick="zhuxiao()"><font
								color="#000">注销</font>
							</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<br>
<div class="mytop"><img src="personPicture/j.jpg" width="100%" height="100%"></div>
	<div class="alignright">
		<BR> <a href="Rec?i=0">全部</a>&#12288; <a href="Rec?i=1">正在进行</a>&#12288;
		<a href="Rec?i=2">已结束</a>&#12288;</br> </br>
	</div>
	<font color="red">(当结束时间到了系统会自动结束您的招聘，您也可以选择提前结束)</font><BR><BR>
	<s:iterator value="#session.recruitmentlist" id="re" status="status">
		<s:if test="#re.isending==1">
		</s:if>
		<s:elseif test="#re.isending==2">
			<!-- <div class="mydiv">
				<B>已结束</B>
			</div>-->
		</s:elseif>
		<!--工作职位:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<B><s:property
					value="#re.name" />
		</B>
		</br>
     工作分类:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<s:property
			value="#re.position" />
		</br>-->
		<!--职位要求:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<s:property
			value="#re.requirement" />
		</br>
     工作地点:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<s:property
			value="#re.workingPlace" />
		</br>
     工作月薪:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<s:property
			value="#re.salary" />
		</br>
     招聘人数:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<s:property
			value="#re.number" />
		</br>
     开始时间:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<s:property
			value="#re.startTime" />
		</br>
     结束时间:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<s:property
			value="#re.endTime" />
		</br>
     申请人数:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
			href="ApplicationAction!selectRecruit?selectRecruit=<s:property value="#re.IdEnterpriseRecruitment" />"><B><s:property
				value="#re.n" />-->
                <s:if test="#re.isending==1">
                <table>
				</s:if>
				<s:elseif test="#re.isending==2">
			    <table style="opacity: 0.65;">
		        </s:elseif>
		
			
			</MY>
			<tr>
			<td rowspan="2" width="200px"><MY>
		<B>
				<a href="lookRecuriment!lookonejob.action?id=<s:property
			value="#re.idEnterpriseRecruitment" />&idEnterpriseInformation=<s:property
			value="#re.idEnterpriseInformation" /> " target="view_window"><s:property value="#re.name" /></a>
				<s:if test="#re.isending==1">
				</s:if>
				<s:elseif test="#re.isending==2">
			   <font color="red"> (已结束)</font>
		        </s:elseif>
		        </B>
			</td>
				<td>申请人数</td>
				<td>招聘数</td>
				<td>结束时间</td>
				<s:if test="#re.isending==1">
					<td rowspan="2"> <B><a href="Rec!setEnd?endid=<s:property value="#re.IdEnterpriseRecruitment" />">提前结束</a></B></td>
				</s:if>	
				<s:else>
				<td rowspan="2">&#12288;&#12288;&#12288;&#12288;</td>
				</s:else>	
			</tr>
			<tr>
			
				<td><B><a
					href="ApplicationAction!selectRecruit?selectRecruit=<s:property value="#re.IdEnterpriseRecruitment" />">
						<s:property value="#re.n" />
				</a></B></td>
				<td><s:property value="#re.number" /></td>
				<td><s:property value="#re.endTime" /></td>
			</tr>
		</table>
		<!--  <B>  <a href="Rec!setEnd?endid=<s:property value="#re.IdEnterpriseRecruitment" />">结束</a></B> -->
<hr>
		</div>
		

	</s:iterator>
<div id=win
		style="display:none; POSITION:absolute; left:50%; top:50%; width:600px; height:500px; margin-left:-300px; margin-top:-200px; border:1px solid #888; background-color:#edf; text-align:center">
		${R}
    <form name="form1" method="post" action="Recc">
    <br><br>
	      职位名称：
	      <my><input type="text" name="name"/></my><br>
	   <!--  <input type="text" name="name"><br>   -->
	 
	     就职要求：  
	     <textarea rows="3" cols="20" name="requirement"></textarea>
	     <br>
	    <!-- <input type="text" name="requirement"><br> -->
	  <!--   开始时间： 
	      <input type="date" name="starttime" value="Select date" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Select date';}"> 
	   <input type="text" name="starttime"> -->
	     结束时间： 
	      <input type="date" name="endtime" value="Select date" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Select date';}"> 
	 <!--    <input type="text" name="endtime"> --><br>
	     职位种类：  
	   <!--  <input type="text" name="position"><br> -->
	    <select name="selectkind" id="selectkind"> 
	            <option value=""> 请选择</option>
       </select> 
        <select name="position" id="selectposition"> 	          
       </select>  
       <br>        
	     <MY>工作地点：  
	   <select name="workplace" id="workplace"> 
	            <option value="null"> 请选择</option>
	             <option value="香洲区"> 香洲区</option>
	              <option value="金湾区">  金湾区</option>
	               <option value="斗门区"> 斗门区</option>
	                <option value="高新区">高新区</option>
	                 <option value="万山区"> 万山区</option>
	                  <option value="高栏港经济区"> 高栏港经济区</option>
	                   <option value="保税区"> 保税区</option>	            
	               	    <option value=" 横琴新区"> 横琴新区</option>	               
       </select></MY>
       <br>  
	    职位月薪：
	    <my><input type="text" name="salary"></my><br> 
	    招聘人数：
	    <my><input type="text" name="number"></my><br> 
     	<input type="submit" value="确定发布"/><font color="red">&#12288;&#12288;&#12288;&#12288;(*全部数据皆为必填)</font>
    </form><br>
		<a href="javascript:closeLogin();">取消</a>
		</div>
<div id=win1
		style="display:none; POSITION:absolute; left:50%; top:50%; width:200px; height:100px; margin-left:-100px; margin-top:-50px; border:1px solid #888; background-color:#edf; text-align:center">
                                如需了解可投放广告的位置和报价，请发送邮件至1051209415@qq.com.<BR><BR>
		<a href="javascript:closeLogin1();">确定</a>
		</div>
		<div id=win2
		style="display:none; POSITION:absolute; left:50%; top:50%; width:200px; height:100px; margin-left:-100px; margin-top:-50px; border:1px solid #888; background-color:#edf; text-align:center">
                           联系方式0756-110110&#12288;&#12288;15119534661<BR>
                           电子邮箱1051209415@qq.com<BR>
		<a href="javascript:closeLogin2();">确定</a>
		</div>
		<BR><BR>
		<div><a href="javascript:openLogin1();" target="rightlook" target="_blank">广告服务</a><a href="javascript:openLogin2();" target="rightlook" target="_blank">&#12288;&#12288;联系我们</a><BR><BR>
		京 ICP 证 09002463 号|Copyright © 1999-2016, ZHUHAIZP.NET, All Rights Reserved <BR><BR><BR></div>

</body>
</html>
