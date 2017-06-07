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

<title>珠海人才库-我的企业</title>

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
<style>
.alignright {
	text-align: right
}

img {
	margin-left: 0px;
	float: left;
}

.mydiv {
	width: 80%;
	margin-left: 10px;
	padding-left: 0px;
}

.my1div {
	margin-left: 10px;
	padding-left: 0px;
}

.table1 {
	margin-left: -50px;
	text-align: left;
	border-collapse: separate;
	border-spacing: 50px;
}

P {
	border: 1px solid #cffcff;
	font-weight: bold;
	width: 150px;
	height: 35px;
	line-height: 35px;
	text-align: center;
	font-size: 13px;
	color: #000;
}

.right {
	float: right;
}

.show {
	width: 40%;
	height: 400px;
	float: left;
	padding: 5px;
}

.show1 {
	width: 100%;
	height: 400px;
	line-height: 400px;
	text-align: center;
	border: 1px, #6f6;
	float: left;
	background: #ddd;
}

topbt {
	width: 80%;
}

topb {
	float: left;
	width: 80%;
}

topc {
	float: left;
	width: 10%;
	background: #cffcff;
}

td {
	font-size: 13px;
}

textarea {
	width: 270px;
	height: 100px;
	BORDER: none;
}

.mytopt {
	width: 100%;
	height: 40px;
}

body {
	padding-left: 15%;
	padding-right: 15%;
}

my a:link {
	
}

my a:hover {
	border-bottom: 3px solid #5d5d5d;
}

.mytop {
	width: 100%;
	height: 100px;
	background: #ddd;
}

my a {
	font-size: 18px;
	Margin-right: 20px
}


