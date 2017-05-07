document.writeln("<div id=\"append_parent\"> </div>");
document.writeln("<div class=\"m-header-top\">");
document.writeln("    <div class=\"m-header-top-bg\"></div>");
document.writeln("    <div class=\"m-warp\">");
document.writeln("        <div class=\"row\">");
document.writeln("            <ul class=\"m-header-top-l\">");
document.writeln("                <li class=\"nav-down\">");
document.writeln("                     <div class=\"m-header-top-down-bg\"></div>");
document.writeln("                    <a href=\"javascript:;\"><i class=\"m-icon m-icon-location\"></i><span class=\"g-display-theme\">主站</span></a>");
document.writeln("                    <div class=\"m-header-top-down w-116\">");
document.writeln("                        <div class=\"m-header-top-down-c-bg\"></div>");
document.writeln("                        <ul class=\"m-location-ul\">");
document.writeln("                            <li class=\"g-display-suzhou\">");
document.writeln("                                <a target=\"_blank\" ");
document.writeln("                                    <i class=\"m-icon-24 m-icon-suzhou\"></i>主站");
document.writeln("                                </a>");
document.writeln("                            </li>");
document.writeln("                            <li class=\"g-display-sh\">");
document.writeln("                                <a target=\"_blank\" ");
document.writeln("                                    <i class=\"m-icon-24 m-icon-sh\"></i>");
document.writeln("                                </a>");
document.writeln("                            </li>");
document.writeln("                            <li class=\"g-display-hk\">");
document.writeln("                                <a target=\"_blank\" ");
document.writeln("                                    <i class=\"m-icon-24 m-icon-xg\"></i>");
document.writeln("                                </a>");
document.writeln("                            </li>");
/*document.writeln("                            <li class=\"g-display-jszj\">");
document.writeln("                                <a target=\"_blank\" href=\"http://jszj.vsochina.com\">");
document.writeln("                                    <i class=\"m-icon-24 m-icon-jszj\"></i>镇江");
document.writeln("                                </a>");
document.writeln("                            </li>");*/
document.writeln("                        </ul>");
document.writeln("                    </div>");
document.writeln("                </li>");
document.writeln("                <li ><a href=\"index2.jsp\"><i ></i>首页</a></li>");
/*document.writeln("                <li class=\"nav-down\">");
/*document.writeln("                    <div class=\"m-header-top-down-bg\"></div>");
*/document.writeln("                    ");
/*document.writeln("                    <div class=\"m-header-top-down\">");
document.writeln("                        <div class=\"m-header-top-down-c-bg\"></div>");
document.writeln("                        <ul class=\"app-ul\">");
document.writeln("                            <li>");
document.writeln("                                <a target=\"_blank\" href=\"http://soft.vsochina.com/?do=3\" class=\"applink\">渲染APP</a>");
document.writeln("                                <img src=\"http://www.vsochina.com/resource/images/index/renderapp.jpg\" />");
document.writeln("                            </li>");
document.writeln("                            <li>");
document.writeln("                                <a target=\"_blank\" href=\"http://soft.vsochina.com/?do=4\" class=\"applink\">");
document.writeln("                                    任务APP");
document.writeln("                                    <p class=\"onlyandroid\">（仅安卓）</p>");
document.writeln("                                </a>");
document.writeln("                                <img src=\"http://www.vsochina.com/resource/images/index/taskapp.jpg\" />");
document.writeln("                            </li>");
document.writeln("                        </ul>");
document.writeln("                    </div>");
*/document.writeln("                </li>");
document.writeln("                <li>");
document.writeln("                    ");
document.writeln("                </li>");
document.writeln("            </ul>");
document.writeln("            <ul class=\"m-header-top-r\">");
document.writeln("                <li class=\"nav-down login-after login_after\" style=\"width: 160px;\">");
document.writeln("                    <div class=\"m-header-top-down-bg\"></div>");
document.writeln("                    <a class=\"headinfo\" target=\"_blank\" ");
document.writeln("                        <span class=\"num-red num-red-new header_tip\"></span>");
document.writeln("                        <span class=\"tusername\"></span>");
document.writeln("                    </a>");
document.writeln("                    <div class=\"m-header-top-down\">");
document.writeln("                         <div class=\"m-header-top-down-c-bg user-down-bg\"></div>");
document.writeln("                        <ul>");
document.writeln("                            <li class=\"msg-center downlist\">");
document.writeln("                                <span class=\"num-red num-red2 num-red-new num-red-new2 header_tip\"></span>");
document.writeln("                            </li>");
document.writeln("                        </ul>");
document.writeln("                    </div>");function zhuxiao(){	 if(confirm("你确信要注销吗？"))	{    //如果是true ，那么就把页面转向thcjp.cnblogs.com	 		 alert("ok");		 deleteCookie("userName","/","");//删除cookie		 window.location.href="cancelC!cancel.action";		 		 //window.location.replace("index2.jsp");	}else 	 {         //否则说明下了，赫赫	 	     	 	  }	 }/*function findone(){	if(getCookie("userName")!=""){		if(getCookie("userName").indexOf("用户")){			window.location.href="lookmyallInP!lookMys.action";					}else{			window.location.href="lookmyallInE!lookMys.action";		}	}}*/
document.writeln("                </li>");//alert(id);if(getCookie("userName")!=""){		document.writeln(   getCookie("userName")+"  已登录");	document.writeln("         <a  href=\"jsp/Personal/information/Mys.jsp\" class=\"m-orange-bg\"  >我的"+"</a>");	document.writeln("         <a   class=\"m-orange-bg\" onclick=\"zhuxiao()\" >注销</a>");}else{
document.writeln("                    <a href=\"Login.jsp\">登录</a>");
document.writeln("                    <a  href=\"jsp/Personal/LoginAndRegister/Register.jsp\" class=\"m-orange-bg\">用户注册</a>");document.writeln("                    <a  href=\"jsp/Enterprise/LoginAndRegister/RegisterR.jsp\" class=\"m-orange-bg\">企业注册</a>");}
document.writeln("                </li>");
/*document.writeln("                <li class=\"nav-down\">");
document.writeln("                    <div class=\"m-header-top-down-bg\"></div>");
document.writeln("                    <div class=\"m-header-top-down\">");
document.writeln("                        <div class=\"m-header-top-down-c-bg\"></div>");
document.writeln("                    </div>");
document.writeln("                </li>");*/
/*document.writeln("                <li>");
document.writeln("                    <div class=\"m-search-box\">");
document.writeln("                        <div class=\"m-search\">");
document.writeln("                            <div style=\"display: none;\">");
document.writeln("                                <script type=\"text/javascript\">(function(){document.write(unescape(\'%3Cdiv id=\"bdcs\"%3E%3C/div%3E\'));var bdcs = document.createElement(\'script\');bdcs.type = \'text/javascript\';bdcs.async = true;bdcs.src = \'http://znsv.baidu.com/customer_search/api/js?sid=11537630733015923110\' + \'&plate_url=\' + encodeURIComponent(window.location.href) + \'&t=\' + Math.ceil(new Date()/3600000);var s = document.getElementsByTagName(\'script\')[0];s.parentNode.insertBefore(bdcs, s);})();</script>");
document.writeln("                            </div>");
document.writeln("                            <div class=\"m-search-bg\"></div>");
document.writeln("                            <i class=\"m-icon m-icon-search\" onclick=\"search_site(\'search_txt_header\')\"></i>");
document.writeln("                        <form method=\"get\" action=\"http://zhannei.baidu.com/cse/search\" target=\"_blank\">");
document.writeln("                            <input type=\"text\" name=\"q\" value=\"\" placeholder=\"搜索\" id=\"search_txt_header\"/>");
document.writeln("                            <input type=\"hidden\" name=\"s\" value=\"7716523458624774032\"/>");
document.writeln("                            <input type=\"hidden\" name=\"entry\" value=\"1\"/>");
document.writeln("                        </form>");
document.writeln("                        </div>");
document.writeln("                    </div>");
document.writeln("                </li>");*/
document.writeln("            </ul>");
document.writeln("        </div>");
document.writeln("    </div>");
document.writeln("</div>");
document.writeln("<script type=\"text/javascript\" charset=\"utf-8\" src=\"http://account.vsochina.com/static/js/global_nav.js?t=20150824\"></script>");
document.writeln("");
// document.writeln(unescape('%3Cdiv id="bdcs"%3E%3C/div%3E%3Cscript charset="utf-8" src="http://rp.baidu.com/rp3w/3w.js?sid=7716523458624774032') + '&t=' + (Math.ceil(new Date()/3600000)) + unescape('"%3E%3C/script%3E'));