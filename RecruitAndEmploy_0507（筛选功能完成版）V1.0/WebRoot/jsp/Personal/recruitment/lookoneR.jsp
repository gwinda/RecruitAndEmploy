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

<title>职位详情</title>

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
	width: 100%;
	margin: 0 auto;
}
.now {
	margin-left: 15%;
	margin-right: 15%;
	margin-top: 10px;
	background: white;
}

.middle_left {
	height: 1000px;
	min-width:500px;
	width:45%;
	float: left;
	margin-left: 15%;
	margin-top: 5px;
	background: white;
	/* box-shadow: 0px 0px 8px white; */
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
	height: 100px;
	font-family: 宋体;
	font-size: 15px;
}

.right {
	display: block;
	float: left;
	
	height: 100px;
	margin-left: 30px;
	font-family: 宋体;
	font-size: 15px;
}

.Pager {
	width: 100px;
	height: 40px;
	text-align: center;
	margin: 0 auto;
	margin-left: 15px;
	border-style :none;
}
my .Pager {
	width: 180px;
	height: 60px;
	text-align: center;
	margin: 0 auto;
    margin-top: 15px;
	background-color:#66ccff;
	color:white;
	font-family:黑体;
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
    margin-right: 15%;
    margin-bottom: 0px;
	float: left;
	margin-top: 35px;
	display: block;
	height: 520px;
}

.middle_right .top {
	border: 4px white solid;
	margin-top: 0px;
	height: 220px;
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
	
	background: white;
	margin-top: 0px;
	box-shadow: 0px 0px 3px white;
	color: #059BD8;
	border: 1px solid #E2DFDF;
}

.middle_two {
	text-align: left;
	width: 100%;
	height:500px;
	border:1px white solid;
}

.remind {
	padding-top: 5px;
	padding-bottom: 5px;
	border: 1px solid #4b4b4b;
	margin-top: 5px;
	margin-left: 13%;
	margin-right: 13%;
}
.remind1 {
	padding-top: 5px;
	padding-bottom: 5px;
	margin-right: 15%;
}

.middle_three {

	float: right;
	
}
.remindtop{
    height:120px;
    line-height:120px;  
    margin-left: 15%;
    margin-right: 15%;
    color:#059BD8;
}
li{
margin-top: 15px;
}
my li{
margin-top: 15px;
font-size:20px;
}
.content_middle{
	width:100%;
	height:1000px;
	border:1px white solid;
}
.toudi,.shouchang, .comment {
    background-color: #66CCFF;
}
.toudi, .shouchang, .comment  {
    /* float: left; */
    margin-left: 10px;
    color: #fff;
    font-size: 20px;
    text-align: center;
    width: 150px;
    line-height: 54px;
    border-radius: 4px;
    cursor: pointer;
    position: relative;
}
</style>

<script type="text/javascript">
	window.onload=function(){
		var idfk=$("#infk").val();
		var today=new Date(); 
		var month=today.getMonth()+1;
		var now=today.getFullYear()+"-"+month+"-"+today.getDate();
		var end=$("#endtime").val().split(" ");
		var end1=end[0].split("-");	
		if($("#isend").val()==2){
				//alert($("#isend").val());
					$("#buttontou").attr("value","已过期");
					$("#buttontou").attr({"disabled":"disabled"});
		}	
		if(end1[0]<=today.getFullYear()){
			if(end1[1]<=month){
				if(end1[2]<=today.getDate()){
					$("#buttontou").attr("value","已过期");
					$("#buttontou").attr({"disabled":"disabled"});
				}
			}			
		}		
		else{
			$("#buttontou").attr("value","投递简历")
		}
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
				   		//alert(data);
				   		if(data.indexOf("error")){		   		
					   		$("#collectionbtn").attr("value","已收藏");
					   		$("#collectionbtn").attr("style","color:blue");					   		
				   		}               	
             	}
           });				
		}
	};
	function collection(){
		var type=$("#collectionbtn").attr("value");
		//alert(type);
		if($("#infk").val()==null||$("#infk").val()==""){
			alert("账号未登录");			
		}else{
			if(type=="收藏"){
				var idfk=$("#infk").val();
				//alert($("#infk").val());
				//alert($("#idEnterpriseRecruitment").val());
				$.ajax({
					url:"Collection.action",
					type:"post",
					data:"idfk="+idfk+"&recurimentid="+$("#idEnterpriseRecruitment").val(),
					async:false,  
	                dataType:"text",   //接受数据格式             
	                error: function(){  
	                  alert("error");
	             	},  
					success: function(data){ 				   
					   		alert("成功收藏");
					   		$("#collectionbtn").attr("value","已收藏");
					   		$("#collectionbtn").attr({"font-size":"72px"});
					   		$("#collectionbtn").attr("style","color:blue");
					   		               	
	             	}
	           });	
	           }
	           
	           if(type=="已收藏"){
	           		var idfk=$("#infk").val();
					//alert(idfk);
					//alert($("#idEnterpriseRecruitment").val());
				$.ajax({
					url:"delOneCollection.action",
					type:"post",
					data:"idfk="+idfk+"&recurimentid="+$("#idEnterpriseRecruitment").val(),
					async:false,  
	                dataType:"text",   //接受数据格式             
	                error: function(){  
	                  alert("error");
	             	},  
					success: function(data){ 				   
					   		alert("成功取消收藏");
					   		$("#collectionbtn").attr("value","收藏");
					   		$("#collectionbtn").attr({"font-size":"72px"});
					   		$("#collectionbtn").attr("style","color:black");
					   		               	
	             	}
	           });	
	           
	           }			
	};
	 function duibi(a, b) {
		    var arr = a.split("-");
		    var starttime = new Date(arr[0], arr[1], arr[2]);
		    var starttimes = starttime.getTime();
		
		    var arrs = b.split("-");
		    var lktime = new Date(arrs[0], arrs[1], arrs[2]);
		    var lktimes = lktime.getTime();
		
		    if (starttimes >= lktimes) {
		
		        alert("开始时间大于离开时间，请检查");
		        return false;
		    }
		    else{
		        return true;
		        }

}
}
</script>
</head>

