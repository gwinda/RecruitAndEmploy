<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'feedback.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
<style type="text/css">
	body{
		font-size:16px;
	}
	a{
		color:blue;
	}
	a：hover{
		color:red;
	}
	.bianji{
		display:none;
	}
</style>
  </head>
  <script type="text/javascript">
  function addCheckBox(){
  alert("aa");
  	$(".bianji").attr("style","display:block");
  	$(".bianjibox").attr("style","display:block");
  	
  	return false;
  }
  
  </script>
  <body>
   <div id="feebacklook"  style="display:block;">
	<div class="alignright">
		<a href="ApplicationAction.action?opera=all&user=1" >全部</a> <a
			href="ApplicationAction.action?opera=notsee&user=1">未查看</a> <a
			href="ApplicationAction.action?opera=see&user=1">已查看</a> <a
			href="ApplicationAction.action?opera=invite&user=1">职位邀请</a> <a
			href="ApplicationAction.action?opera=refuse&user=1">拒绝</a>
		<hr>
	</div>
	<div id="msubscriplook" style="display:block">
		<my style="font-size:20px;color:gray;">提示：点击简历或公司可进入招聘页面</my>									
					<table cellspacing="1">					
						<c:forEach var="list" items="${applitionlist}" varStatus="status">
								<tr>
								<td id="bianji" class="bianji"><input type="checkbox" id="bianjibox" name="box" value="${list.idEnterpriseRecruitment}"> <input type="button" value="删除" onclick="post()"/></td>
								<td><div
										id="ctl00_ContentPlaceHolder1_resumelist_ctl00_rItem"
										class="ResumeItem l ResumeItemChoose" style="width:700px;border:1px #E6DBDB solid; font-weight:bold;color:#1E3A3E;    margin-top:2px;font-family:FangSong;">
										<div class="Top1" > 										
											<span class="Title1">应聘职位：<a href="ApplicationAction!lookResumeByR.action?mess=lookOne&idResume=${list.idResume}" target="_blank"/>${list.recruitname}</a></span>											
											<div class="Operating1" style="float:right;">
												投递状态：<strong style="color:black;margin-right:30px;"> ${list.state}</strong>
																													
											</div>
											
											<div class="Info1" style="margin-top:7px;">
												 公司名称：<a href="Ei?eiid=${list.eiid}" target="_blank"/>${list.ename}</a>						
												 <span style="float:right">
												  投递时间：${list.time} 
												</span>
												</span>
											</div>
											<div >
											<c:if test="${ list.state=='邀请'}">
												
												面试时间与地点：<B style="color:red;">${list.remark}  </B>
													</c:if>				
												<c:if  test="${ list.state=='拒绝'}">
												
													<B> 拒绝理由：${list.remark} </B>
												</c:if>
												</div>
										</div>
										
									</div>
								</td>									
								</tr>
							</c:forEach>
				</table>	
		</div>
</div>

	
  </body>
</html>
