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
<script type="text/javascript" src="js/cookie.js"></script>
<script type="text/javascript" src="js/referer_getter.js"></script>
<script language="javascript" type="text/javascript"
	src="DatePicker/WdatePicker.js"></script>
<!-- 全选 -->
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
	function post(Button) {

		var checkbox = document.getElementsByName("kk");
		var checkboxnew = "";
		if (Button.value == "邀请") {
			var button = "1";
		} else if (Button.value == "拒绝") {
			var button = "2";
		} else
		{
			var button = "3";
		}

		for (i = 0; i < checkbox.length; i++) {
			//判断是否选中
			if (checkbox[i].checked) {
				checkboxnew = checkboxnew + checkbox[i].value + ",";
			}
		}
		document.getElementsByName("kk");
		alert(button);
		document.allopration.action = "ApplicationAction!allopration?checkboxnew="
				+ checkboxnew + "&mybutton=" + button;
		document.allopration.submit();
	}
</script>
<style>
.alignright {
	text-align: right
}

.alignleft {
	float: left;
}

.vso-copyright-wrap {
	margin-top: 25px;
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

my1 input[type="submit"] {
	width: 36px;
	height: 18px;
	margin-left: 5px;
}
</style>

</head>


<body>
	<div class="alignleft">
		<form action="ApplicationAction!selectRecruit">
			<font color=gray>筛选：</font> <B>招聘名称:</B>&nbsp;&nbsp; <select
				name="selectRecruit">
				<option value="0">不限</option>
				<s:iterator value="#session.recruitmentlist" id="recruitment"
					status="status">

					<option
						value=<s:property value="#recruitment.idEnterpriseRecruitment"/>>
						<s:property value="#recruitment.name" />
					</option>

				</s:iterator>
			</select> <B>发布时间:</B>&nbsp;&nbsp;<input name="createdatetimeStart"
				style="width: 125px;"
				onFocus="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
			至 <input name="createdatetimeEnd" style="width:125px;"
				onFocus="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
			<my> <input type="button" value="搜索"
				onclick="this.form.submit()"></my>

		</form>

		<input type="checkbox" name="all" onclick="allCheck(this)"><B>全选</B>
		<input type="button" value="邀请" onclick="post(this);" id="mybutton"
			name="mybutton" /> <input type="button" value="拒绝"
			onclick="post(this);" name="button">
			<input type="button" value="下载"
			onclick="post(this);" name="button">
	</div>

	<div class="alignright">
		<a href="ApplicationAction.action?opera=all&user=2">全部</a> <a
			href="ApplicationAction.action?opera=notsee&user=2">未查看</a> <a
			href="ApplicationAction.action?opera=see&user=2">已查看</a> <a
			href="ApplicationAction.action?opera=invite&user=2">职位邀请</a> <a
			href="ApplicationAction.action?opera=refuse&user=2">拒绝</a> <a herf="">已结束</a><br>
		<hr>
	</div>
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
	<B><s:property value="#session.result" /> </B>&#12288;&#12288; 当前筛选：
	<B><s:property value="#session.selectRecruitname" /> </B>&nbsp;
	<B><s:property value="#session.daysname" /> </B>&nbsp;
	<B><s:property value="#session.dayename" /> </B>&nbsp;
	<B><s:property value="#request.state" /> </B>&nbsp;



	<br>
	<br>
	<form action="ApplicationAction!allopration" id="allopration"
		method="post" name="allopration"></form>
	<s:iterator value="#request.AERR" id="AERR" status="status">
		<div class="alignleft">

			<input type="checkbox" name="kk"
				value="<s:property value="#AERR.idResume"/>,<s:property value="#AERR.idEnterpriseRecruitment"/>">

		</div>
     
                  简历名称&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <a
			href="ApplicationAction!lookResumeByR.action?mess=lookOneByER&idResume=<s:property value="#AERR.idResume"/>&idEnterpriseRecruitemnt=<s:property value="#AERR.idEnterpriseRecruitment"/>">
			<s:property value="#AERR.rname" /> </a>
		<br> 
                   &#12288;申请用户&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <s:property value="#AERR.einame" />
		</a>
		<br> 
                   &#12288;招聘名称&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <B><s:property value="#AERR.ecname" /> </B>
		</a>
		<br>
		<!--   &#12288;公司名称&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <s:property value="#AERR.einame"/>  <br>  
                    -->      
                   &#12288;简历状态&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <s:property value="#AERR.vstate" />
		<br> 
                   &#12288;投递时间&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <s:property value="#AERR.vtime" />
		<br> 
                    &#12288;发布时间&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <B><s:property value="#AERR.startTime" /> </B>
		<br> 
                   &#12288;结束时间&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                    <s:property value="#AERR.endtime" />
		<br>
		<a
			href="ApplicationAction!lookResumeByR.action?mess=inviteclick&idResume=<s:property value="#AERR.idResume"/>&idRecruitemnt=<s:property value="#AERR.idEnterpriseRecruitment"/>">
			&#12288;邀请面试</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
     <a
			href="ApplicationAction!lookResumeByR.action?mess=rufuseclick&idResume=<s:property value="#AERR.idResume"/>&idRecruitemnt=<s:property value="#AERR.idEnterpriseRecruitment"/>">
			拒绝</a>
		</div>
		<hr>
	</s:iterator>
	<B><s:property value="#request.pr" /> </B>
	 <B><s:property value="#request.download" /> </B>
	<br>
	<form action="ApplicationAction!pagination">
		<my1> <s:if test="#request.AERR!= null">

			<B>-第<s:property value="#request.nowpage" />页/共<s:property
					value="#session.mysize" />页-</B>
			<br>
			<B>选择页码:&#12288;</B>
			<input type="text" name="page">
			<input type="submit" value="跳转">
			<my1>
		</s:if>
	</form>
</body>

</html>
