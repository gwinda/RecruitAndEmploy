<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>查看所有简历</title>
<link href="resume/css/jwmanage.css" rel="stylesheet" />
<style type="text/css">
.middle {
	width: 80%;
	height: 500px;
	border: 1 px solid blue;
	
}
</style>
<!-- 技术不过关，只能代码长，
     分两种情况：
     		就是当简历数量小于2，即只有只有一份的时候，就固定显示一份简历和一封空在第一列，剩下两个显示在第二列
     		当简历数量大于等于2，就两个循环遍历出来，同时判断%2==0就可以了。    		
      -->
</head>
<body>
	<c:choose>
		<c:when test="${fn:length(resumelist)<2}">
			<c:if test="${fn:length(resumelist)==1}">
				<table cellspacing="1">
					<tr>
						<c:forEach var="list" items="${resumelist}" varStatus="status">
							<td><div
									id="ctl00_ContentPlaceHolder1_resumelist_ctl00_rItem"
									class="ResumeItem l ResumeItemChoose">
									<div class="Top">										
										<span class="Title">我的简历:${list.name}</span>
										<div class="Operating">
											<a
												href="lookOfupdate!lookOne.action?mess=lookOne&idResume=${list.IDResume}&idFK=${list.idPersonalInformation}"
												target="_blank">编辑</a> <a
												href="lookResume!lookOne.action?mess=lookOne&idResume=${list.IDResume}&idFK=${list.idPersonalInformation}"
												target="_blank">预览</a> <a
												href="delresume!delResume.action?mess=del&idResume=${list.IDResume}"
												onclick="javascript:if(window.confirm('删除简历后将无法进行恢复，你确定要进行删除吗？')==false) return false;">删除</a>
										</div>
										<div class="Info">
											<br /> <span>创建时间：<fmt:formatDate
													value="${list.createTime}" dateStyle="long" />
											</span><br /> <span>最近更新时间：<fmt:formatDate
													value="${list.updateTime}" dateStyle="long" />
											</span><br />
										</div>
										<div class="JwButton AuditedIcon" title="该简历已通过审核"></div>
									</div>
									<div class="Middle">
										<strong>工作地点：</strong><br /> <font style="margin-left:40px;">
											${list.workingPlace}</font><br /> <strong>求职意向：</strong><br /> <font
											style="margin-left:40px;">${list.position}</font><br />
									</div>
								</div></td>
						</c:forEach>
						<td><div class="ResumeItem l">
								<div class="CreateResume">
									<a href="jsp/Personal/ResumeCreateJsp.jsp" class="JwButton CreateResumeIcon"
										style="display: block;"></a> <br /> 多一份选择，多一份机遇
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<c:forEach begin="1" end="2" step="1">
							<td><div class="ResumeItem l">
									<div class="CreateResume">
										<a href="ResumeCreateJsp.jsp"
											class="JwButton CreateResumeIcon" style="display: block;"></a>
										<br /> 多一份选择，多一份机遇
									</div>
								</div></td>
						</c:forEach>
					</tr>
				</table>
			</c:if>
		</c:when>


		<c:otherwise>
			<div class="middle">
				<div
					style="width: 906px; margin-left: -36px; _margin-left: -72px; _width: 942px;">
					<table cellspacing="1">
						<tr>
							<c:forEach var="list" items="${resumelist}" varStatus="status">
								<td><div
										id="ctl00_ContentPlaceHolder1_resumelist_ctl00_rItem"
										class="ResumeItem l ResumeItemChoose">
										<div class="Top">
											<div class="Operating">
												<a
													href="lookOfupdate!lookOne.action?mess=lookOne&idResume=${list.IDResume}&idFK=${list.idPersonalInformation}">编辑</a>
												<a
													href="lookResume!lookOne.action?mess=lookOne&idResume=${list.IDResume}&idFK=${list.idPersonalInformation}"
													target="_blank">预览</a> <a
													href="delresume!delResume.action?mess=del&idResume=${list.IDResume}"
													onclick="javascript:if(window.confirm('删除简历后将无法进行恢复，你确定要进行删除吗？')==false) return false;">删除</a>
											</div>
											<div class="Info">
												<span class="Title">我的简历:${list.name}</span><br /> <span>创建时间：<fmt:formatDate
														value="${list.createTime}" dateStyle="long" />
												</span><br /> <span>最近更新时间：<fmt:formatDate
														value="${list.updateTime}" dateStyle="long" />
												</span><br />
											</div>
											<div class="JwButton AuditedIcon" title="该简历已通过审核"></div>
										</div>
										<div class="Middle">
											<strong>工作地点：</strong><br /> <font style="margin-left:40px;">
												${list.workingPlace}</font><br /> <strong>求职意向：</strong><br /> <font
												style="margin-left:40px;">${list.position}</font><br />
										</div>
										<div class="Bottom"></div>
									</div></td>
								<c:if test="${status.count%2==0}">
									<tr></tr>
								</c:if>
							</c:forEach>
							<c:forEach begin="1" end="${4-fn:length(resumelist)}" step="1"
								var="i">
								<td><div class="ResumeItem l">
										<div class="CreateResume">
											<a href="jsp/Personal/ResumeCreateJsp.jsp"
												class="JwButton CreateResumeIcon" style="display: block;"></a>
											<br /> 多一份选择，多一份机遇
										</div>
									</div></td>

							</c:forEach>
						</tr>
					</table>
				</div>
			</div>
		</c:otherwise>
	</c:choose>


</body>
</html>