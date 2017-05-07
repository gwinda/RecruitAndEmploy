<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'lookperson.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link type="text/css" rel="stylesheet" href="css/common.css?v=20150807"/>
    <!--css-->
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="css/rc_index.css">
    <!--jquery-->
    <script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <!--cookie domain-->
    <script type="text/javascript" src="js/cookie.js"></script>
    <script type="text/javascript" src="js/referer_getter.js"></script>
	<script src="js/check.js"></script>
	
     <link rel="stylesheet" href="resume/js/style.css" >
     <style type="text/css">
     .right_photo{
	
	display:block;
	float:right;
	width:140px;
	height:160px;
	background:url("resume/img/nop.jpg");
	background-size:100%;	
	} 
	.img{
		 width:140px;
		  height:159px;
	}
 
     </style>
  </head>  
  <body>
   <a href="beforeupdateperson!look.action?idPerson=${OnePerson.idPersonalInformation}"><font style="font-size:16px; color:blue;">编辑基本信息</font></a>
 		<div class="right_photo">
		 	<c:choose>
		    	<c:when test="${OnePerson.picture!=null}">
		     		<img class="img" src="personPicture/${OnePerson.picture}" />
		   		</c:when>
		    	<c:otherwise>
		    		 <a href="beforeupdateperson!look.action?idPerson=${OnePerson.idPersonalInformation}" class="right_photo"></a>
		   		</c:otherwise>
			</c:choose>
		</div>	
		
						
    <section class="section brd-btm">   		
            <div class="row">
                <div class="col-sm-6 clear-mrg">
                    <h4 class="title-thin text-muted">基本资料</h4>
                    <dl class="dl-horizontal clear-mrg">
                        <dt class="text-upper">姓    名</dt>
                        <dd>${OnePerson.name}</dd>
                        
                        <dt class="text-upper">籍贯</dt>
                        <dd>${OnePerson.householdRegister}</dd>
                        
                        <dt class="text-upper">政治面貌</dt>
                        <dd>${OnePerson.politicalStatus}</dd>

                        <dt class="text-upper">学历</dt>
                        <dd>${OnePerson.education}</dd>

                        <dt class="text-upper">毕业院校</dt>
                        <dd>${OnePerson.school}</dd>
                       <dt class="text-upper">住址</dt>
                        <dd>${OnePerson.address}</dd>   
                        
                    </dl>
           
                </div><!-- .col-sm-6 -->

                <div class="col-sm-6 clear-mrg">
                    <h2 class="title-thin text-muted"><font color="#FFFFFF">基本资料</font></h2>
                       <dl class="dl-horizontal clear-mrg">
                        <dt class="text-upper">性    别</dt>
                        <dd>${OnePerson.sex}</dd>
                        
                        <dt class="text-upper">种族</dt>
                        <dd >${OnePerson.nation}</dd>

                        <dt class="text-upper">电话</dt>
                        <dd>${OnePerson.phone}</dd>

                        <dt class="text-upper">邮箱</dt>
                        <dd>${OnePerson.mailbox}</dd>

                       <dt class="text-upper">出生日期</dt>
                        <dd>${OnePerson.birth}</dd>

                                            
                    </dl>
                   
                </div><!-- .col-sm-6 -->
            </div><!-- .row -->
        </section><!-- .section -->
  </body>
</html>
