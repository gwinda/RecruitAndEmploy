<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="zh-CN">
<head>


<title>珠海人才库-我的</title>

<meta name="description" content="。">
<meta name="keywords" content="">

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="renderer" content="webkit">
<meta name="Robots" content="all">
<meta property="qc:admins" content="2040752403463010135676375"/>
<meta name="baidu-site-verification" content="wTCpQ2cQYQ" />
<link rel="icon" href="images/new/favicon.ico" type="image/x-icon" />

<link rel="stylesheet" href="../../css/newlook1.css"/>
<link rel="stylesheet" href="../../css/newlook2.css"/>
<link rel="stylesheet" href="../../resume/css/jwmanage.css"/>
<link type="text/css" rel="stylesheet" href="../../css/common.css?v=20150807"/>
<script type="text/javascript" src="../../js/jquery-1.11.3.js"></script>
 <script type="text/javascript" src="../../resume/js/jquery-1.12.4.min.js"></script>
<script>
	
$(document).ready(function(){
		//alert("ssss");
		$("ul li").click(function(){
			var key=$(this).prop("id");
			//alert(key);
			 switch(key)
			{
			case "1":
			  $(".fun_view i").attr("style","left:97px;");
			  break;
			case "2":
				$(".fun_view i").attr("style","left:353px;");
			  break;
			case "3":
				$(".fun_view i").attr("style","left:600px;");
			  break;
			case "4":
				$(".fun_view i").attr("style","left:850px;");
			  break;
			  
			default:
			 	$(".fun_view i").attr("style","left:97px;");
			}			 
			//alert("ss" +key);
		}
		); 
		
		$("#1").click(function(){
			
			$("#rightTo").attr("src","ApplicationAction.action?opera=all&user=1");
});

 });
function zhuxiao(){
	 if(confirm("你确信要注销吗？"))
	{
    //如果是true ，那么就把页面转向thcjp.cnblogs.com	 
		 alert("ok");
		 //deleteCookie("userName","/","");//删除cookie
		 window.location.href="cancelC!cancel.action";
		 
		 //window.location.replace("index2.jsp");
	}else 
	 {         //否则说明下了，赫赫	 
	     	 
	  }	 
}



	
</script>
<style>
.box > div{
	margin:0px;
	padding:0px;
}
#header_box .logined{
float: right;
/*display: none;*/
}
#header_box .logined .mine{
position: relative;
display: inline-block;
width: 28px;
height: 28px;
border: solid 1px #fafafa;
border-radius: 50%;
top: 14px;
background: no-repeat center/cover;
}
#header_box .logined .red_point:before{
content: "";
position: absolute;
display: inline-block;
width: 6px;
height: 6px;
border-radius: 3px;
-webkit-border-radius: 3px;
-moz-border-radius: 3px;
background-color: #ff6244;
right: -6px;
top: 0;
}
#header_box .logined .mine:hover + .mine_box{
/*height: 298px;*/
height: 178px;
border-bottom-color: #eaeaea;
}
#header #item_box li{
line-height: 56px;
}
#header{
height: 56px;
}
#header_box #header_content{
width: 1080px;
height: 56px;
border-bottom: solid 1px #eaeaea;
background: #fff;
}
#header_box .logined .phone{
position: relative;
display: inline-block;
width: 14px;
height: 20px;
top: 0px;
margin-right: 30px;
}
#header_box .logined .mine_box:hover{
height: 178px;
/*height: 298px;*/
border-bottom-color: #eaeaea;
}
#header_box .logined .mine_jump:before{
content: "";
display: inline-block;
position: absolute;
width: 15px;
height: 15px;
border: 1px solid #eaeaea;
border-bottom-color: #fff;
border-right-color: #fff;
background-color: #fff;
right: 7px;
top: -9px;
-webkit-transform: rotateX(0deg) rotateY(45deg) rotateZ(45deg);
-moz-transform: rotateX(0deg) rotateY(45deg) rotateZ(45deg);
-o-transform: rotateX(0deg) rotateY(45deg) rotateZ(45deg);
-ms-transform: rotateX(0deg) rotateY(45deg) rotateZ(45deg);
transform: rotateX(0deg) rotateY(45deg) rotateZ(45deg);
}
#header_box .logined .mine_box{
position: absolute;
display: inline-block;
width: 116px;
height: 0;
background-color: #fff;
right: 0;
top: 42px;
transition: all .4s;
overflow: hidden;
text-align: center;
z-index: 30;
}
#header_box .logined .mine_box .mine_jump{
position: relative;
display: inline-block;
width: 110px;
height: 160px;
/*height: 280px;*/
border: 1px solid #eaeaea;
background-color: #fff;
right: 0;
top: 14px;
box-shadow: 0 0 4px #eaeaea;
}
#header_box .logined .mine_jump > a{
position: relative;
display: inline-block;
height: 40px;
line-height: 40px;
width: 90%;
text-align: center;
cursor: pointer;
font-size: 14px;
color: #333;
}
#header_box .logined .mine_jump > a:hover{
color: #6aa2e4;
background-color: #f5f5f5;
}

