<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'EcollectionClass.jsp' starting page</title>
    
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
	width: 25px;
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
.ecollleft{
width:40%;
float:left;
background: #ddd;
}
.ecollright{
padding-left: 20px;
width:60%;
float:left;
background: #ddd;
}
</style>
<STYLE TYPE="text/css">
</style>
  <style>
  body{
padding-left: 15%;
	padding-right: 15%;
}
</style>
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
function updatea(){
   var id=document.getElementById("update").value;
   document.getElementById("createbutton").value="+";
   document.getElementById("createbutton").onclick=create;
   document.getElementById("create").style.display="none"; 
    var text=document.getElementById("create").value;
   document.myform.action = "EcollectionClassUpdate?text="
						+ text +"&id=" + id;
				document.myform.submit();
   
}
function update(id){
   document.getElementById("createbutton").value="确定";
   document.getElementById("createbutton").onclick=updatea;
   document.getElementById("create").style.display="";
   document.getElementById("update").value=id;
}

function create(){
   document.getElementById("createbutton").value="确定";
   document.getElementById("createbutton").onclick=createa;
   document.getElementById("create").style.display="";
}
function createa(){
   document.getElementById("createbutton").value="+";
   document.getElementById("createbutton").onclick=create;
   document.getElementById("create").style.display="none";
   var text=document.getElementById("create").value;
   
   document.myform.action = "EcollectionClassCreate?text="
						+ text;
				document.myform.submit();
}
</script>

  </head>

  <body>
  <form action=" " id="myform"
		method="post" name="myform"></form>
		
		
		
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

	<div class="ecollleft">
	
	<font size="5">人才收藏</font><BR>
	<font color="red">删除分组会删除该分组下的所有收藏，请谨慎操作！</font><BR><BR>
	<input type="button" value="+" onclick="create();" id="createbutton">&#12288;<input type="text" style='display:none;' id="create"/>
	<input type="text" style='display:none;' id="update"/>
	
	<BR><BR>
  <s:iterator value="#session.listEcollectionClass" id="listEcollectionClass" status="status">
<a href="EcollectionClassDelete?id=<s:property value="#listEcollectionClass.id" />">删除</a>&#12288;<a href="javascript:update(<s:property value="#listEcollectionClass.id" />)">修改</a>
&#12288;&#12288;<a href="Ecollection?classid=<s:property value="#listEcollectionClass.id" />"> <s:property value="#listEcollectionClass.name" /></a>
<BR> <BR>
  </s:iterator>
    </div>
    <div class="ecollright">
  <s:iterator value="#request.listEcollection" id="listEcollection" status="status">
  <font size="4">
  
  <a href="lookResumeEc?idResume=<s:property value="#listEcollection.id" />" target="view_window">
  <s:property value="#listEcollection.ename" /></a>
  <s:property value="#listEcollection.time" /></font>
  <a href="EcollectionDelete?id=<s:property value="#listEcollection.id" />">移除</a><BR>
  </s:iterator>
  </div>

  </body>
</html>
