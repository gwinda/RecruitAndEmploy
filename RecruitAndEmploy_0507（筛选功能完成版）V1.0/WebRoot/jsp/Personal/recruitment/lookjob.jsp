<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'lookjob.jsp' starting page</title>

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
<script type="text/javascript">
function getAjax(positionkey,workkey,moneykey,pageNo){//点击获取列表的异步操作
	$.ajax({  //异步刷新，可不要
                url :"findjobByThreekey.action",  //后台处理程序          
                type:"post",    //数据发送方式  
                data:"positionkey="+positionkey+"&workkey="+workkey+"&moneykey="+moneykey+"&pageNo="+pageNo,
                async:false,  
                dataType:"json",   //接受数据格式             
                error: function(){  
                  alert("error");
             	},  
  				success: function(data){  
  				  $("#content2").append("<table border='0' id='listtable'>"+
						"<tr>"+
						"<td>招聘名称</td>"+
						"<td>公司名称</td>"+
						"<td>工作地点</td>"+
						"<td>职位月薪</td>"+
						"</tr>"+			
						"</table>");					
	  				var d=eval(data);
	  				var obj = eval(data["jobkeylist"] ); //获取json
	  				var obj2 = data["aa"]; //获取json
	  				var obj3 = data["bb"]; //获取json
	  				//alert(data["aa"]);
	  				//alert(obj3);
	  				$.each(obj,function(i,value) {  
	  					//alert(value.name);  				  		
	                      $("#listtable").append("<tr>"+
	                        "<td>"+
	                        "<a href='lookRecuriment!lookonejob.action?id="+value.idEnterpriseRecruitment+"&idEnterpriseInformation="+value.idEnterpriseInformation+" ' target='_blank'>"+value.name+
	                        "</a></td>"+
							"<td>"+value.idEnterpriseInformation+"</td>"+
							"<td>"+value.workingPlace+"</td>"+
							"<td>"+value.salary+"</td>"+
						"</tr>");    
	                });   
	                 var moye=parseInt(parseInt(obj3)%12==0?parseInt(obj3)/12:parseInt(obj3)/12+1);
	                 var nextOne=parseInt(pageNo)+1;
	                 var lastOne=parseInt(pageNo)-1;
	                 $("#sumcount").html(obj3); 
	                // $("#sumpage").html(moye);
	                 document.getElementById("content2").style.display="block" ;	                 		  
	                  if(obj3>12&&parseInt(pageNo)<moye&&parseInt(pageNo)>1){                                    
			    		$("#fenye").append(""+
			    			"<a href='#' onclick='return  FenyeSendTo(1)'>首页</a>"+
			    			"<a href='#' onclick='return FenyeSendTo("+lastOne+")'>上一页</a>"+
							"<a href='#' onclick='return FenyeSendTo("+nextOne+")'>下一页</a>"+
							"<a href='#' onclick='return FenyeSendTo("+moye+")'>末页</a>");
			    		}
			    		if(obj3>12&&parseInt(pageNo)==moye){                                    
			    		$("#fenye").append(""+
			    			"<a href='#' onclick='return  FenyeSendTo(1)'>首页</a>"+
							"<a href='#' onclick='return FenyeSendTo("+lastOne+")'>上一页</a>"+
							"<a href='#' onclick='return  FenyeSendTo("+moye+")'>末页</a>");
			    		}
			    		if(obj3>12&&parseInt(pageNo)==1){                                    
			    		$("#fenye").append(""+
			    			"<a href='' onclick='return  FenyeSendTo(1)'>首页</a>"+
							"<a href='#' onclick='return FenyeSendTo("+nextOne+")'>下一页</a>"+
							"<a href='#' onclick='return  FenyeSendTo("+moye+")'>末页</a>");
			    		}
			    		                        
           		 }  
                           	 
    	});	
    }	
    				
