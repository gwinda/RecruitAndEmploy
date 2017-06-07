<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>查看我的收藏</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
body{
	font-size:19px;
}
	.innerbodywrapper {	
    width: 950px;
    margin: 9px;
    padding: 20px 0 20px 0;
    background-color: #FFFFFF;
}
.DataTable {
    margin: auto;
    width: 95%;
    font-size: 17px;
    font-family:FangSong;
}
.caption {
    height: 60px;
    background-color: #FFFFFF;
    line-height: 60px;
    position: relative;
    border: 1px solid #EEEEEE;
    margin-bottom: 10px;
}
.clear {
    clear: both;
}


.JwButton {
    background:#A6DCDC;
    border: 0;
    height: 31px;
    width:50px;
    cursor: pointer;
    vertical-align: middle;
}
.menu{
	font-weight:bold;
}
</style>
<script type="text/javascript">
function post(Button) {

		var checkbox = document.getElementsByName("kk");
		var checkboxnew = "";

		for (i = 0; i < checkbox.length; i++) {
			//判断是否选中
			if (checkbox[i].checked) {
				checkboxnew = checkboxnew + checkbox[i].value + ",";
			}
		}
}
function CommSelect() {
		var checkbox = document.getElementsByName("ChkSelect");
		var checkboxnew = "";
		var check= document.getElementById("selectOr");
		if(check.checked){
		for (i = 0; i < checkbox.length; i++) {
			checkbox[i].checked=true;
			//判断是否选中
				if (checkbox[i].checked) {
					checkboxnew = checkboxnew + checkbox[i].value + ",";
				}
			}
		}
		else{
			for (i = 0; i < checkbox.length; i++) {
			checkbox[i].checked=false;
			//判断是否选中
			
			}
		}
}
</script>
  </head>
  
  <body>
  <%-- <table border="2" width="40%" >
  		<tr align="center" >
	  		<td>收藏信息名称</td>
	  		<td>链接</td>
  		</tr>
    <c:forEach items="${collectionlist}" var="collect" >
    	
    	<tr align="center">
    		
    		<td>${collect.name} </td>
    		<td><a href="lookRecuriment!lookonejob.action?id=${collect.idEnterpriseRecruitment}&&idEnterpriseInformation=${collect.idEnterpriseInformation}" target="_blank">查看详情</a>
    		 </td>    		
    	</tr>
   	
    </c:forEach>
   </table>  --%>
   <form action="deleteCollection" method="post">
   <div class="caption">
    <div class="l">
        <em></em>
        <label>职位收藏夹</label>
        <span class="counts">共计：${fn:length(collectionlist)} 条</span>
    </div>
    
    <div class="clear"></div>
</div>
   		<div class="innerbodywrapper" style="padding: 0">
                <table class="DataTable" border="0" cellspacing="0" cellpadding="3">                  
                    <tr >
                        <td width="30" align="center" class="menu"></td>
                        <td class="menu">职位名称
                        </td>
                        <td class="menu">企业名称
                        </td>
                        <td class="menu">职位有效日期
                        </td>
                        <td class="menu">收藏时间
                        </td>
                    </tr> 
                    <c:forEach items="${collectionlist}" var="collect" >     
                            <tr>
                                <td align="center" class="indextr1">
                                    <input id="ctl00_ContentPlaceHolder1_mylist_ctl00_ChkSelect" type="checkbox" name="ChkSelect" value="${collect.id}">
                                    
                                    
                                </td>
                                <td class="indextr1" >
                                    <a href="lookRecuriment!lookonejob.action?id=${collect.idEnterpriseRecruitment}&&idEnterpriseInformation=${collect.idEnterpriseInformation}" target="_blank" style="font-size: 18px;color:blue;">
                                        ${collect.name}</a>
                                </td>
                                <td class="indextr1">
                                    ${collect.company}
                                </td>
                                <td class="indextr1">
                                    
                                    <fmt:formatDate value="${collect.endtime}" dateStyle="long" />
                                </td>
                                <td class="indextr1">
                                    
                                    <fmt:formatDate value="${collect.createTime}" dateStyle="long" />
                                </td>
                            </tr>
                        
                        </c:forEach>   
                           
                           
                        
                
                </table>
                <table width="95%" style="margin: auto" border="0" cellspacing="0" cellpadding="3" id="pagelist">
                    <tbody><tr>
                        <td height="50" class="indextr1">
                            <input type="checkbox" id="selectOr" onclick="CommSelect()">
                            全选&nbsp;
                             <input type="submit" name="ctl00$ContentPlaceHolder1$delbutton" value="删除" onclick="if(window.confirm('您确认删除选中的记录吗？')==false) return false;" id="ctl00_ContentPlaceHolder1_delbutton" class="JwButton BtnDel">
                            &nbsp;
                           
                        <td colspan="3" align="right" class="indextr1">
                            
                        </td>
                    </tr>
                </tbody></table>
            </div>
            </form>
  </body>
</html>
