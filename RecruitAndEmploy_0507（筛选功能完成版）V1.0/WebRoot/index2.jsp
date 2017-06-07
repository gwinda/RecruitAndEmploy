<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE HTML>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>珠海人才库首页</title>
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <meta name="renderer" content="webkit"/>
    <!--reset.css  header.css  footer.css-->
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
    <style>
    
    .apull-left{
    	display:block;
    	float:left;
    	width:550px;
    	height:200px;
    	border:1px #EAE6E6 solid;
    	border-radius:4px;
    	margin-left:20px;
    }
    .apull-right{
    	display:block;
    	float:left;
    	width:550px;
    	height:200px;
    	margin-left:20px;
    	border:1px #EAE6E6 solid;
    	border-radius:4px;
    	margin-right:40px;
    }
        img {
            display: inline-block;
        }
        .rslides li img {
            width: 1200px;
            height: 455px;
        }
        .talent-nav-last img {
            width: 143px;
            height: 29px;
        }
        .talent-classify-ad img {
            width: 244px;
            height: 150px;
        }
        .talent-fac-left a img {
            width: 293px;
            height: 183px;
        }
        .talent-fac-ul li a img {
            width: 148px;
            height: 79px;
        }
        .talent-modal-subject a img {
            width: 320px;
            height: 260px;
        }
        .recommend-imgbox img {
            width: 216px;
            height: 216px;
        }
        .talent-ad-list li a img {
            width: 130px;
            height: 90px;
        }
        .talent-step-dl dt img {
            width: 130px;
            height: 130px;
        }
        .talent-news-dl dt img {
            width: 140px;
            height: 30px;
        }
        .talent-logos-table td img {
            width: 159px;
            height: 47px;
            max-width: 175px;
            max-height: 50px;
        }
        .talent-step-dl-title i {
            overflow: hidden;
        }
    /*全局广告位隐藏，加载完毕时显示*/
    ._web_ad_ {
        display: none;
    }
    </style>

</head>
<body class="talent-gray-bg">
<!--header-->

<script>
    STATIC_RC_JS_URL_PREFIX_PATH = 'http://static.vsochina.com/rc';
</script>
<link type="text/css" rel="stylesheet" href="css/dreamSpace.css"/>
<script type="text/javascript" src="js/jquery.lazyload.js"></script>
<script type="text/javascript" src="js/dreamSpace.js"></script>
<!--header-->
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
<div class="talent-header border2">

    <div class="m-warp">
        <div class="talent-logo">
            <a href=""><img src="images/logo.jpg" class="pull-left"/></a>
        </div>
        <div class="talent-search">
            <div class="bdsug">
            </div>
            <div class="input-group _web_ad_" ad_data="{'b_id':5, 'row_num':1}">
                <form name="search" id="search" method="get" action="searchjob!searchjob.action" onSubmit="return checkParams()" >
                    <input type="text" name="keyword" id="keyword" class="form-control" placeholder="职位搜索" onKeyUp="help(event)"
                           aria-describedby="basic-addon2" value=""  autocomplete="off">
                    <input type="submit" class="input-group-addon" id="basic-addon2" value="搜索"/>
                </form>
            </div>
            <p class="talent-label-s _web_ad_" ad_data="{'b_id':4, 'row_num':7,'sub_str':'0,-8'}"><a href="" class="active"></a><b>|</b></p>
        </div>
        <a href="">
            <img src="images/yuegao.jpg" alt="" class="pull-right">
        </a>
    </div>
</div>
<script type="text/javascript">

    $(document).ready(function () {
        load_Logo();
      
    });
    function load_Logo() {
        $.ajax({
            type: "POST",
            async: false,
            url: "/rc/index/site-info?site_type=2",
            dataType: "json",
            success: function (json) {
                if (json.site_logo !== '') {
                    $(".talent-logo").html("<a href='http://rc.vsochina.com'>" + json.site_logo + "</a>");
                }
            },
            fail: function (json) {
            }
        });
    }
    function checkParams() {
        if ('' == $.trim($('#keyword').val())) {
            location.reload();
            return false;
        }
    }
    var helpflag;
    function help(event) {
        clearTimeout(helpflag);
        var keyword = $('#keyword').val().trim();
        if (keyword !== "") {
            helpflag=setTimeout(function(){$.ajax({
                type: "GET",
                async: false,
                url: "/rc/search/remind?keyword=" + keyword,
                success: function (data) {
                    if (data)
                    {
                        $(".talent-search .bdsug").html(data);
                        $(".talent-search .bdsug").show();
                    }
                    else
                    {
                        $(".talent-search .bdsug").hide();
                    }
                },
                fail: function ()
                {
                    $(".talent-search .bdsug").hide();
                }
            });},300);
        }
        else
        {
            $(".talent-search .bdsug").hide();
        }
        stopPropagation(event);
    }
    $(".talent-search .form-control").on("click", function (event) {
        stopPropagation(event);
    });
    $(document).on("click", function () {
        $(".talent-search .bdsug").hide();
    });
    /*阻止冒泡*/
    function stopPropagation(event) {
        if (event.stopPropagation)
            event.stopPropagation();
        else
            event.cancelBubble = true;
    }
    
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
<!--/header-->
<!--nav-->
<div class="talent-nav">
    <div class="m-warp">
        <ul class="clearfix">
            <li class="talent-nav-first">行业分类</li>                                                                                                                                                                                                                                            
           <!--  <li class="active"><a href="" >建筑行业</a><b>/</b></li>
            <li ><a href="" >IT行业</a><b>/</b></li>
            <li class="active"><a href="" >传媒行业</a><b>/</b></li>
            <li ><a href="" >旅游行业</a></li>--> 
            <li class="talent-nav-last"><img src="images/1758843513564bec3ee83d5.png" alt=""></li>        
        </ul>
    </div>
