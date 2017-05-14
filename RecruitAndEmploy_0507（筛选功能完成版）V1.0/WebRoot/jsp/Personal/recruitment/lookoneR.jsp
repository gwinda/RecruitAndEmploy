<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'lookoneR.jsp' starting page</title>

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
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="css/rc_index.css">
<!--jquery-->
<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<!--cookie domain-->
<script type="text/javascript" src="js/cookie.js"></script>
<script type="text/javascript" src="js/referer_getter.js"></script>
<style type="text/css">
.over {
	width: 90%;
	margin: 0 auto;
}
.now {
	margin-left: 15%;
	margin-right: 15%;
	margin-top: 10px;
	background: white;
}

.middle_left {
	border-top: 4px solid #6cf;
	height: 250px;
	margin-left: 15%;
	margin-right: 15%;
	margin-top: 5px;
	background: white;
	box-shadow: 0px 0px 8px white;
	font-size:16px;
}

.middle_one {
	width: 100%;
	height: 100px;
}

.middle_left li {
	list-style-type: none;
	color: #867e7e;
}

.left {
	display: block;
	float: left;
	width: 39%;
	height: 100px;
	font-family: 宋体;
	font-size: 15px;
}

.right {
	display: block;
	float: left;
	width: 39%;
	height: 100px;
	margin-left: 30px;
	font-family: 宋体;
	font-size: 15px;
}

.Pager {
	float:left;
	width: 80px;
	height: 33px;	
	text-align: center;	
}
#topline {
	height: 27px;
	padding: 10px 0;
}
#topline p {
	float: left;
	margin: 0;
	padding: 0;
	text-decoration: none;
}

#topline ul {
	float: right;
	margin: 0;
	padding: 0;
	list-style: none;
	text-decoration: none;
}

#topline li {
	display: inline;
	margin: 0 8px 0 0;
	padding: 0 10px 0 0;
	border-right: 1px solid #999999;
}

#topline li.last {
	margin-right: 0;
	padding-right: 0;
	border: none;
}

.topline2 {
	width: 100%;
	height: 100px;
	border: 1 px red solid;
	background: hsla(235, 97%, 77%, 0.71);
	text-align: center;
}

.topline2 a {
	font-size: 32px;
	float: right;
	margin-left: 10px;
	text-decoration: none;
	color: #059BD8;
}

.middle_right {
    margin-top: 0px;
    margin-bottom: 0px;
	float: left;
	display: block;
	height: 520px;
}

.middle_right .top {
	border: 4px white solid;
	margin-top: 0px;
	height: 200px;
	background: white;
	text-align: left;
	box-shadow: 0px 0px 3px white;
	border: 1px solid #E2DFDF;
}

.middle_right  ul li {
	margin-left: 0px;
	margin-top: 0px;
	text-align: left;
    font-family: 宋体;
	font-size: 14px;
	font-weight: bold;
	list-style-type: none;
}

.middle_right .down {
	height: 280px;
	background: white;
	margin-top: 0px;
	box-shadow: 0px 0px 3px white;
	color: #059BD8;
	border: 1px solid #E2DFDF;
}

.middle_two {
text-align: left;
	width: 100%;
	height: 150px;
}

.remind {
	padding-top: 5px;
	padding-bottom: 5px;
	border: 1px solid #f00;
	margin-top: 5px;
	margin-left: 15%;
	margin-right: 15%;
}

.middle_three {
	display:block;
	margin-right:200px;
	padding-top:1px;
	height:60px;	
	float:right;
}
.middle_three  input{
	margin-left:3px;
	display:block;
}
</style>
<script type="text/javascript" src="js/jquery-1.11.3.js"></script>
<script type="text/javascript">
	window.onload=function(){
		var idfk=$("#infk").val();
		//alert(idfk);
		if(idfk!=null&&idfk!=""){
		$.ajax({
				url:"CollectionExist.action",
				type:"post",
				data:"idfk="+idfk+"&recurimentid="+$("#idEnterpriseRecruitment").val(),
				async:false,  
                dataType:"text",   //接受数据格式             
                error: function(){  
                  alert("error");
             	},  
  				success: function(data){  				   
				   		alert(data);
				   		if(data.indexOf("error")){		   		
					   		$("#collectionbtn").attr("value","已收藏");
					   		$("#collectionbtn").attr({"disabled":"disabled"});
				   		}               	
             	}
           });				
		}
	};
	function collection(){
		if($("#infk").val()==null||$("#infk").val()==""){
			alert("账号未登录");			
		}else{
			var idfk=$("#infk").val();
			alert($("#infk").val());
			alert($("#idEnterpriseRecruitment").val());
			$.ajax({
				url:"Collection.action",
				type:"post",
				data:"idfk="+idfk+"&recurimentid="+$("#idEnterpriseRecruitment").val(),
				async:false,  
                dataType:"json",   //接受数据格式             
                error: function(){  
                  alert("error");
             	},  
				success: function(data){ 				   
				   		alert("成功收藏");
				   		$("#collectionbtn").attr("value","已收藏");
				   		$("#collectionbtn").attr({"disabled":"disabled"});               	
             	}
           });				
	}
}
</script>
</head>

