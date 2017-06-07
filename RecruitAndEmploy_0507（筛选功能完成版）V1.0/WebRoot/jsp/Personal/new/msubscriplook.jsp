<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'msubscriplook.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link href="resume/css/jwmanage.css" rel="stylesheet" />
<style type="text/css">
body{
	font-family:楷体;
}
.middle {
	width: 50%;
	height: 400px;
	border: 1 px solid blue;
	
}
my	P {
	background: #5D5D5D;
	width: 150px;
	height: 35px;
	line-height: 35px;
	text-align: center;
	font-size: 13px;
	color: white;
 }
</style>
  </head>
  <script type="text/javascript">
  	function addcheck(length){
  		if(length>=4){
  			alert("简历至多可创建四份,如需新建请删除后再进行此操作！");
  			return false;
  			
  		}
  		else{
  			return true;
  		}
  	}
  </script>
  <body>
    <!-- 简历查看-->
	<div id="msubscriplook" style="display:block">
		<my style="font-size:20px;color:gray;">提示：每名用户至多可建立四个简历</my>  
		<a href="jsp/Personal/ResumeCreateJsp.jsp" style="font-size:18px;" onclick="return addcheck(${fn:length(resumelist)})">添加简历</a>							
					<table cellspacing="1">					
						<c:forEach var="list" items="${resumelist}" varStatus="status">
								<tr><td><div
										id="ctl00_ContentPlaceHolder1_resumelist_ctl00_rItem"
										class="ResumeItem l ResumeItemChoose" style="width:700px;height:60px;border:1px #E6DBDB solid; box-shadow: -4px 7px 15px 1px rgba(118, 95, 91, 0.34);font-weight:bold;color:#6FC19B;font-family:FangSong;">
										<div class="Top1" > 										
											<span class="Title1">我的简历:${list.name}</span>
											<div class="Operating1" style="float:right">
												<a
													href="lookOfupdate!lookOne.action?mess=lookOne&idResume=${list.IDResume}&idFK=${list.idPersonalInformation}"
													>编辑</a> <a
													href="lookResume!lookOne.action?mess=lookOne&idResume=${list.IDResume}&idFK=${list.idPersonalInformation}"
													target="_blank">预览</a> <a
													href="delresume!delResume.action?mess=del&idResume=${list.IDResume}"
													onclick="javascript:if(window.confirm('删除简历后将无法进行恢复，你确定要进行删除吗？')==false) return false;">删除</a>
											</div>
											<hr style="color:whihe;">
											<div class="Info1">
												 求职意向： <font
												style="">${list.position}</font>						
												 <span style="float:right">&nbsp;&nbsp;更新时间：<fmt:formatDate
														value="${list.updateTime}" />
												</span>
												</span>
											</div>											
										</div>
										
									</div></td>									
									</tr>
							</c:forEach>
				</table>	
	</div>
  </body>
</html>