$(function () { 
	var alink04 = $("#position").find("a"); 
	alink04.click(function () { 
		alink04.each(function () { 
			$(this).removeClass("templinkactive").addClass("templink"); 
		}); 
		$(this).removeClass("templink").addClass("templinkactive"); 
		$("#positionkey").val($(this).attr("id"));
		var positionkey=$("#positionkey").val();
		var workkey=$("#workkey").val();
		var moneykey=$("#moneykey").val();
		 $("#content").remove();
		 $("#content2").empty();	
		//alert(positionkey);
		getAjax(positionkey,workkey,moneykey,1);	
	}); 
	var alink05 = $("#money").find("a"); 
	alink05.click(function () { 
		alink05.each(function () { 
			$(this).removeClass("templinkactive").addClass("templink"); 
		}); 
		$(this).removeClass("templink").addClass("templinkactive"); 
		$("#moneykey").val($(this).attr("id"));
		var positionkey=$("#positionkey").val();
		var workkey=$("#workkey").val();
		var moneykey=$("#moneykey").val();
		 $("#content").remove();
		 $("#content2").empty();	
		//alert(moneykey);
		getAjax(positionkey,workkey,moneykey,1);	
	}); 
	
});
function FenyeSendTo(pageNo){
 		$("#content").remove();
		$("#content2").empty();
		$("#fenye").empty();
		//alert(pageNo);
		var positionkey=$("#positionkey").val();
		var workkey=$("#workkey").val();
		var moneykey=$("#moneykey").val();
		getAjax(positionkey,workkey,moneykey,pageNo);
		return false;	
}
function Findbyjobname(workkey){
		//alert("aa");
		//var tablelength=$("#listtable").find("tr").length;
		for(var j=0;j< 9;j++){
			$("#"+j+"t a").removeClass("templinkactive").addClass("templink"); 
		}
	    $("#"+workkey).removeClass("templink").addClass("templinkactive"); 
		$("#workkey").val(workkey);
		var positionkey=$("#positionkey").val();
		var workkey=$("#workkey").val();
		var moneykey=$("#moneykey").val();
		 $("#content").remove();
		 $("#content2").empty();	
		//alert(positionkey);
		//alert(workkey);
		getAjax(positionkey,workkey,moneykey,1);
		return false;	
} 
function Findbynolimit(obj){
	for(var i = 0;i < 9; i++) {
		$("#"+i+"t").empty();
		display="none"
		$("#"+i+"i").removeClass("templinkactive").addClass("templink");
		$("#"+i+1+"t").css("display","none");
		//document.getElementById(""+i+"i").style.color="white";
		//document.getElementById("#"+i+"t").style.display="none";		
	}
	 $("#"+obj).removeClass("templink").addClass("templinkactive"); 
		$("#workkey").val("");
		var positionkey=$("#positionkey").val();
		var workkey=$("#workkey").val();
		var moneykey=$("#moneykey").val();
		 $("#content").remove();
		 $("#content2").empty();	
		getAjax(positionkey,workkey,moneykey,1);
		return false;	
	
}
//细分类型的div盒子显示实现，先清空，将点击过的数据变回原来的颜色
function ShowDiv(objid)
{
	//alert(objid);
	//显示之前先循环将所有div的内容清空，将点击过的变色内容变回白色
	for(var i = 0;i < 9; i++) {
		$("#"+i+"t").empty();
		$("#"+i+"i").removeClass("templinkactive").addClass("templink");
		$("#"+i+"t").css("display","none");
		
	}
	//document.getElementById(""+objid.substr(0, 1)+"i").style.color="red";//将点击的链接变色
	$("#"+objid.substr(0, 1)+"i").removeClass("templink").addClass("templinkactive");
	//如果隐藏的内容以显示出来，则隐藏div 盒子
	if(document.getElementById(objid).style.display=="block"){
		document.getElementById(objid).style.display="none";
	}
	else{	
	$("#"+objid).empty();//将内容清空
	  $.ajax({  //异步刷新，可不要
                url :"Lookposition.action?kid="+objid.substr(0, 1),  //后台处理程序          
                type:"post",    //数据发送方式  
                async:false,  
                dataType:"json",   //接受数据格式             
                error: function(){  
                  alert("error");
             	},  
  				success: function(data){   				
	  				var d=eval(data);
	  				var obj = eval(data["Joblist"] ); //获取json
	  				//alert(obj);	 	
	  				//遍历细分职位的链接	
	  				 $("#"+objid).append("<a href='' onclick='return Findbyjobname("+null+")' class='templink' id=" + null +">" + "不限</a>  &nbsp; &nbsp; "); 	
	  				$.each(obj,function(i,value) {  
	  					//alert(value.name);  				  		
	                      $("#"+objid).append("<a href='' onclick='return Findbyjobname("+value.id+")' class='templink' id=" + value.id +">" + value.name + "</a>  &nbsp; &nbsp; ");    
	                });     
	              document.getElementById(objid).style.display="block";   //显示div                    
            }               	 
    	});			
      // document.getElementById(objid).style.display="block"; 
   }
}
</script>