<body>
	<script type="text/javascript" src="js/vsoheader.js" charset="UTF-8"></script>
	<div class="remind">
		<font size=2 color=red>@珠海招聘网提示您：用人单位以任何名义向应聘者收取费用都属违法行为（如押金、资料费、代收体检费、代收淘宝信誉等），请提高警惕并注意保护个人信息！</font>
	</div>

	<!-- ----------------版头栏：登录注册栏---------------- -->


	<!-- ----------------strat：具体招聘信息---------------- -->
	<div class="over">
		<!--  
	<div class="topline2">
		<font style="font-size:50px;">${einformation.name}</font><br>
		<a  href="${einformation.address}" target="_blank">公司简介</a>&nbsp;
		<a  href="" >收藏</a>
		<a  href="" target="_blank">投诉</a>
	</div>
	-->
		<!-- -----end：具体招聘信息------- -->


		<!-- ----------------strat：具体招聘信息---------------- -->
<div class="now">当前位置：<a href="indes2.jsp">首页</a>-><a  href="${einformation.address}">${einformation.name}公司</a>->招聘信息详情</div>
		<div class="middle_three">
			<input type="hidden" value="${IDFK}" name="infk" id="infk">
			<input type="hidden" value="${jobmess.idEnterpriseRecruitment}" name="idEnterpriseRecruitment" id="idEnterpriseRecruitment">
			
				<%--  <a style="color:blue;text-decoration:none;background:#bdcabd;font-size:23px;border-radius:2px; border:2px solid  #bdcabd;" href="selectOneResumetosend.action?IDFK=${IDFK}" onclick="ckeck();return false;">投递简历</a> --%>
				<input type="button" class="Pager" onclick="ckeck()" value="投递简历"> &nbsp;&nbsp;&nbsp;&nbsp;
				
				<input type="button" class="Pager" onclick="collection()" id="collectionbtn" value="收藏">
				<br>			
			</div>
		<div class="middle_left">
       
			<h4 style="color:black">${jobmess.name}</h4>
			

			<div class="middle_one">
			
				<h2 style="color:#059BD8;background:#E1E3E4">基本信息</h2>
				<ul class="left">
					<li>开始时间:<font color="black"><fmt:formatDate
								value="${jobmess.startTime}" dateStyle="long" />
					</font>
					</li>
					<li>结束时间:<font color="black">${jobmess.endTime}</font></li>
					<li>招聘类型:<font color="black">${jobmess.position}</font>
					</li>
				</ul>
				<ul class="right">
					<li>招聘人数:<font color="black">${jobmess.number}</font>
					</li>
					<li>薪水:<font color="black">${jobmess.salary}</font>
					</li>
					<li>工作地点:<font color="black">${jobmess.workingPlace}</font>
					</li>
				</ul>
			</div>
			
			<div class="middle_two">
				<h5 style="color:white;">aa</h5>
				<h2 style="color:#059BD8;background:#E1E3E4">职位要求</h2>
				<br>
				<font color="black" style="font-size:18px;">
					${jobmess.requirement}</font>
			</div>
			<br>
			<div class="middle_right">
				<div class="top">
					<h2 style="color:#059BD8;background:#E1E3E4">企业信息</h2>
					<ul>
						<li>企业名称：${einformation.name}</li>
						<li>企业电话:${einformation.phone}</li>
						<li>企业邮箱:${einformation.mailbox}</li>
						<li>企业地址:${einformation.address}</li>
					</ul>
				</div>
				<!---企业招聘信息-->
				<div class="down">
					<h5 style="background:#E1E3E4">其它招聘信息</h5>
					<ul>
						<c:forEach var="mentlist" items="${Recruitmentlist}">
							<li>---<a
								href="lookRecuriment!lookonejob.action?id=${mentlist.idEnterpriseRecruitment}&idEnterpriseInformation=${mentlist.idEnterpriseInformation}">${mentlist.name}</a>
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>
			<!-- ---------------------------end--右侧企业信息简介-------------------------------------- -->
		</div>

	</div>
	<!-----end：左侧具体招聘信息- -->

	<!-- ---------------------------start--右侧企业信息简介-------------------------------------- -->
	<script type="text/javascript" src="js/jquery-1.11.3.js"></script>
	<SCRIPT LANGUAGE="javascript">
  $(document).ready(function(){
  		var name=getCookie("userName");
  		//alert(name);
  		$("#username").html(name);
  });
function ckeck(){
	var id=document.getElementById("infk").value ;
	var name=getCookie("userName");
	//alert(name);
	if(name==""||name==null){
		alert("未登录,请登录后再投递！");
		return false;
	}
	if(name.indexOf("企业")>0){
		alert("企业无法投递简历");
		return false;
	}
	if(id==""){
		alert("未登录,请登录后再投递！");
		//window.location.href="Login.jsp";
		return false;		
	}	
	
	window.location.href="selectOneResumetosend.action?IDFK="+id;			
}
function getCookie(name)
{
	var arr,reg=new RegExp("(^| )"+name+"=([^;]*)(;|$)");
	if(arr=document.cookie.match(reg))
	return unescape(arr[2]);
	else
	return null;
}
function getCookie(name) {   
  var arg = name + "=";   
  var alen = arg.length;   
  var clen = document.cookie.length;   
   var i = 0;   
    while (i < clen) {   
        var j = i + alen;   
        if (document.cookie.substring(i, j) == arg) {   
            return getCookieVal(j);   
       }   
       i = document.cookie.indexOf(" ", i) + 1;   
     if (i == 0) break;    
    }
   }  
function getCookieVal(offset) {   
    var endstr = document.cookie.indexOf (";", offset);   
 	if (endstr == -1) {   
     endstr = document.cookie.length;   
    }   
   return decodeURIComponent (document.cookie.substring(offset, endstr));   
}
    
</SCRIPT>
	<script type="text/javascript" src="js/vsofooter.js"></script>
	<!--add experience-->
	<script type="text/javascript" src="js/experience.js"></script>
</body>
</html>
