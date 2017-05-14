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
    
    <title>我的</title>
    
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
  
  </head>
   <script src="js/jquery-1.11.3.js"></script>
 <script>
function zhuxiao(){
	 if(confirm("你确信要注销吗？"))
	{
    //如果是true ，那么就把页面转向thcjp.cnblogs.com	 
		 alert("ok");
		 deleteCookie("userName","/","");//删除cookie
		 window.location.href="cancelC!cancel.action";
		 
		 //window.location.replace("index2.jsp");
	}else 
	 {         //否则说明下了，赫赫	 
	     	 
	  }	 
}
</script>
  <style type="text/css">
  .wrapper{
	margin-top: 5px;
	margin-left: 15%;
	margin-right: 15%;}
	 .column{
	 padding-top:5px;

    border-bottom : 1px solid #6cf;
	margin-top: 5px;}
	 .container{
   
	margin-top: 5px;
	margin-left: 0px;
	margin-right: 15%;}
	.content{
   
	margin-top: 0px;
	margin-left: 0px;
	margin-right: 15%;}

  </style>
  <body>
  <div id="append_parent"> </div>

<div class="m-header-top">

    <div class="m-header-top-bg"></div>

    <div class="m-warp">

        <div class="row">

            <ul class="m-header-top-l">

                <li class="nav-down">

                     <div class="m-header-top-down-bg"></div>

                    <a href="javascript:"><i class="m-icon m-icon-location"></i><span class="g-display-theme">主站</span></a>

                    <div class="m-header-top-down w-116">

                        <div class="m-header-top-down-c-bg"></div>

                        <ul class="m-location-ul">

                            <li class="g-display-suzhou">

                                <a target="_blank" 

                                    <i class="m-icon-24 m-icon-suzhou"></i>主站

                                </a>

                            </li>
                            <li class="g-display-sh">
                                <a target="_blank" 
                                    <i class="m-icon-24 m-icon-sh"></i>
                                </a>
                            </li>
                           <li class="g-display-hk">
                                <a target="_blank" 
                                    <i class="m-icon-24 m-icon-xg"></i>
                                </a>
                        </ul>
                    </div>
                </li>
                <li ><a href="index2.jsp"><i ></i>首页</a></li>
                </li>
       		<li>
                </li>
            </ul>
            <ul class="m-header-top-r">
                <li class="nav-down login-after login_after" style="width: 160px">
                    <div class="m-header-top-down-bg"></div>
                    <a class="headinfo" target="_blank" 
                        <span class="num-red num-red-new header_tip"></span>
                        <span class="tusername"></span>
                    </a>
                    <div class="m-header-top-down">
                         <div class="m-header-top-down-c-bg user-down-bg"></div>
                        <ul>
                            <li class="msg-center downlist">
                                <span class="num-red num-red2 num-red-new num-red-new2 header_tip"></span>
                            </li>
                        </ul>
                    </div>

                </li>

<c:choose>
	<c:when test="${mailbox!=null}">
                ${userName}	已登录
	         <a  href="jsp/Personal/information/Mys.jsp" class="m-orange-bg"  >我的</a>
	         <a   class="m-orange-bg" onclick="zhuxiao()" >注销</a>
    </c:when>
    <c:otherwise>  
                    <a href="Login.jsp">登录</a>

                    <a  href="jsp/Personal/LoginAndRegister/Register.jsp" class="m-orange-bg">用户注册</a>
                    <a  href="jsp/Enterprise/LoginAndRegister/RegisterR.jsp" class="m-orange-bg">企业注册</a>
 </c:otherwise>
</c:choose>
                </li>
            </ul>
        </div>
    </div>
</div>
<script type="text/javascript" charset="utf-8" src="http://account.vsochina.com/static/js/global_nav.js?t=20150824"></script>
  
   <div class="wrapper">
   <div class="column">
      <div class="subnav">  
      <c:choose>
      	<c:when test="${IDFK!=null}">
	           <a href="jsp/Personal/ResumeCreateJsp.jsp" target="rightlook">新建简历</a> &nbsp &nbsp 
	           <a href="look.action" target="rightlook">查看所有简历</a> &nbsp &nbsp 
	           <a href="ApplicationAction.action?opera=invite&user=1" target="rightlook">查看以投递简历</a> &nbsp &nbsp 
	           <a href="lookpersoninformation!look.action?idFK=${IDFK}" target="rightlook">查看个人基本信息</a>  &nbsp &nbsp  
	           <a href="LookMyCollection.action?IDFK=${IDFK}" target="rightlook">查看我的收藏</a>  &nbsp &nbsp      
    	</c:when>
    	<c:otherwise>
           <a href="jsp/Enterprise/RecruitmentCreateJsp.jsp" target="rightlook">发布招聘</a> &nbsp &nbsp 
           <a href="Rec?i=1" target="rightlook">查看招聘</a></h3> &nbsp &nbsp 
           <a href="ApplicationAction.action?opera=notsee&user=2" target="rightlook">查看以投递简历</a> &nbsp &nbsp 
           <a href="Ei" target="rightlook">查看企业信息</a></h3> &nbsp &nbsp 
    	</c:otherwise>
     </c:choose>
      </div>     
    <br class="clear" />
    </div>
  <div class="container">
    <div class="content">
      <iframe class="ifame_right" frameborder="0" height="800px"  width="100%" name="rightlook"src="images/ico.jpg">
      </iframe>
     
      </div>
      
    </div>   
    
    </div>
     <script type="text/javascript" src="js/vsofooter.js"></script>
     	<script type="text/javascript" src="js/experience.js"></script>
  </body>
 

</html>
