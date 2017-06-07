<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'HaveResumeJsp.jsp' starting page</title>

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

<!-- 全选 -->
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
<script language="javascript">
	function allCheck(check) {
		var checkbox = document.getElementsByName("kk");
		if (check.checked) {
			for ( var i = 0; i < checkbox.length; i++) {
				checkbox[i].checked = "checked";
			}
		} else {
			for ( var i = 0; i < checkbox.length; i++) {
				checkbox[i].checked = "";
			}
		}
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
<script>
	function post(Button) {

		var checkbox = document.getElementsByName("kk");
		var checkboxnew = "";

		for (i = 0; i < checkbox.length; i++) {
			//判断是否选中
			if (checkbox[i].checked) {
				checkboxnew = checkboxnew + checkbox[i].value + ",";
			}
		}

		if (checkboxnew != "") {
			if (Button.value == "邀请") {
				var button = "1";
				var name = prompt("请输入面试时间与地点：", "");//将输入的内容赋给变量 name ，
				if (name != null && name != null) {
					document.allopration.action = "ApplicationAction!allopration?checkboxnew="
							+ checkboxnew
							+ "&mybutton="
							+ button
							+ "&name="
							+ name;
					document.allopration.submit();
				}
			} else if (Button.value == "拒绝") {
				var button = "2";
				var name = prompt("请输入拒绝理由：", "");//将输入的内容赋给变量 name ，
				if (name != null) {
					document.allopration.action = "ApplicationAction!allopration?checkboxnew="
							+ checkboxnew
							+ "&mybutton="
							+ button
							+ "&name="
							+ name;
					document.allopration.submit();
				}
				//这里需要注意的是，prompt有两个参数，前面是提示的话，后面是当对话框出来后，在对话框里的默认值

			} else if (Button.value == "下载"){
				var button = "3";
				document.allopration.action = "ApplicationAction!allopration?checkboxnew="
						+ checkboxnew + "&mybutton=" + button;
				document.allopration.submit();
			}else if (Button.value == "收藏"){
			    var button = "4";

				var action = "ApplicationAction!allopration?checkboxnew="
						+ checkboxnew + "&mybutton=" + button+ "&name="
							+ name;;
				openLogin3(action);
			    
			}else{}

		} else {
			alert("你没有选中任何信息!");
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
function openLogin3(action){
   var actiona=action;
   document.allopration.action=action;
   alert(actiona);
   document.getElementById("win3").style.display="";
}
function closeLogin3(){
   document.getElementById("win3").style.display="none";
}
function ecoll(classid){
document.allopration.action=document.allopration.action+"&eclass="+classid;
document.allopration.submit();
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
	text-align: left;
}

.alignleft {
	float: left;
}

.vso-copyright-wrap {
	margin-top: 25px;
}

input[type="date"] {
	width: 250px;
	height: 35px;
	margin-top: 5px;
}

select {
	width: 125px;
	height: 30px;
	margin-top: 5px;
}

my select {
	width: 250px;
	height: 30px;
	margin-top: 5px;
}

textarea {
	width: 250px;
	height: 70px;
	margin-top: 5px;
}

input[type="submit"] {
	width: 80px;
	height: 35px;
	margin-top: 10px;
}

input {
	width: 70px;
	height: 30px;
}

input[type="button"] {
	width: 50px;
	height: 25px;
	margin-left: 11px;
}

input[type="checkbox"] {
	width: 13px;
	height: 13px;
}

my input[type="button"] {
	width: 56px;
	height: 30px;
	margin-left: 5px;
}

my1 input[type="text"] {
	width: 150px;
	height: 30px;
	margin-bottom: 40px;
}

my input[type="text"] {
	width: 250px;
	height: 35px;
	margin-top: 5px;
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

body {
	padding-left: 15%;
	padding-right: 15%
}

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
	filter: alpha(opacity =     90);
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
	filter: alpha(opacity =     90);
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

.addiv {
	text-align: right;
	width: 10%;
	height: 200px;
	position: fixed;
	top: 170px;
	opacity: 1;
	background: #ddd;
	margin-left: 60%;
}

.addiv1 {
	text-align: right;
	width: 10%;
	height: 200px;
	position: fixed;
	top: 400px;
	opacity: 1;
	background: #ddd;
	margin-left: 60%;
}

my1 input[type="submit"] {
	width: 56px;
	height: 30px;
	margin-left: 5px;
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
					<li><a href="index2.jsp"><font color="#000">首页</font> </a>
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
								<li><a target="_blank"> <a href="Ei" target="rightlook">我的信息</a></font>
								</a></li>
								<li><a target="_blank"> <font color="white"><a
											href="javascript:openLogin();" target="rightlook"
											target="_blank">发布招聘</a> </font> </a></li>
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
					<a class="m-orange-bg" onclick="zhuxiao()"><font color="#000">注销</font>
					</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<br>
	<div class="mytop">
		<img src="personPicture/i.jpg" width="100%" height="100%">
	</div>
	<BR>
	<div class="alignright">
		<a href="ApplicationAction.action?opera=all&user=2">全部</a>&#12288; <a
			href="ApplicationAction.action?opera=notsee&user=2">未查看</a>&#12288; <a
			href="ApplicationAction.action?opera=see&user=2">已查看</a>&#12288; <a
			href="ApplicationAction.action?opera=invite&user=2">职位邀请</a>&#12288;
		<a href="ApplicationAction.action?opera=refuse&user=2">拒绝</a>
		<!--  <a
			href="ApplicationAction.action?opera=over&user=2">已结束</a>-->
		<BR> <BR>
	</div>
	<div class="alertdiv"></div>
	<div class="alignleft">
		<form action="ApplicationAction!selectRecruit">
			<font color=gray>筛选：</font> 招聘名称:&nbsp;&nbsp; <select
				name="selectRecruit">
				<option value="0">不限</option>
				<s:iterator value="#session.recruitmentlist" id="recruitment"
					status="status">

					<option
						value=<s:property value="#recruitment.idEnterpriseRecruitment"/>>
						<s:property value="#recruitment.name" />
					</option>

				</s:iterator>
			</select> &#12288;&#12288;&#12288;发布时间:&nbsp;&nbsp;<input
				name="createdatetimeStart" style="width: 125px;"
				onFocus="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
			至 <input name="createdatetimeEnd" style="width:125px;"
				onFocus="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
			<my> &#12288;<input type="button" value="搜索"
				onclick="this.form.submit()"></my>

		</form>
		<BR> <input type="checkbox" name="all" onclick="allCheck(this)">全选/全不选&#12288;
		<input type="button" value="邀请" onclick="post(this);" id="mybutton"
			name="mybutton" /> <input type="button" value="拒绝"
			onclick="post(this);" name="button"> <input type="button"
			value="下载" onclick="post(this);" name="button"> <input
			type="button" value="收藏" onclick="post(this);" name="button">

	</div>
	<br>
	<br>
	<br>


	<!-- <s:iterator value="#request.applitionlist" id="myapplition" status="status">  
      <div class="alignleft">
     <input type=checkbox name="kk">
     </div>
       <div> 
     
                  简历名称&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <a href="ApplicationAction!lookResumeByR.action?mess=lookOneByER&idResume=<s:property value="#AERR.idResume"/>&idEnterpriseRecruitemnt=<s:property value="#AERR.idEnterpriseRecruitment"/>">
  <s:property value="#myapplition.resumename"/></a><br> 
                   &#12288;申请用户&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <a href=""></a><br> 
                   &#12288;招聘名称&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <a href=""><s:property value="#myapplition.idEnterpriseRecruitment"/></a><br> 
                   &#12288;公司名称&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <br>        
                   &#12288;简历状态&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <s:property value="#myapplition.state"/><br> 
                   &#12288;投递时间&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <s:property value="#myapplition.time"/> <br> 
                   &#12288;结束时间&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>          
     <a href="ApplicationAction!lookResumeByR.action?mess=inviteclick&idResume=<s:property value="#aerr.idResume"/>&idEnterpriseRecruitemnt=<s:property value="#aerr.idEnterpriseRecruitment"/>">
                  &#12288;邀请面试</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     <a href="ApplicationAction!lookResumeByR.action?mess=rufuseclick&idResume=<s:property value="#aerr.idResume"/>&idEnterpriseRecruitemnt=<s:property value="#aerr.idEnterpriseRecruitment"/>">
                 拒绝</a>  
    </div>             
     <hr>
   
    </s:iterator> 
     -->
	<BR>
	<br>
	<HR>
	<form action="ApplicationAction!allopration" id="allopration"
		method="post" name="allopration"></form>
	<B><s:property value="#session.result" /> </B>&#12288;&#12288; 当前筛选：
	<B><s:property value="#session.selectRecruitname" /> </B>&nbsp;
	<B><s:property value="#session.daysname" /> </B>&nbsp;
	<B><s:property value="#session.dayename" /> </B>&nbsp;
	<B><s:property value="#request.state" /> </B>&nbsp;
	<BR>
	<BR>
	<BR>
	<s:iterator value="#request.AERR" id="AERR" status="status">


		<div class="alignleft">

			<input type="checkbox" name="kk"
				value="<s:property value="#AERR.idResume"/>,<s:property value="#AERR.idEnterpriseRecruitment"/>">

		</div>

		<table width="90%">
			<tr>

				<td rowspan="4" width="80" height=""><img
					src="<s:property value="#AERR.picture"/>" width="90" height="110" />
				</td>
				<td colspan="3"><a
					href="ApplicationAction!lookResumeByR.action?mess=lookOneByER&idResume=<s:property value="#AERR.idResume"/>&idEnterpriseRecruitemnt=<s:property value="#AERR.idEnterpriseRecruitment"/>"
					target="view_window"> <font size="4"><s:property
								value="#AERR.einame" /> </font> </a>
				</td>

			</tr>
			<tr>

				<td width="350px" colspan="3"></td>

			</tr>
			<tr>

				<td width="350px" colspan="3"><s:property value="#AERR.school" />(<s:property
						value="#AERR.education" />)</td>

			</tr>
			<tr>

				<td width="180">应聘 <a
					href="lookRecuriment!lookonejob.action?id=<s:property
			value="#AERR.idEnterpriseRecruitment" />&idEnterpriseInformation=<s:property
			value="#AERR.idEnterpriseInformation" /> "
					target="view_window"> <s:property value="#AERR.ecname" /> </a>
				</td>

				<td>&#12288;&#12288;&#12288;状态:<s:property value="#AERR.vstate" />
				</td>
				<td align="right">&#12288;&#12288;<s:property
						value="#AERR.startTime" />&#12288;<B>>></B>&#12288;<s:property
						value="#AERR.endtime" /></td>

			</tr>



		</table>

		<BR>
		<BR>


		<!--   申请用户&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <a href="ApplicationAction!lookResumeByR.action?mess=lookOneByER&idResume=<s:property value="#AERR.idResume"/>&idEnterpriseRecruitemnt=<s:property value="#AERR.idEnterpriseRecruitment"/>">
			<s:property value="#AERR.einame" /> </a>
		<br> 
                <!--   &#12288;简历名称&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <s:property value="#AERR.rname" /> 

                   &#12288;申请职位&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<s:property value="#AERR.ecname" /> 
		</a>
		<br>
		<!--   &#12288;公司名称&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <s:property value="#AERR.einame"/>  <br>  
                        
                   &#12288;状&#12288;&#12288;态&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <font color="000"><s:property value="#AERR.vstate" /></font>
		<br> 
		  &#12288;发布时间&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <s:property value="#AERR.startTime" /> 
		<br> 
                   &#12288;投递时间&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <s:property value="#AERR.vtime" />
		<br> -->

		<!--  &#12288;结束时间&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                    <s:property value="#AERR.endtime" />
		<br>-->
		<!--<s:if test='{#<s:property value="#AERR.vstate" />!="邀请"||<s:property value="#AERR.vstate" />!="拒绝"}'>
		<a
			href="ApplicationAction!lookResumeByR.action?mess=inviteclick&idResume=<s:property value="#AERR.idResume"/>&idRecruitemnt=<s:property value="#AERR.idEnterpriseRecruitment"/>">
			&#12288;邀请面试</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
     <a
			href="ApplicationAction!lookResumeByR.action?mess=rufuseclick&idResume=<s:property value="#AERR.idResume"/>&idRecruitemnt=<s:property value="#AERR.idEnterpriseRecruitment"/>">
			拒绝</a>
			</s:if>-->
		</div>
		<BR>

	</s:iterator>
	<B><s:property value="#request.pr" /> </B>
	<B><s:property value="#request.download" /> </B>
	<br>
	<form action="ApplicationAction!pagination">
		<my1> <s:if test="#request.AERR!= null">

			<B>-第<s:property value="#request.nowpage" />页/共<s:property
					value="#session.mysize" />页-</B>
			<br>
			<br>
			选择页码:&#12288;
			<my1> <input type="text" name="page"> <input
				type="submit" value="跳转"> <my1>
		</s:if>
	</form>
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
		
		<div id=win3
		style="display:none; POSITION:absolute; left:50%; top:50%; width:300px;  margin-left:-150px;  border:1px solid #888; background-color:#edf; text-align:left">
		选择一个收藏类别<BR><BR>
        <s:iterator value="#session.listEcollectionClass" id="listEcollectionClass" status="status">
        
         <s:property value="#listEcollectionClass.name" />
        <a href="javascript:ecoll(<s:property value="#listEcollectionClass.id" />)">选择</a>
<BR> <BR>
  </s:iterator><BR>
		<a href="javascript:closeLogin3();">取消</a>
		</div>
		

		
		
		<div><a href="javascript:openLogin1();" target="rightlook" target="_blank">广告服务</a><a href="javascript:openLogin2();" target="rightlook" target="_blank">&#12288;&#12288;联系我们</a><BR><BR>
		京 ICP 证 09002463 号|Copyright © 1999-2016, ZHUHAIZP.NET, All Rights Reserved <BR><BR><BR></div>
	
</body>

</html>