</div>
<!--/nav-->
<!--banner-->
<div class="talent-banner" style="position: relative; overflow: hidden;">
    <ul class="rslides">
                   <li style="background-color: #000000;"><a><img src="personPicture/f.jpg" alt="创意云新版人才库上线" /></a></li>                    
                    <li style="background-color: #9a9899;"><a><img src="personPicture/b.jpg" alt="路盛章大师入驻创意云" /></a></li>                    
                    <li style="background-color: #2b2b2b;"><a><img src="personPicture/c.jpg" alt="创意云主题曲演唱者诚翔兄弟" /></a></li>                    
                    <li style="background-color: #0d141a;"><a><img src="personPicture/d.jpg" alt="创意云百万创意大赛启动" /></a></li>                    
                    <li style="background-color: #fae3af;"><a><img src="personPicture/e.jpg" alt="骄傲的番茄主场人员创意云专访" /></a></li>                                                                                                                               
     </ul>
    <div class="m-warp">
        <!--分类-->
        <div class="talent-classify">
            <div class="talent-classify-bg"></div>
            <ul class="talent-classify-ul">
                <li>
                    <i class="icon-18 icon-movies"></i>                                                                                                                                                                                                    
                    <a href="">传媒行业</a>                    
                    <b class="talent-nav-arrow"></b>
                </li>
                <li>
                    <i class="icon-18 icon-anime"></i>                                                                                                                                                                                                    
                    <a href="">旅游行业 </a>                    
                    <b class="talent-nav-arrow"></b>
                </li>
                <li>
                    <i class="icon-18 icon-game"></i>                                                                                                                                                                                                    
                    <a href="" >服装行业 </a>                    
                    <b class="talent-nav-arrow"></b>
                </li>
                <li>
                    <i class="icon-18 icon-build"></i>                                                                                                                                                                                                    
                    <a href="" >运输物流行业</a>                    
                    <b class="talent-nav-arrow"></b>
                </li>
                <li>
                    <i class="icon-18 icon-anime"></i>                                                                                                                                                                                                    
                    <a href="">教政行业</a>                    
                    <b class="talent-nav-arrow"></b>
                </li>
                <li>
                    <i class="icon-18 icon-game"></i>                                                                                                                                                                                                    
                    <a href="">IT行业</a>                    
                    <b class="talent-nav-arrow"></b>
                </li>
                <li>
                    <i class="icon-18 icon-develop"></i>                                                                                                                                                                                                    
                    <a href="" >酒店餐饮行业</a>                    
                    <b class="talent-nav-arrow"></b>
                </li>
                <li>
                    <i class="icon-18 icon-design"></i>                                                                                                                                                                                                    
                    <a href="">建筑行业</a>                    
                    <b class="talent-nav-arrow"></b>
                </li>
                <li>
                    <i class="icon-18 icon-more"></i>                                                                                                                                                                                                    
                    <a href="#more_partner" >推荐招聘信息</a>                
                </li>
            </ul>
        </div>
        <!--/分类-->
        <!--分类内容-->
        <div class="talent-classify-box">
            <div class="talent-classify-content">
                <div class="talent-classify-left pull-left">
                    <p class="talent-classify-title"><b class="icon-5-black"></b>影视娱乐</p>                    <div class="talent-classify-tag-all clearfix">
                        <div class="talent-classify-tag">
                                                            <a href="SearchJobById?id=1" class="active">编导</a>                                                            
                                                            <a href="SearchJobById?id=2" class="">制片</a>                                                            
                                                            <a href="SearchJobById?id=3" class="">后期</a>                                                            
                                                            <a href="SearchJobById?id=4" class=""  target="_blank" >编剧</a>                                                            
                                                            <a href="SearchJobById?id=5" class=""  target="_blank" >剪辑</a>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
                                                            </div>
                    </div>
                    <p class="talent-classify-title"><b class="icon-5-black"></b>创意设计</p>                    <div class="talent-classify-tag-all clearfix">
                        <div class="talent-classify-tag">
                                                            <a href="SearchJobById?id=6" class=""  target="_blank" >平面设计</a>                                                            
                                                            <a href="SearchJobById?id=7" class=""  target="_blank" >图形设计</a>                                                            
                                                            <a href="SearchJobById?id=8" class="active"  target="_blank" >舞台设计</a>                                                            
                                                            <a href="SearchJobById?id=9" class=""  target="_blank" >原画师</a>                                                            
                                                            <a href="SearchJobById?id=10" class=""  target="_blank" >美术</a>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                </div>
                    </div>
                    <p class="talent-classify-title"><b class="icon-5-black"></b>文案/出版</p>                    <div class="talent-classify-tag-all clearfix">
                        <div class="talent-classify-tag">                                                           
                                                            <a href="SearchJobById?id=11" class="active"  target="_blank" >策划</a>                                                            
                                                            <a href="SearchJobById?id=12" class=""  target="_blank" >广告</a>                                                            
                                                            <a href="SearchJobById?id=13" class="active"  target="_blank" >文案</a>                                                            
                                                            <a href="SearchJobById?id=14" class=""  target="_blank" >排版</a>                                                            
                                                            <a href="SearchJobById?id=15" class=""  target="_blank" >印刷</a>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  </div>
                    </div>
                    <p class="talent-classify-title"><b class="icon-5-black"></b>编辑记者</p>                    <div class="talent-classify-tag-all clearfix">
                        <div class="talent-classify-tag">
                                                            <a href="SearchJobById?id=16" class=""  target="_blank" >美术编辑</a>                                                            
                                                            <a href="SearchJobById?id=17" class=""  target="_blank" >视频编辑</a>                                                            
                                                            <a href="SearchJobById?id=18" class="active"  target="_blank" >记者</a>                                                            
                                                            <a href="SearchJobById?id=19" class=""  target="_blank" >网络编辑</a>                                                            
                                                            <a href="SearchJobById?id=20" class=""  target="_blank" >摄影记者</a>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               </div>
                    </div>
                        <div class="talent-classify-tag-all clearfix">
                        <div class="talent-classify-tag">
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            </div>
                    </div>
                </div>
                <div class="talent-classify-right pull-right">
                        <div class="talent-classify-tag-all clearfix">
                        <div class="talent-classify-tag">
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        </div>
                    </div>
                                            <a  class="talent-classify-ad" ><img src="images/970057300564c2a1338234.jpg" ></a>                                            
                                            <a  class="talent-classify-ad" ><img src="images/2110411893564c2a95597b5.jpg" ></a>                                    
                                            </div>
            </div>
            <div class="talent-classify-content">
                <div class="talent-classify-left pull-left">
                    <p class="talent-classify-title"><b class="icon-5-black"></b>旅游服务</p>                    
                    <div class="talent-classify-tag-all clearfix">
                        <div class="talent-classify-tag">
                                                            <a href="SearchJobById?id=21" class="active"  target="_blank" >导游</a>                                                            
                                                            <a href="SearchJobById?id=22" class=""  target="_blank" >领队</a>                                                            
                                                            <a href="SearchJobById?id=23" class="active"  target="_blank" >司机</a>                                                            
                                                            <a href="SearchJobById?id=24" class=""  target="_blank" >旅行社</a>                                                            
                                                            <a href="SearchJobById?id=25" class=""  target="_blank" >外联</a>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                </div>
                    </div>
                    <p class="talent-classify-title"><b class="icon-5-black"></b>旅游开发</p>                    <div class="talent-classify-tag-all clearfix">
                        <div class="talent-classify-tag">
                                                            <a href="SearchJobById?id=26" class=""        target="_blank" >旅游企划</a>                                                            
                                                            <a href="SearchJobById?id=27" class="active"  target="_blank" >产品</a>                                                            
                                                            <a href="SearchJobById?id=28" class=""        target="_blank" >项目</a>                                                            
                                                            <a href="SearchJobById?id=29" class="active"  target="_blank" >技术</a>                                                            
                                                            <a href="SearchJobById?id=30" class=""        target="_blank" >旅游电商运营</a>                                                                                                                                                                                                                                       </div>
                    </div>
                    <p class="talent-classify-title"><b class="icon-5-black"></b>旅游相关</p>                    <div class="talent-classify-tag-all clearfix">
                        <div class="talent-classify-tag">
                                                            <a href="SearchJobById?id=31" class=""  target="_blank" >培训</a>                                                            
                                                            <a href="SearchJobById?id=32" class=""  target="_blank" >翻译</a>                                                            
                                                            <a href="SearchJobById?id=33" class=""  target="_blank" >旅游传媒</a>                                                            
                                                            <a href="SearchJobById?id=34" class=""  target="_blank" >旅游策划</a>                                                            
                                                            <a href="SearchJobById?id=35" class=""  target="_blank" >高尔夫</a>                                                                                                                                                                                                                                                                                                                                                               
                                                            </div>
                    </div>
                    <p class="talent-classify-title"><b class="icon-5-black"></b>销售</p>                    
                    <div class="talent-classify-tag-all clearfix">
                        <div class="talent-classify-tag">
                                                            <a href="SearchJobById?id=36" class=""  target="_blank" >市场</a>                                                            
                                                            <a href="SearchJobById?id=37" class=""  target="_blank" >推广</a>                                                            
                                                            <a href="SearchJobById?id=38" class="active"  target="_blank" >产品</a>                                                            
                                                            <a href="SearchJobById?id=39" class=""  target="_blank" >拓展</a>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            </div>
                    </div>
                                        <div class="talent-classify-tag-all clearfix">
                        <div class="talent-classify-tag">
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            </div>
                    </div>
                </div>
                <div class="talent-classify-right pull-right">
                        <div class="talent-classify-tag-all clearfix">
                        <div class="talent-classify-tag">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           </div>
               </div>
                                            <a href="" class="talent-classify-ad"  target="_blank" ><img src="images/430727959564c300196efb.jpg" alt=""></a>                                            
                                            <a href="http://www.vsochina.com/talent_detail/member_id/15537.html" class="talent-classify-ad"  target="_blank" ><img src="images/668276209564c300c98bc7.jpg" alt=""></a>                                    
                                            </div>
            </div>
            <div class="talent-classify-content">
                <div class="talent-classify-left pull-left">
                    <p class="talent-classify-title"><b class="icon-5-black"></b>服装设计</p>                    <div class="talent-classify-tag-all clearfix">
                        <div class="talent-classify-tag">
                                                            <a href="SearchJobById?id=40" class=""  target="_blank" >面料设计</a>                                                            
                                                            <a href="SearchJobById?id=41" class=""  target="_blank" >服装陈列</a>                                                            
                                                            <a href="SearchJobById?id=42" class=""  target="_blank" >平面设计</a>                                                            
                                                            <a href="SearchJobById?id=43" class="active"  target="_blank" >童装设计</a>                                                            
                                                            <a href="SearchJobById?id=44" class=""  target="_blank" >搭配师</a>                                                            >                                                                                                                                                                                                                                                                                                                                                                                                                            </div>
                    </div>
                    <p class="talent-classify-title"><b class="icon-5-black"></b>服装生产</p>                    <div class="talent-classify-tag-all clearfix">
                        <div class="talent-classify-tag">
                                                            <a href="SearchJobById?id=45" class=""  target="_blank" >厂长</a>                                                            
                                                            <a href="SearchJobById?id=46" class=""  target="_blank" >样衣工</a>                                                            
                                                            <a href="SearchJobById?id=47" class=""  target="_blank" >裁缝</a>                                                            
                                                            <a href="SearchJobById?id=48" class=""  target="_blank" >针织</a>                                                            
                                                            <a href="SearchJobById?id=49" class="active"  target="_blank" >量体师</a>                                                            
                                                            <a href="SearchJobById?id=50" class="active"  target="_blank" >纸样师</a>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          </div>
                    </div>
                    <p class="talent-classify-title"><b class="icon-5-black"></b>服装销售</p>                    <div class="talent-classify-tag-all clearfix">
                        <div class="talent-classify-tag">
                                                            <a href="SearchJobById?id=51" class="active"  target="_blank" >销售总监</a>                                                            
                                                            <a href="SearchJobById?id=52" class=""  target="_blank" >销售经理</a>                                                            
                                                            <a href="SearchJobById?id=53" class="active"  target="_blank" >营业员</a>                                                            
                                                            <a href="SearchJobById?id=54" class=""  target="_blank" >模特</a>                                                            
                                                            <a href="SearchJobById?id=55" class=""  target="_blank" >客服</a>                                                            型制作</a>                                                                                                                                                                                                                                                                                                                                                                                                                             </div>
                    </div>
                    <p class="talent-classify-title"><b class="icon-5-black"></b>行政管理</p>                    <div class="talent-classify-tag-all clearfix">
                        <div class="talent-classify-tag">
                                                            <a href="SearchJobById?id=56" class=""  target="_blank" >总经理</a>                                                            
                                                            <a href="SearchJobById?id=57" class=""  target="_blank" >行政总监</a>                                                            
                                                            <a href="SearchJobById?id=58" class=""  target="_blank" >财务</a>                                                            
                                                            <a href="SearchJobById?id=59" class=""  target="_blank" >人力资源</a>                                                            
                                                            <a href="SearchJobById?id=60" class="active"  target="_blank" >收银员</a>                                                            
                                                            <a href="SearchJobById?id=61" class="active"  target="_blank" >后勤</a>                                                                                                                       
                                                                                                                                                                                                                                                                                                                                                                                                                          
                                                            </div>
                    </div>
                                        <div class="talent-classify-tag-all clearfix">
                        <div class="talent-classify-tag">
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            </div>
                    </div>
                </div>
                <div class="talent-classify-right pull-right">
                        <div class="talent-classify-tag-all clearfix">
                        <div class="talent-classify-tag">
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       </div>
                    </div>
                                            <a class="talent-classify-ad"  target="_blank" ><img src="images/532740416564c3d18dcbae.jpg" alt=""></a>                                            
                                            <a class="talent-classify-ad"  target="_blank" ><img src="images/1731816380564c3d27e95c0.jpg" alt=""></a>                                    
                                            </div>
            </div>
            <div class="talent-classify-content">
                <div class="talent-classify-left pull-left">
                    <p class="talent-classify-title"><b class="icon-5-black"></b>物流仓储</p>                    <div class="talent-classify-tag-all clearfix">
                        <div class="talent-classify-tag">
                                                            <a href="SearchJobById?id=62" class="active"  target="_blank" >物流</a>                                                            
                                                            <a href="SearchJobById?id=63" class=""  target="_blank" >运输</a>                                                            
                                                            <a href="SearchJobById?id=64" class=""  target="_blank" >快递</a>                                                            
                                                            <a href="SearchJobById?id=65" class=""  target="_blank" >仓库</a>                                                            
                                                            <a href="SearchJobById?id=66" class="active"  target="_blank" >理货</a>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                </div>
                    </div>
                    <p class="talent-classify-title"><b class="icon-5-black"></b>贸易采购</p>                    <div class="talent-classify-tag-all clearfix">
                        <div class="talent-classify-tag">
                                                            <a href="SearchJobById?id=67" class=""  target="_blank" >贸易</a>                                                            
                                                            <a href="SearchJobById?id=68" class=""  target="_blank" >货运</a>                                                            
                                                            <a href="SearchJobById?id=69" class="active"  target="_blank" >供应商 </a>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        </div>
                    </div>
                    <p class="talent-classify-title"><b class="icon-5-black"></b>市场</p>                    <div class="talent-classify-tag-all clearfix">
                        <div class="talent-classify-tag">
                                                            <a href="SearchJobById?id=70" class="active"  target="_blank" >总经理</a>                                                            
                                                            <a href="SearchJobById?id=71" class=""  target="_blank" >秘书</a>                                                            
                                                            <a href="SearchJobById?id=72" class=""  target="_blank" >运营主管</a>   
                                                            <a href="SearchJobById?id=73" class=""  target="_blank" >调研</a> 
                                                            <a href="SearchJobById?id=74" class=""  target="_blank" >策划</a>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      </div>
                    </div>
                        <div class="talent-classify-tag-all clearfix">
                        <div class="talent-classify-tag">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  </div>
                    </div>
                       <div class="talent-classify-tag-all clearfix">
                        <div class="talent-classify-tag">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      </div>
                    </div>
                </div>
                <div class="talent-classify-right pull-right">
                         <div class="talent-classify-tag-all clearfix">
                        <div class="talent-classify-tag">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    </div>
                    </div>
                                            <a  class="talent-classify-ad"  target="_blank" ><img src="images/1528886041564c4586cc1ed.jpg" alt=""></a>                                            
                                            <a  target="_blank" ><img src="images/649638541564c45a7e28e9.jpg" alt=""></a>                                    
                                            </div>
            </div>
            <div class="talent-classify-content">
                <div class="talent-classify-left pull-left">
                    <p class="talent-classify-title"><b class="icon-5-black"></b>幼儿</p>                    <div class="talent-classify-tag-all clearfix">
                        <div class="talent-classify-tag">
                                                            <a href="SearchJobById?id=75" class="active"  target="_blank" >园长</a>                                                            
                                                            <a href="SearchJobById?id=76" class=""  target="_blank" >幼儿教师</a>                                                            
                                                            <a href="SearchJobById?id=77" class="active"  target="_blank" >保育</a>                                                            
                                                            <a href="SearchJobById?id=78" class=""  target="_blank" >医生</a>                                                            >                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                </div>
                    </div>
                    <p class="talent-classify-title"><b class="icon-5-black"></b>小学</p>                    <div class="talent-classify-tag-all clearfix">
                        <div class="talent-classify-tag">
                                                            <a href="SearchJobById?id=79" class=""  target="_blank" >校长</a>                                                            
                                                            <a href="SearchJobById?id=80" class=""  target="_blank" >主任</a>                                                            
                                                            <a href="SearchJobById?id=81" class="active"  target="_blank" >语文</a>                                                            
                                                            <a href="SearchJobById?id=82" class=""  target="_blank" >数学</a>                                                            
                                                            <a href="SearchJobById?id=83" class=""  target="_blank" >英语</a>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                </div>
                    </div>
                    <p class="talent-classify-title"><b class="icon-5-black"></b>中学</p>                    <div class="talent-classify-tag-all clearfix">
                        <div class="talent-classify-tag">
                                                            <a href="SearchJobById?id=84" class=""  target="_blank" >教导</a>                                                            
                                                            <a href="SearchJobById?id=85" class=""  target="_blank" >物理</a>                                                            
                                                            <a href="SearchJobById?id=86" class=""  target="_blank" >化学</a>                                                            
                                                            <a href="SearchJobById?id=87" class="active"  target="_blank" >历史</a>                                                            
                                                            <a href="SearchJobById?id=88" class="active"  target="_blank" >地理</a>                                                            
                                                            <a href="SearchJobById?id=89" class=""  target="_blank" > 生物</a>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       </div>
                    </div>
                    <p class="talent-classify-title"><b class="icon-5-black"></b>职教培训</p>                    <div class="talent-classify-tag-all clearfix">
                        <div class="talent-classify-tag">
                                                            <a href="SearchJobById?id=90" class="active"  target="_blank" >高职</a>                                                            
                                                            <a href="SearchJobById?id=91" class=""  target="_blank" >外语</a>                                                            
                                                            <a href="SearchJobById?id=92" class=""  target="_blank" >辅导</a>                                                            
                                                            <a href="SearchJobById?id=93" class=""  target="_blank" >家教</a>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            </div>
                    </div>
                                        <div class="talent-classify-tag-all clearfix">
                        <div class="talent-classify-tag">
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        </div>
                    </div>
                </div>
                <div class="talent-classify-right pull-right">
                     <div class="talent-classify-tag-all clearfix">
                        <div class="talent-classify-tag">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            </div>
                    </div>
                                            <a  class="talent-classify-ad"  target="_blank" ><img src="images/1500417322564c45ca4efc1.jpg" alt=""></a>                                            
                                            <a  class="talent-classify-ad"  target="_blank" ><img src="images/576214534564c45d48e135.jpg" alt=""></a>                                    
                                            </div>
            </div>
            <div class="talent-classify-content">
                <div class="talent-classify-left pull-left">
                    <p class="talent-classify-title"><b class="icon-5-black"></b>互联网</p>                    <div class="talent-classify-tag-all clearfix">
                        <div class="talent-classify-tag">
                                                            <a href="SearchJobById?id=94" class=""  target="_blank" >架构师</a>                                                            
                                                            <a href="SearchJobById?id=95" class="active"  target="_blank" >网络开发</a>                                                            
                                                            <a href="SearchJobById?id=96" class=""  target="_blank" >前端</a>                                                            
                                                            <a href="SearchJobById?id=97" class=""  target="_blank" >脚本开发</a>                                                            
                                                            <a href="SearchJobById?id=98" class="" target="_blank"  >UI设计</a>                                                            
                                                            <a href="SearchJobById?id=99" class=""  target="_blank" > 电子商务</a>                                                            
                                                            <a href="SearchJobById?id=100" class="active"  target="_blank" >游戏</a>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       </div>
                    </div>
                    <p class="talent-classify-title"><b class="icon-5-black"></b>技术支持</p>                    <div class="talent-classify-tag-all clearfix">
                        <div class="talent-classify-tag">
                                                            <a href="SearchJobById?id=101" class="" target="_blank">技术总监</a>                                                            
                                                            <a href="SearchJobById?id=102" class=""  target="_blank" >维护</a>                                                            
                                                            <a href="SearchJobById?id=103" class="active"  target="_blank" >信息技术</a>                                                            
                                                            <a href="SearchJobById?id=104" class=""  target="_blank" >项目</a>                                                            
                                                            <a href="SearchJobById?id=105" class=""  target="_blank" >网络安全</a>                                                            
                                                            <a href="SearchJobById?id=106" class=""  target="_blank" >系统测试</a>   
                                                            <a href="SearchJobById?id=107" class=""  target="_blank" >文档</a>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  </div>
                    </div>
                    <p class="talent-classify-title"><b class="icon-5-black"></b>软件</p>                    <div class="talent-classify-tag-all clearfix">
                        <div class="talent-classify-tag">
                                                            <a href="SearchJobById?id=108" class=""  target="_blank" >系统工程</a>                                                            
                                                            <a href="SearchJobById?id=109" class=""  target="_blank" >软件工程</a>                                                            
                                                            <a href="SearchJobById?id=110" class="active"  target="_blank" >PHP</a>                                                            
                                                            <a href="SearchJobById?id=111" class=""  target="_blank" >计算机辅助 </a>                                                            
                                                            <a href="SearchJobById?id=112" class=""  target="_blank" >IOS</a>                                                            
                                                            <a href="SearchJobById?id=113" class=""  target="_blank" >Android</a>                                                            
                                                            <a href="SearchJobById?id=114" class=""  target="_blank" >程序员</a>                                                            
                                                            <a href="SearchJobById?id=115" class=""  target="_blank" >数据库</a>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            </div>
                    </div>
                     <p class="talent-classify-title"><b class="icon-5-black"></b>其他</p>                    <div class="talent-classify-tag-all clearfix">
                        <div class="talent-classify-tag">
                                                            <a href="SearchJobById?id=116" class=""  target="_blank" >硬件工程师</a>                                                            
                                                            <a href="SearchJobById?id=117" class=""  target="_blank" >硬件维护</a>                                                            
                                                            <a href="SearchJobById?id=118" class="active"  target="_blank" >CEO</a>                                                            
                                                            <a href="SearchJobById?id=119" class=""  target="_blank" >COO </a>                                                            
                                                            <a href="SearchJobById?id=120" class=""  target="_blank" >O2O</a>                                                            
                                                            <a href="SearchJobById?id=121" class=""  target="_blank" >CTO</a>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       </div>
                    </div>
                                        <div class="talent-classify-tag-all clearfix">
                        <div class="talent-classify-tag">
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            </div>
                    </div>
                                        <div class="talent-classify-tag-all clearfix">
                        <div class="talent-classify-tag">
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        </div>
                    </div>
                </div>
                <div class="talent-classify-right pull-right">
                         <div class="talent-classify-tag-all clearfix">
                        <div class="talent-classify-tag">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 </div>
                    </div>
                                            <a class="talent-classify-ad"  target="_blank" ><img src="images/265249714564c426b9f459.jpg" alt=""></a>                                            
                                            <a class="talent-classify-ad"  target="_blank" ><img src="images/1584320448564c427cc5b1e.jpg" alt=""></a>                                    
                                            </div>
            </div>
            <div class="talent-classify-content">
                <div class="talent-classify-left pull-left">
                    <p class="talent-classify-title"><b class="icon-5-black"></b>前厅</p>                    <div class="talent-classify-tag-all clearfix">
                        <div class="talent-classify-tag">
                                                            <a href="SearchJobById?id=122" class=""  target="_blank" >大堂</a>                                                            
                                                            <a href="SearchJobById?id=123" class=""  target="_blank" >迎宾</a>                                                            
                                                            <a href="SearchJobById?id=124" class=""  target="_blank" >礼仪</a>                                                            
                                                            <a href="SearchJobById?id=125" class=""  target="_blank" >传菜</a>                                                            
                                                            <a href="SearchJobById?id=126" class=""  target="_blank" >服务</a>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       </div>
                    </div>
                    <p class="talent-classify-title"><b class="icon-5-black"></b>餐饮</p>                    <div class="talent-classify-tag-all clearfix">
                        <div class="talent-classify-tag">
                                                            <a href="SearchJobById?id=127" class=""  target="_blank" >中式厨师</a>                                                            
                                                            <a href="SearchJobById?id=128" class=""  target="_blank" >西式厨师</a>                                                            
                                                            <a href="SearchJobById?id=129" class=""  target="_blank" >营养</a>                                                            
                                                            <a href="SearchJobById?id=130" class="active"  target="_blank" >切配</a>                                                            
                                                            <a href="SearchJobById?id=131" class=""  target="_blank" >厨工</a>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           </div>
                    </div>
                    <p class="talent-classify-title"><b class="icon-5-black"></b>房务</p>                    <div class="talent-classify-tag-all clearfix">
                        <div class="talent-classify-tag">
                                                            <a href="SearchJobById?id=132" class=""  target="_blank" >清洁</a>                                                            
                                                            <a href="SearchJobById?id=133" class="active"  target="_blank" >楼面</a>                                                            
                                                            <a href="SearchJobById?id=134" class=""  target="_blank" >维修</a>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           </div>
                    </div>
                    <p class="talent-classify-title"><b class="icon-5-black"></b>销售</p>                    <div class="talent-classify-tag-all clearfix">
                        <div class="talent-classify-tag">
                                                            <a href="SearchJobById?id=135" class=""  target="_blank" >连锁</a>                                                            
                                                            <a href="SearchJobById?id=136" class="active"  target="_blank" >招商 </a>                                                            
                                                            <a href="SearchJobById?id=137" class=""  target="_blank" >企划</a>  
                                                            <a href="SearchJobById?id=138" class=""  target="_blank" >经理</a>  
                                                            <a href="SearchJobById?id=139" class=""  target="_blank" >主管</a>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         </div>
                    </div>
                                        <div class="talent-classify-tag-all clearfix">
                        <div class="talent-classify-tag">
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        </div>
                    </div>
                </div>
                <div class="talent-classify-right pull-right">
                        <div class="talent-classify-tag-all clearfix">
                        <div class="talent-classify-tag">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    </div>
                    </div>
                                            <a class="talent-classify-ad"  target="_blank" ><img src="images/933787737564c4224b6f52.jpg" alt=""></a>                                            
                                            <a class="talent-classify-ad"  target="_blank" ><img src="images/1735274232564c420f309c5.jpg" alt=""></a>                                    
                                            </div>
            </div>
            <div class="talent-classify-content">
                <div class="talent-classify-left pull-left">
                    <p class="talent-classify-title"><b class="icon-5-black"></b>建筑设计</p>                    <div class="talent-classify-tag-all clearfix">
                        <div class="talent-classify-tag">
                                                            <a href="SearchJobById?id=140" class=""  target="_blank" >空间设计</a>                                                            
                                                            <a href="SearchJobById?id=141" class=""  target="_blank" >结构设计</a>                                                            
                                                            <a href="SearchJobById?id=142" class="active"  target="_blank" >方案设计</a>                                                            
                                                            <a href="SearchJobById?id=143" class=""  target="_blank" >建筑师</a>                                                            
                                                            <a href="SearchJobById?id=144" class=""  target="_blank" >管道设计</a>                                                            
                                                            <a href="SearchJobById?id=145" class=""  target="_blank" >照明设计</a>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        </div>
                    </div>
                    <p class="talent-classify-title"><b class="icon-5-black"></b>园林景观</p>                    <div class="talent-classify-tag-all clearfix">
                        <div class="talent-classify-tag">
                                                            <a href="SearchJobById?id=146" class="active"  target="_blank" >园林设计</a>                                                            
                                                            <a href="SearchJobById?id=147" class=""  target="_blank" >园艺工程师</a>                                                            
                                                            <a href="SearchJobById?id=148" class=""  target="_blank" >景观工程师</a>                                                            
                                                            <a href="SearchJobById?id=149" class=""  target="_blank" >植物造景</a>                                                            
                                                            <a href="SearchJobById?id=150" class="active"  target="_blank" >绿化工程师</a>                                                            
                                                            <a href="SearchJobById?id=151" class=""  target="_blank" >园林养护师 </a>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    </div>
                    </div>
                    <p class="talent-classify-title"><b class="icon-5-black"></b>房地产/物业</p>                    <div class="talent-classify-tag-all clearfix">
                        <div class="talent-classify-tag">
                                                            <a href="SearchJobById?id=152" class=""  target="_blank" >造价员</a>                                                            
                                                            <a href="SearchJobById?id=153" class="active"  target="_blank" >房地产策划</a>                                                            
                                                            <a href="SearchJobById?id=154" class=""  target="_blank" > 招投标员</a>                                                            
                                                            <a href="SearchJobById?id=155" class=""  target="_blank" >物业</a>                                                            
                                                            <a href="SearchJobById?id=156" class=""  target="_blank" >维修 </a>                                                                                                                                                                                                                                                                                                                                                              </div>
                    </div>
                    <p class="talent-classify-title"><b class="icon-5-black"></b>市场销售/行政职能</p>                    <div class="talent-classify-tag-all clearfix">
                        <div class="talent-classify-tag">
                                                            <a href="SearchJobById?id=157" class="active"  target="_blank" >行政后勤</a>                                                            
                                                            <a href="SearchJobById?id=158" class=""  target="_blank" >文秘</a>                                                            
                                                            <a href="SearchJobById?id=159" class=""  target="_blank" >销售</a>                                                            
                                                            <a href="SearchJobById?id=160" class=""  target="_blank" >质检工程师</a>                                                            
                                                            <a href="SearchJobById?id=161" class=""  target="_blank" >试验员</a>                                                            
                                                            <a href="SearchJobById?id=162" class=""  target="_blank" >出纳</a>                                                            
                                                            <a href="SearchJobById?id=163" class=""  target="_blank" >经理 </a>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        </div>
                    </div>
                                        <div class="talent-classify-tag-all clearfix">
                        <div class="talent-classify-tag">
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        </div>
                    </div>
                </div>
                <div class="talent-classify-right pull-right">
                        <div class="talent-classify-tag-all clearfix">
                        <div class="talent-classify-tag">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     </div>
                    </div>
                                            <a  class="talent-classify-ad"  target="_blank" ><img src="images/1765025180564c41ba717ec.jpg" alt=""></a>                                            
                                            <a  class="talent-classify-ad"  target="_blank" ><img src="images/36132967564c41c921e11.jpg" alt=""></a>                                    
                                            </div>
            </div>
        </div>
        <!--/分类内容-->
        <div class="_web_ad_" ad_data="{'b_id':2, 'row_num':1, 'hide_code':'true'}">
            <a href="{link}" class="talent-banner-ad" target="_blank">
                <img src="other/.com/?do=talent/{img}" width="172" height="438"/>
            </a>
        </div>
    </div>