<style type="text/css">
.fenye{
	float:left;
	padding-left:40%;
	height:100px;
}
tr {
	font-size: 20px;
}

td {
	width: 200px;
}

.form-control {
	width: 200px;
}

.vso-copyright-wrap {
	margin-bottom: 11px;
}

#bottom_footer {
	margin-top: 100px;
}

.iunputkey {
	margin-top: 10px;
	font-size: 18px;
	width: 200px;
	height: 25px;
}

.iunputbutton {
	font-size: 18px;
	width: 70px;
	height: 25px;
}

.input-group {
	margin-left: 2%;
}

#content {
	height: 80%;
	border-top: 1px solid #6cf;
	margin-top: 5px;
	margin-left: 15%;
	margin-right: 15%;
	border-top: 1px solid #6cf;
}

#content2 {
	height: 80%;
	border-top: 1px solid #6cf;
	margin-top: 5px;
	margin-left: 15%;
	margin-right: 15%;
	border-top: 1px solid #6cf;
	display: none;
}

.position {
	height: 30px;
	margin-top: 50px;
	margin-left: 2%;
}

.position a {
	color: #FFFFFF;
}

.work {
	margin-left: 2%;
}

.work a {
	color: #FFFFFF;
}

.money {
	padding-top: 10px;
	height: 30px;
	margin-left: 2%;
}

.money a {
	color: #FFFFFF;
}

.positionbottom {
	margin-top: 10px;
	margin-left: 15%;
	margin-right: 15%;
}

table {
	width: 100%;
	border-collapse: separate;
	border-spacing: 15px;
}

td {
	font-size: 13px;
}

.mytop {
	background: #4b4b4b;
	height: 200px;
	margin-top: 15px;
	margin-left: 15%;
	margin-right: 15%;
}

.templinkactive {
	text-decoration: none;
	background-color: #2788DA;
}

.templink {
	cursor: pointer;
	padding: 1px;
	text-decoration: none;
}

#foreachcontent {
	display: block;
}

.listtable {
	height: 600px;
}
</style>

</head>