body{
min-width:680px !important;
/*font-family: "Pingfang SC", "Noto Sans CJK SC DemiLight", "Source Han Sans CN DemiLight", "Noto Sans CJK SC", "Source Han Sans CN", Helvetica;*/
}
#tourist{
top: 56px;
width: 140px;
background: #fff;
border-color: #eaeaea;
}
#back_top,
#feedback
{
z-index: 4;
}
#i_want_f{
font-size: 14px;
width: 56px;
display: inline-block;
}
.ifame_right{
	padding-left:60px;
	
}
.cjg:after{
content: "";
width: 24px;
height: 15px;
position: absolute;
display: inline-block;
right: -20px;
top: 4px;
background-image: url(../../images/new/icon_beta.png);
}
.m-header-top .m-header-top-bg {
	background-color: #5D6A73;
}

</style>
</head>
<body id="nationality-day" >

<div id="dd">
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
                <li ><a href="../../index2.jsp"><i ></i>首页</a></li>
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
                ${userName}	已登录	         
	         <a   class="m-orange-bg" id="zhuxiao" onclick="zhuxiao()" >注销</a>  
                </li>
            </ul>
        </div>
    </div>
</div>
</div>
</div>
<div id="header_box">


<div class="logined">
<!--有红点就加red_point-->
<div class="mine" style="background-image: url(../../personPicture/${OnePerson.picture})"></div>
<div class="mine_box">
<div class="mine_jump">


<a href="../../jsp/Personal/information/Mys.jsp">个人中心<span class="redstar"></span></a>

<a href="/help">帮助中心</a>
<a href="/user/accountsetting/mod">账号设置<span class="onlysso"></span></a>
<a id="" onclick="zhuxiao();">退出</a>

</div>
</div>
</div>
</div>
<div id="shade"></div>
<div id="container">

<!--<div id="shade"></div>-->
<div class="box">
<div class="resume_box">
<div class="base_inf">
<div class="header_img">
<img src="../../personPicture/${OnePerson.picture}" id="head_img"/>
<div id="croppic"></div>
<span data-sa="click" data-smod="controlbar" data-sinfo="{'type':'替换头像'}" class="btn" id="cropContainerHeaderButton"></span>
<div id="wait_up"> <div id="coverlayer"
style="position: absolute;display: none; z-index: 1001; top: 0; left: 0; right:0; bottom:0; width: 100%; height: 100%; background: rgba(15, 15, 15, 0.3) none repeat scroll 0% 0%;">
<div class="spinner" style="top: 45%;left: 45%">
<div class="spinner-container container1">
<div class="circle1"></div>
<div class="circle2"></div>
<div class="circle3"></div>
<div class="circle4"></div>
</div>
<div class="spinner-container container2">
<div class="circle1"></div>
<div class="circle2"></div>
<div class="circle3"></div>
<div class="circle4"></div>
</div>
<div class="spinner-container container3">
<div class="circle1"></div>
<div class="circle2"></div>
<div class="circle3"></div>
<div class="circle4"></div>
</div>
</div>
</div>
</div>
</div>
<!--<input type="file" class="header_fil" id="header_fil"/>-->
<strong>${OnePerson.name}</strong>
<p> ${OnePerson.sex} 
 | ${OnePerson.birth} 
 | ${OnePerson.householdRegister} 
 | ${OnePerson.school} 
 | ${OnePerson.education} 
 | ${OnePerson.politicalStatus} </p>
<p> ${OnePerson.phone}
 | ${OnePerson.mailbox} </p>
<div class="resume_handle" id="add_resume">


