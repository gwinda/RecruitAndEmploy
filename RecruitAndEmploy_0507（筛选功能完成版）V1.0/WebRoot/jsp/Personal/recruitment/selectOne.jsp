<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>选择一个简历</title>
<link href="resume/css/jwmanage.css" rel="stylesheet"/>
<style type="text/css">
.middle{
	width:80%;
	height:800px;
	border:1 px solid red;
}

</style>
  <!-- 技术不过关，只能代码长，
     分两种情况：
     		就是当简历数量小于2，即只有只有一份的时候，就固定显示一份简历和一封空在第一列，剩下两个显示在第二列
     		当简历数量大于等于2，就两个循环遍历出来，同时判断%2==0就可以了。    		
      -->
      
</head>
<body>
     
      <h4> 请选择您的一份简历或新建</h4>
      <a href="ResumeCreateJsp.jsp" >新建简历</a>
    	<form action="ApplicationAction!add" method="post">
     		 	<div class="middle">
					<div style="width: 1006px; margin-left: -36px; _margin-left: -72px; _width: 942px;">
					 <table cellspacing="1" >     
					 <tr>          
					<c:forEach var="list" items="${resumelist}" varStatus="status">
						
						<td>
							<div id="ctl00_ContentPlaceHolder1_resumelist_ctl00_rItem" class="ResumeItem l ResumeItemChoose">                   					                     
					                     <div class="Top">
					                            <div class="Operating">
					                            	   <input type="radio" name="which" value="${list.IDResume}"/>选择
					                                   <a href="lookOfupdate!lookOne.action?mess=lookOne&idResume=${list.IDResume}&idFK=${list.idPersonalInformation}" target="_blank" >编辑</a>               
					                                   <a href="lookResume!lookOne.action?mess=lookOne&idResume=${list.IDResume}&idFK=${list.idPersonalInformation}" target="_blank">预览</a>			                                 
					                             </div>
					                             <div class="Info">
					                                    <span class="Title">我的简历:${list.name}</span><br/>
					                                    <span>创建时间：<fmt:formatDate value="${list.createTime}"  dateStyle="long"/></span><br/>
					                                    <span>最近更新时间：<fmt:formatDate value="${list.updateTime}"  dateStyle="long"/></span><br/>
					                             </div>
					                                <div class="JwButton AuditedIcon" title="该简历已通过审核"></div>
					                            </div>
					                            <div class="Middle">
					                                <strong>工作地点：</strong><br/>
					                              			<font style="margin-left:40px;"> ${list.workingPlace}</font><br/>
					                                <strong>求职意向：</strong><br/>
					                              		  <font style="margin-left:40px;">${list.position}</font><br/>
					                            </div>
					                            <div class="Bottom">                          
					                     </div>
					               </div>              
					          </td>
					          <c:if test="${status.count%2==0}">
					          <tr></tr>
					          </c:if>		         
					        </c:forEach>				 		
					     </tr>    
					       </table>
					     </div>
					</div>  
					<hr/>   		 
		<input type="submit" value="确定投递"/>
    </form> 
</body>
</html>