input[type="text"]{
       width:250px;
       height:35px;
       margin-top: 5px;
	
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

.cc {
	float: left width:20%
}
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


					<c:choose>
						<c:when test="${mailbox!=null}">
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
						</c:when>
						<c:otherwise>
						</c:otherwise>
					</c:choose>
					</li>
				</ul>
			</div>
		</div>
	</div>

	<BR>
	<!-- <div class="mytopt">
          <MY> <a href="jsp/Enterprise/RecruitmentCreateJsp.jsp" target="rightlook">发布招聘</a> </MY>
           <MY> <a href="Rec?i=1" target="rightlook">查看招聘</a></MY>
           <MY> <a href="ApplicationAction.action?opera=notsee&user=2" target="rightlook">查看以投递简历</a></MY>
            <MY> <a href="Ei" target="rightlook">我的信息</a></MY></div>
<BR> -->
	<div class="mytop"><img src="personPicture/g.jpg" width="100%" height="100%"></div>
	<BR>
	<div topbt>
		<div class="topb">
			<BR>
			<!--  <P>我的信息</P>-->
			<BR>
			<s:iterator value="#request.einformation" id="ei" status="status">
				<table>
					<tr>
						<td rowspan="10"><img width="100" height="100"
							src="uploadpic/<s:property value="#ei.trademark" />"></img></td>
					</tr>
					<tr>
						<td>&#12288;<font size="5"><s:property value="#ei.name" /></font>
						</td>
					</tr>
					<tr>
						<td>&#12288;</td>
					</tr>
					<tr>
						<td>&#12288;联系方式:<s:property value="#ei.phone" />&#12288;|&#12288;
							邮箱帐号:&nbsp;&nbsp; <s:property value="#ei.mailbox" />
						<td>&#12288;|&#12288;主页地址:&nbsp;&nbsp; <s:property
								value="#ei.homepage" /></td>
					</tr>
					<tr>
						<td></td>
					</tr>
					<tr>

						</td>
					</tr>
					<tr>
						<td>&#12288;企业地址:&nbsp;&nbsp; <s:property value="#ei.address" />
						</td>
					</tr>
				</table>
				<BR>
				<BR>
			</s:iterator>

			<div class="mydiv">
				<table class="table1">
					<tr>
						<td><font size="4">待查看简历</font></td>
						<td><font size="4">正在进行</font></td>
						<td><font size="4">招聘总数</font></td>
	

					</tr>

					<tr>
						<td><B><a
								href="ApplicationAction.action?opera=notsee&user=2">
								<font size="5" color="red"><s:property
										value="#request.nosee" /> </font></a> </B>
						</td>
						<td><B><a href="Rec?i=1" target="rightlook">
						<font size="5" color="red"><s:property
										value="#request.nowsize" /> </font></a> </B>
						</td>
						<td><a href="Rec?i=0"><B>
						<font size="5" color="red"><s:property
										value="#request.resize" /></font>
						</a></B>
						</td>
			
					</tr>

				</table>
			</div>
		</div>
	</div><BR>
	<!--  <P>智能推荐 (测试中)</P>  -->
	<BR>
	<!--<div class="show">

		<table>
			<tr>
				<td rowspan="3"><img width="60" height="60"
					src="uploadpic/<s:property value="#ei.trademark" />"></img>
				</td>
				<td>&#12288;姓&#12288;名:</td>
			</tr>
			<tr>
				<td>&#12288;手&#12288;机:</td>
			</tr>
			<tr>
				<td>&#12288;学&#12288;历:</td>
			</tr>
			<tr>
				<td><B>电子邮箱:</B> 邮箱</td>
			</tr>
			<tr>
				<td><B>工作经验</B>
				</td>
			</tr>
			<tr>
				<td colspan="3"><textarea disabled="disabled">dsfddsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfddsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfddsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfds
					dsfddsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfddsfdsdsfddsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfddsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfddsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfds
					dsfddsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfddsfdsdsf</textarea>
				</td>
			</tr>
			<tr>
				<td><B>自我介绍</B>
				</td>
			</tr>
			<tr>
				<td colspan="3"><textarea disabled="disabled">
					dsfddsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfddsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfddsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfds
					dsfddsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfddsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsffdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfsfdsfdsfdsfdsfdsfdsf
					</textarea></td>
			</tr>
			<tr>
				<td colspan="3" align="center"><BR> 不感兴趣</td>
			</tr>
			</tr>
		</table>
	</div>

	<div class="show">
		<table>
			<tr>
				<td rowspan="3"><img width="60" height="60"
					src="uploadpic/<s:property value="#ei.trademark" />"></img>
				</td>
				<td colspan="2">&#12288;姓&#12288;名:</td>
			</tr>
			<tr>
				<td colspan="2">&#12288;手&#12288;机:</td>
			</tr>
			<tr>
				<td colspan="2">&#12288;学&#12288;历:</td>
			</tr>
			<tr>
				<td><B>电子邮箱:</B> 邮箱</td>
			</tr>
			<tr>
				<td><B>工作经验</B>
				</td>
			</tr>
			<tr>
				<td colspan="3"><textarea disabled="disabled">dsfddsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfddsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfddsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfds
					dsfddsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfddsfdsdsfddsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfddsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfddsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfds
					dsfddsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfddsfdsdsf</textarea>
				</td>
			</tr>
			<tr>
				<td><B>自我介绍</B>
				</td>
			</tr>
			<tr>
				<td colspan="3"><textarea disabled="disabled">
					dsfddsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfddsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfddsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfds
					dsfddsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfddsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsffdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfsfdsfdsfdsfdsfdsfdsf
					</textarea></td>
			</tr>
			<tr>
				<td colspan="3" align="center"><BR> 不感兴趣</td>
			</tr>
			</tr>
		</table>
	</div>         -->
	<div class="show1"><img src="personPicture/h.jpg"  width="100%" height="100%"></div>

	<div id=win
		style="display:none; POSITION:absolute; left:50%; top:50%; width:600px; height:550px; margin-left:-300px; margin-top:-200px; border:1px solid #888; background-color:#edf; text-align:center">
		${R}
    <form name="form1" method="post" action="Recc">    <br><br>
	      职位名称：
	      <input type="text" name="name"/><br>
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
	    <input type="text" name="salary"><br> 
	    招聘人数：
	    <input type="text" name="number"><br>   <br> 
     	<input type="submit" value="确定发布"/><font color="red">&#12288;&#12288;&#12288;&#12288;(*全部数据皆为必填)</font>
    </form><br>
		<a href="javascript:closeLogin();">取消</a>
		</div><BR>
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
		
		<div style="height:200px;"><a href="javascript:openLogin1();" target="rightlook" target="_blank">广告服务</a><a href="javascript:openLogin2();" target="rightlook" target="_blank">&#12288;&#12288;联系我们</a><BR><BR>
		京 ICP 证 09002463 号|Copyright © 1999-2016, ZHUHAIZP.NET, All Rights Reserved <BR><BR><BR></div>

</body>

</html>