</div>
<!--/banner-->
<div class="talent-fac" name="more_partner" id="more_partner">
    <div class="m-warp">
        <p class="talent-fac-title">
                        <i class="icon-20"><img src="images/1220546174564b5f48c6762.png"></i>            <span class="maintitle">推荐招聘信息</span>            <i class="subtitle">HOT RECRUITMENT</i>        </p>
        <div class="talent-fac-box clearfix">
        
            <div class="apull-left">
            <table border="0" width="100%" align="center" style="font-size:14px;">
             <tr ><td colspan="3"><div style="height:25px;background:#F1ECF9;"><span class="talent-fac-title"><font class="maintitle"> 传媒 </font></span> <div style="width:100px;height:18px;float:right;text-align:right;font-weight:bold;"><a href="jsp/Personal/recruitment/lookjob.jsp" style="bold:weight">查看更多-></a></div></div></td></tr>
	        	<tr style="font-size:16px;height:20px;" align="center">
	        		<td>职位名称</td>
	        		<td>公司名称</td>
	        		<td>发布时间</td>
	        	</tr>                 
            		<c:forEach var="list1" items="${indexlistOfIT}" end="4" >
            			<tr align="center"  style="font-size:16px;height:30px;">
	            			<td><a href="lookRecuriment!lookonejob.action?id=${list1.idEnterpriseRecruitment}&idEnterpriseInformation=${list1.idEnterpriseInformation}"
						target="_blank">${list1.name}</a></td>
	            			<td><a href="lookRecuriment!lookonejob.action?id=${list1.idEnterpriseRecruitment}&idEnterpriseInformation=${list1.idEnterpriseInformation}"
						target="_blank">${list1.company}</a></td>
	            			<td>${list1.startTime}</td>            			
            			</tr>
            		</c:forEach>    
              </table>
             </div>
            <div class="apull-right">
             <table border="0" width="100%" align="center" style="font-size:14px;">
             <tr ><td colspan="3"><div style="height:25px;background:#F1ECF9;"><span class="talent-fac-title"><font class="maintitle">IT</font></span> <div style="width:100px;height:18px;float:right;text-align:right;font-weight:bold;"><a href="jsp/Personal/recruitment/lookjob.jsp" >查看更多-></a></div></div></td></tr>
	        	<tr style="font-size:16px;height:20px;" align="center">
	        		<td>职位名称</td>
	        		<td>公司名称</td>
	        		<td>发布时间</td>
	        	</tr>    
         		<c:forEach var="lsit2" items="${indexlistOfM}" end="4" >
            			<tr align="center"  style="font-size:16px;height:30px;">
	            			<td><a href="lookRecuriment!lookonejob.action?id=${list2.idEnterpriseRecruitment}&idEnterpriseInformation=${list2.idEnterpriseInformation}"
						target="_blank">${lsit2.name}</a></td>
	            			<td><a href="lookRecuriment!lookonejob.action?id=${list2.idEnterpriseRecruitment}&idEnterpriseInformation=${list2.idEnterpriseInformation}"
						target="_blank">${lsit2.company}</a></td>
	            			<td>${lsit2.startTime}</td>            			
            			</tr>
            		</c:forEach>    
              </table>
            </div>
        </div>
        <div style="height:auto;overflow: hidden"><a href="#" class="talent-banner-ad"target="_blank"><img
                    src="images/213494351564d860512939.jpg" width="1200" height="90" /></a></div>
    </div>