<body>
	<script type="text/javascript" src="js/vsoheader.js" charset="UTF-8"></script>
	<div class="mytop">
		<div class="input-group _web_ad_" ad_data="{'b_id':5, 'row_num':1}">
			<form name="search" id="search" method="get"
				action="searchjob!searchjob.action" onSubmit="return checkParams()">
				<input type="text" name="keyword" id="keyword" class="iunputkey"
					placeholder="职位搜索" onKeyUp="help(event)"
					aria-describedby="basic-addon2" value="" autocomplete="off">
				<input type="submit" class="iunputbutton" id="" value="搜索" />
			</form>
		</div>
		<div class="position" id="position">
			<font size=2 color=gray>工作地点：</font> <a herf=""
				class="templinkactive" id="">不限</a> &nbsp; &nbsp; <a herf=""
				class="templink" id="香洲区">香洲区</a> &nbsp; &nbsp; <a herf=""
				class="templink" id="斗门区">斗门区</a> &nbsp; &nbsp; <a herf=""
				class="templink" id="金湾区">金湾区</a> &nbsp; &nbsp; <a herf=""
				class="templink" id="横琴新区">横琴新区</a> &nbsp; &nbsp; <a herf=""
				class="templink" id="高新区">高新区</a> &nbsp; &nbsp; <a herf=""
				class="templink" id="万山区">万山区</a> &nbsp; &nbsp; <a herf=""
				class="templink" id="高栏港经济区">高栏港经济区</a> &nbsp; &nbsp; <a herf=""
				class="templink" id="保税区">保税区</a> &nbsp; &nbsp;
		</div>
		<div class="work" id="work">
			<!-- 点击大类弹出小分类 -->
			<font size=2 color=gray>职位类别：</font> <a herf="#" id="0i"
				class="templinkactive" onclick="return Findbynolimit('0i')">不限</a>
			&nbsp; &nbsp; <a herf="#" id="1i" onclick="ShowDiv('1t')">IT</a>
			&nbsp; &nbsp; <a herf="#" id="2i" onclick="ShowDiv('2t')">传媒</a>
			&nbsp; &nbsp; <a herf="#" id="3i" onclick="ShowDiv('3t')">旅游</a>
			&nbsp; &nbsp; <a herf="#" id="4i" onclick="ShowDiv('4t')">服装</a>
			&nbsp; &nbsp; <a herf="#" id="5i" onclick="ShowDiv('5t')">运输物流</a>
			&nbsp; &nbsp; <a herf="#" id="6i" onclick="ShowDiv('6t')">教政</a>
			&nbsp; &nbsp; <a herf="#" id="7i" onclick="ShowDiv('7t')">酒店餐饮</a>
			&nbsp; &nbsp; <a herf="#" id="8i" onclick="ShowDiv('8t')">建筑</a>
			&nbsp; &nbsp;
			<div id="alldiv" class="alldiv" style="display:block;">
				<div id="1t" style="display:none; color:white; "></div>
				<div id="2t" style="display:none; color:white; "></div>
				<div id="3t" style="display:none; color:white; "></div>
				<div id="4t" style="display:none; color:white; "></div>
				<div id="5t" style="display:none; color:white; "></div>
				<div id="6t" style="display:none; color:white; "></div>
				<div id="7t" style="display:none; color:white; "></div>
				<div id="8t" style="display:none; color:white; "></div>
			</div>
		</div>
		<div class="money" id="money">
			<font size=2 color=gray>薪资水平： <a herf=""
				class="templinkactive" id="不限">不限</a> &nbsp; &nbsp; <a herf=""
				class="templink" id="1000以下">1000以下</a> &nbsp; &nbsp; <a herf=""
				class="templink" id="1001-2000">1001-2000</a> &nbsp; &nbsp; <a
				herf="" class="templink" id="2001-4000">2001-4000</a> &nbsp; &nbsp;
				<a herf="" class="templink" id="4001-6000">4001-6000</a> &nbsp;
				&nbsp; <a herf="" class="templink" id="6001-8000">6001-8000</a>
				&nbsp; &nbsp; <a herf="" class="templink" id="8001-10000">8001-10000</a>
				&nbsp; &nbsp; <a herf="" class="templink" id="10001-20000">10001-20000</a>
				&nbsp; &nbsp; <a herf="" class="templink" id="20000以上">20000以上</a>
				&nbsp; &nbsp; 
		</div>
	</div>
	<input type="hidden" name="positionkey" id="positionkey">
	<input type="hidden" name="workkey" id="workkey">
	<input type="hidden" name="moneykey" id="moneykey">
	<div class="positionbottom">
		<font size=2 color=black>共找到<span id="sumcount">n</span>个职位满足条件</font>
	</div>
	<div id="content">
		<table border="0">
			<tr>
				<td>招聘名称</td>
				<td>公司名称</td>
				<td>工作地点</td>
				<td>职位月薪</td>
			</tr>
			<c:forEach var="list" items="${joblist}">
				<tr>
					<td><a
						href="lookRecuriment!lookonejob.action?id=${list.idEnterpriseRecruitment}&idEnterpriseInformation=${list.idEnterpriseInformation}"
						target="_blank">${list.name}</a>
					</td>
					<td>${list.idEnterpriseInformation}</td>
					<td>${list.workingPlace}</td>
					<td>${list.salary}</td>
				</tr>
			</c:forEach>
			</div>
		</table>
	</div>
	<div id="content2"></div>
	</div>
	</div>
	<!-- ----------------------当当前页数小于总页数时，出现首上下末---------------------------------------- -->
	<!-- ----------------------当当前页数等于总页数时，出现首上末---------------------------------------- -->
	<!-- ----------------------当当前页数等于首页时，出现首下末---------------------------------------- -->
	<div class="fenye" id="fenye">
		<c:if test="${recordCount==1 && pageNos==1}">
		</c:if>
		<c:if test="${recordCount>1 && pageNos==1}">
			<a href="searchjob!searchjob.action?pageNos=1&keyword=${key}">首页</a>
			<a
				href="searchjob!searchjob.action?pageNos=${pageNos+1}&keyword=${key}">下一页</a>
			<a
				href="searchjob!searchjob.action?pageNos=${recordCount}&keyword=${key}">末页</a>
		</c:if>
		<c:if test="${recordCount!=1 && pageNos==recordCount}">
			<a href="searchjob!searchjob.action?pageNos=1&keyword=${key}">首页</a>
			<a
				href="searchjob!searchjob.action?pageNos=${pageNos-1}&keyword=${key}">上一页</a>
			<a
				href="searchjob!searchjob.action?pageNos=${recordCount}&keyword=${key}">末页</a>
		</c:if>
		<c:if test="${pageNos>1  && pageNos<recordCount}">
			<a href="searchjob!searchjob.action?pageNos=1&keyword=${key}">首页</a>
			<a
				href="searchjob!searchjob.action?pageNos=${pageNos-1}&keyword=${key}">上一页</a>
			<a
				href="searchjob!searchjob.action?pageNos=${pageNos+1}&keyword=${key}">下一页</a>
			<a
				href="searchjob!searchjob.action?pageNos=${recordCount}&keyword=${key}">末页</a>
		</c:if>
		<form action="searchjob!searchjob.action" method="post">
			<h4 align="center">
				共<span id="sumpage">${recordCount}</span>页
				<c:choose>
					<c:when test="${recordCount==1}">

					</c:when>
					<c:otherwise>
						<input type="text" value="${pageNos}" name="pageNos" size="2"
							id="pageNos">页
					 <input type="submit" value="到达" onclick="return checknumber()">
					</c:otherwise>
				</c:choose>
				<input type="hidden" value="${recordCount}" name="recordCount"
					id="recordCount"> <input type="hidden" value="${key}"
					name="keyword">
			</h4>
		</form>
	</div>
	</div>
	<div id="bottom_footer">
		<script type="text/javascript" src="js/vsofooter.js"></script>
		<!--add experience-->
		<script type="text/javascript" src="js/experience.js"></script>
	</div>



</body>
<script type="text/javascript" src="js/jquery-1.11.3.js"></script>
<script type="text/javascript">
  //判断输入的页数的大小是否符合规定
  	function checknumber(){
  	    var recordCount=document.getElementById("recordCount").value ;
  	     var pageNos=document.getElementById("pageNos").value ;
  	     alert(recordCount);
  	     alert(pageNos);
  		if(parseInt(pageNos) <0){ 			
  			return false;
  		}
  		if(parseInt(pageNos) >parseInt(recordCount)){
  			return false;
  		}
  		else{ 		
  			return true;
  		}

  	}
  </script>

</html>