</div>
<span class="close_tip"></span>
</div>
<div class="res_load_box">
<div class="load_con">
<%-- <div class="resume">
<div>
<p>
<strong>
<a class="resu_name" style="color:black" href=" /trainee/onresume/modify/res_sfgkyfmrg6gv ">默认简历</a></strong>
<a>-默认简历 </a>
</p>
<span class="add_resume_box" data-stype="online">
<a href="/trainee/onresume/modify/res_sfgkyfmrg6gv "
class="add_resume_item" data-point="69">
<span>中文简历</span>
<canvas class="completeness" width="50" height="50"></canvas>
<span class="close_resume" data-resid="res_sfgkyfmrg6gv">x</span>
</a>

</span>
</div>
<p class="update_time">最近更新 2017-05-27 18:50:42</p>
</div>
 --%>


</div>
</div>
<div id="fun_view" class="fun_view">
<ul>
<li class="fankui active view_item" id="1" data-item="feedback" >
投递反馈
<span class="view_item_num"></span>
</li>
<li id="2">
<a class="shouchang  active  view_item" data-item="mcollect" href="LookMyCollection.action?IDFK=${IDFK}" target="rightlook1">
我的收藏
<span class="view_item_num" id="c_num_box"></span>
</a>
</li>
<li id="3">
<a class="dinyue active view_item" data-item="msubscrip" href="look.action?form=new" target="rightlook1" >

我的简历
<span class="view_item_num"></span>
</a>
</li>
<li id="4">
<a class="yaoyue active view_item" href="lookpersoninformation!look.action?idFK=${IDFK}"  target="rightlook1">

我的个人资料
<span class="view_item_num"></span>
</a>
</li>
</ul>
<i class="view_flag" ide="view_flag"></i>
</div>
<div class="fun_model">
<!---------子模块--------->
 <iframe id="rightTo" class="ifame_right" margin-left=2 frameborder="0" height="1200px"  width="85%" name="rightlook1" src="ApplicationAction.action?opera=all&user=1">

</div>
</div>

<!----------------------添加简历 add by whitney------------------------->
<div id="addResume" class="popup">
<div class="popup_head">请选择简历类型</div>
<div class="popup_close">×</div>
<div class="popup_main">
<div class="btn_box">
<a class="resume_resume_btn fl">在线简历</a>
<a class="resume_resume_btn fr">附件简历</a>
</div>
<p class="tips">你最多只能拥有 2 个简历哦</p>
</div>
</div>

<!------------------------------对话HR-------------------------------->



</div>


<script language="javascript"type="text/javascript" >

</script>
  
<script>
/* function onUploadFinish(success, fileuuid, fileurl){
$("#cropContainerHeaderButton").show();
if(success) {
$("#coverlayer").hide();
$.post('/trainee/logo/change?filepath=' + fileuuid, function (d) {
if (d.code == 100) {
var img = $("#head_img")[0];
img.src = fileurl;
img.onload = function () {
$(".cropControlReset").click();
};
} else {
layer.alert(d.msg)
}
}, 'json');
}
else{
layer.alert('上传失败！');
}
} */


</script>







<script>
/* $(document).ready(function(){
window.KF5SupportBoxAPI.init();
(function()
{
var sBox = window.KF5SupportBoxAPI;
window.KF5SupportBoxAPI = null;
sBox.ready(function()
{
sBox.identify({
"name" : "usr_n8zfgy87vrlc" ,
"email" : "" ,
"phone" : "" ,
//自定义用户信息
"metadata" : [
{ name : '身份', value : "学生"}
]
});
sBox.removeButton();
sBox.close();
$("#feedback").click(function(){
alert("aa");
sBox.open();
});
$(".khfw").click(function () {
sBox.open();
});
});
})();
$(".link-hover").hover(
function () {
$(this).addClass('link-hover-active')
}
,function () {
$(this).removeClass('link-hover-active')
});
var show = true;
var showAlert = true;
if(window.localStorage){
var ad_closed = localStorage.ad_closed;
var ad_closed2 = localStorage.ad_closed2;
show = !ad_closed;
showAlert = !ad_closed2;
}
if(show){
$("#winter").animate({
height : '44px'
},600);
}
if(showAlert){
$("#to_2016winter").fadeIn(500);
}
$("#winter > span").click(function(e){
$("#winter").animate({
height : '0'
},600);
if(window.localStorage){
localStorage.ad_closed = '1';
}
return false
});
$("#to_2016winter").click(function () {
$(this).animate({
height : '0',
width : '0',
opacity : 0
},600);
if(window.localStorage){
localStorage.ad_closed2 = '1';
}
});
});

  */


</script>
</body>
</html>