<body>
	<script type="text/javascript" src="js/vsoheader.js" charset="UTF-8"></script>
	<div class="remindtop"><my style="font-size:40px">珠海招聘网</my><B>名企多、薪水高、找工作快</B></div>
	<div class="remind">
		<font size=2 color=#4b4b4b>@珠海招聘网提示您：用人单位以任何名义向应聘者收取费用都属违法行为（如押金、资料费、代收体检费、代收淘宝信誉等），请提高警惕并注意保护个人信息！</font>
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
		<BR><BR>
<div class="now">当前位置：<a href="index2.jsp">首页</a>-><a  href="${einformation.address}">${einformation.name}</a>->招聘信息详情<hr></div>
<div class="content_middle">
		<div class="middle_left">
       <BR><br>
			<my style="font-size:36px"><B>${jobmess.name}</B></my>
			
		   <BR><BR>
		

			<div class="middle_one">
			
				<!--  <h2 style="color:#059BD8;background:#E1E3E4">基本信息</h2>-->
				
				<ul class="left">
					<B><my><li>招${jobmess.number}人 &#12288;${jobmess.workingPlace} &#12288;月薪${jobmess.salary}
					</li></my></B>
					<B><li>${jobmess.startTime}&#12288;-&#12288;${jobmess.endTime}</li></B>
					
				</ul>
				
			</div>
			<BR><BR>
		<div class="remind1">
			<input type="hidden" value="${jobmess.idEnterpriseRecruitment}" name="idEnterpriseRecruitment" id="idEnterpriseRecruitment">
			<input type="hidden" value="${IDFK}" name="infk" id="infk">
				<%--  <a style="color:blue;text-decoration:none;background:#bdcabd;font-size:23px;border-radius:2px; border:2px solid  #bdcabd;" href="selectOneResumetosend.action?IDFK=${IDFK}" onclick="ckeck();return false;">投递简历</a> --%>
				<input type="hidden" value="${jobmess.endTime}" name="endtime" id="endtime">
				<input type="hidden" value="${jobmess.isending}" name="isend" id="isend">
				
					<my><input id="buttontou" type="button" class="toudi" onclick="ckeck()" value="投递简历"></my>
				 <%-- <c:if test="${jobmess.endtime>=<%=date%>}" ></c:if>  --%>
				<!-- <input type="button" class="comment" value="马上留言"> -->
				<input type="button" class="shouchang" value="收藏" onclick="collection()" id="collectionbtn">
			</div>
			
			<br><br><br>
			<div class="middle_two">
			
				<h3 style="color:#059BD8;"><B>职位要求</B></h3>
				<br>
				 <textarea  width="400" style = "background:white;border:none;" name="eduhistory" cols="60" rows="15" disabled="disabled">${jobmess.requirement}</textarea>
			</div>
		</div>
			<br>
			
			
			<div class="middle_right">
				<div class="top">
					<!--  <h2 style="color:#059BD8;background:#E1E3E4">企业信息</h2>-->
					<ul>
						<li ><B style="font-size:24px;font-family:'黑体'"><a herf="">${einformation.name}</a></B></li>
						
						<BR>
						<BR><BR>
						<li style="color: #867e7e;">联系方式&#12288;${einformation.phone}&#12288;&#12288;&#12288;联系人&#12288;陈书记<BR>企业邮箱&#12288;${einformation.mailbox}</li>	
						<li ><B style="font-size:20px;font-family:'黑体'">企业地址</B></li><br>
						<li style="color: #867e7e;">${einformation.address}</li>
					</ul>
				</div>
				<BR><BR><BR>
				<!---企业招聘信息-->
				<div class="down">
					<B><h3 style="color:#000000" >职位推荐</h3></B>
					<HR style=" height:2px;border:none;border-top:2px dotted #185598;">
					<ul>
						<c:forEach var="mentlist" items="${Recruitmentlist}">
							<li><a href="lookRecuriment!lookonejob.action?id=${mentlist.idEnterpriseRecruitment}&idEnterpriseInformation=${mentlist.idEnterpriseInformation}">${mentlist.name}	月薪${mentlist.salary}</a>
							
							</li>
							
							<BR>
						</c:forEach>
					</ul>
				</div>
			</div>
	</div>
			<!-- ---------------------------end--右侧企业信息简介-------------------------------------- -->
		</div>



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
	if(name.length==0){
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