</div>
<!--/新闻-->
<!--logo -->
<div class="talent-logos">
    <p class="font22">珠海人才库<i class="icon-work-online"></i></p>    <p>珠海人才库上聚集了海量的人才，通过平台系统选择您喜欢的公司</p>
    <div class="m-warp">
        <table class="talent-logos-table">
        </table>
    </div>
</div>
<!--/logo-->
<script src="js/responsiveslides.min.js"></script>
<script>
    //去除幻灯片空连接鼠标手势
    $('.rslides').find('a').each(function () {
        if ($(this).attr('href') == 'javascript:void(0);') {
            $(this).css({cursor: 'default'});
        }
    });
    $(".rslides").responsiveSlides({
        auto: true,             // Boolean: 设置是否自动播放, true or false
        speed: 500,            // Integer: 动画持续时间，单位毫秒
        timeout: 4000,          // Integer: 图片之间切换的时间，单位毫秒
        pager: true,           // Boolean: 是否显示页码, true or false
        nav: false,             // Boolean: 是否显示左右导航箭头（即上翻下翻）, true or false
        random: false,          // Boolean: 随机幻灯片顺序, true or false
        pause: false,           // Boolean: 鼠标悬停到幻灯上则暂停, true or false
        pauseControls: true,    // Boolean: 悬停在控制板上则暂停, true or false
        prevText: "Previous",   // String: 往前翻按钮的显示文本
        nextText: "Next",       // String: 往后翻按钮的显示文本
        maxwidth: "",           // Integer: 幻灯的最大宽度
        navContainer: "",       // Selector: Where controls should be appended to, default is after the 'ul'
        manualControls: "",     // Selector: 声明自定义分页导航
        namespace: "rslides",   // String: 修改默认的容器名称
        before: function () {
        },   // Function: 回调之前的参数
        after: function () {
        }
    });
</script>
<!--引入广告js文件-->
<script type="text/javascript" src="js/push.js"></script>
<!--引入广告js文件-->
<!--/content-->
<script type="text/javascript" src="js/jquery.lazyload.js"></script>
<script src="js/rc_index.js"></script>
<!--footer-->
<script type="text/javascript" src="js/vsofooter.js"></script>
<!--add experience-->
<script type="text/javascript" src="js/experience.js"></script>
<!-- Piwik -->
<script type="text/javascript">
  var _paq = _paq || [];
  _paq.push(['trackPageView']);
  _paq.push(['enableLinkTracking']);
  (function() {
    var u="//analyst.vsochina.com:8080/";
    _paq.push(['setTrackerUrl', u+'piwik.php']);
    _paq.push(['setSiteId', 6]);
    var d=document, g=d.createElement('script'), s=d.getElementsByTagName('script')[0];
    g.type='text/javascript'; g.async=true; g.defer=true; g.src=u+'piwik.js'; s.parentNode.insertBefore(g,s);
  })();
</script>
<noscript><p><img src="other/piwik.php?idsite=6" style="border:0;" alt="" /></p></noscript>
<!-- End Piwik Code --></body>
</html>