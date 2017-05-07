<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'MyJsp.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>

<script type="text/javascript" src="js/jquery-1.11.3.js"></script> 
<script type="text/javascript"> 
$(function () { 
//品牌 
var alink01 = $("#linktype01").find("span"); 
alink01.click(function () { 
alink01.each(function () { 
$(this).removeClass("templinkactive").addClass("templink"); 
}); 
$(this).removeClass("templink").addClass("templinkactive"); 
$("#Brand").val($(this).attr("tag")); 
}) ;

//价格 
var alink02 = $("#linktype02").find("span"); 
alink02.click(function () { 
alink02.each(function () { 
$(this).removeClass("templinkactive").addClass("templink"); 
}); 
$(this).removeClass("templink").addClass("templinkactive"); 
$("#Price").val($(this).attr("tag")); 
}) 

//尺寸 
var alink03 = $("#linktype03").find("span"); 
alink03.click(function () { 
alink03.each(function () { 
$(this).removeClass("templinkactive").addClass("templink"); 
}); 
$(this).removeClass("templink").addClass("templinkactive"); 
$("#Size").val($(this).attr("tag")); 
SetPara(); 
 
}); 

var alink04 = $("#position").find("a"); 
alink04.click(function () { 
	alink04.each(function () { 
		$(this).removeClass("templinkactive").addClass("templink"); 
	}); 
	$(this).removeClass("templink").addClass("templinkactive"); 
	$("#positionkey").val($(this).attr("id")); 
});

}); 

function SetPara() { 
var a = $("#Brand").val(); 
var b = $("#Price").val(); 
var c = $("#Size").val(); 
alert("1.aspx?a=" + a + "&b=" + b + "&c=" + c); 
}
</script> 
<style type="text/css"> 
.templinkactive 
{ 
padding:5px; 
text-decoration:none; 
background-color: #2788DA; 
color:#ffffff; 
} 
.templink 
{ 
cursor:pointer; 
padding:5px; 
text-decoration:none; 
} 
table tr{ height:35px;} 
</style> 
</head> 
<body> 
<form id="form1" runat="server"> 
<div> 
<table> 
<tr id="linktype01"> 
<td style="width:100px"> 
<b>笔记本品牌</b> 
</td> 
<td> 
<span class='templinkactive' tag="0">不限</span> 
</td> 
<td> 
<span class='templink' tag="100101">联想（Lenovo）</span> 
</td> 
<td> 
<span class='templink' tag="100102">宏碁（Acer）</span> 
</td> 
<td> 
<span class='templink' tag="100103">华硕（ASUS）</span> 
</td> 
<td> 
<span class='templink' tag="100104">戴尔（DELL）</span> 
</td> 
<td> 
<span class='templink' tag="100105">苹果（Apple）</span> 
</td> 
<td> 
<span class='templink' tag="100106">三星 （SAMSUNG）</span> 
</td> 
</tr> 
<tr id="linktype02"> 
<td style="width:100px"> 
<b>价格范围</b> 
</td> 
<td> 
<span class='templinkactive' tag="0">不限</span> 
</td> 
<td> 
<span class='templink' tag="100201">1000-2999</span> 
</td> 
<td> 
<span class='templink' tag="100202">3000-3499</span> 
</td> 
<td> 
<span class='templink' tag="100203">4000-4499</span> 
</td> 
<td> 
<span class='templink' tag="100204">5000-5999</span> 
</td> 
<td> 
<span class='templink' tag="100205">6000-6999</span> 
</td> 
<td> 
<span class='templink' tag="100206">7000及以上</span> 
</td> 
</tr> 
<tr id="linktype03"> 
<td style="width:100px"> 
<b>尺寸范围</b> 
</td> 
<td> 
<span class='templinkactive' tag="0" >不限</span> 
</td> 
<td> 
<span class='templink' tag="100301">8.9英寸及以下</span> 
</td> 
<td> 
<span class='templink' tag="100302">11英寸</span> 
</td> 
<td> 
<span class='templink' tag="100303">12英寸</span> 
</td> 
<td> 
<span class='templink' tag="100304">13英寸</span> 
</td> 
<td> 
<span class='templink' tag="100305">14英寸</span> 
</td> 
<td> 
<span class='templink' tag="100306">15英寸及以上</span> 
<input type="hidden" id="Brand" value="0" /> 
<input type="hidden" id="Price" value="0" /> 
<input type="hidden" id="Size" value="0" /> 
</td> 
</tr> 
</table> 
</div> 
</form> 
<div class="position" id="position">
    <font size=2 color=gray>工作地点：</font> 
    	<a herf="" class="templinkactive" id="不限">不限</a>     &nbsp; &nbsp; 	
		<a herf="" class="templink" id="香洲区">香洲区</a>     &nbsp; &nbsp; 		
		<a herf=""  class="templink" id="斗门区">斗门区</a>    &nbsp; &nbsp; 
		<a herf=""  class="templink" id="金湾区">金湾区</a>    &nbsp; &nbsp; 
		<a herf=""  class="templink" id="横琴新区">横琴新区</a>    &nbsp; &nbsp; 
		<a herf=""  class="templink" id="高新区">高新区</a>    &nbsp; &nbsp; 
		<a herf=""  class="templink" id="万山区">万山区</a>    &nbsp; &nbsp; 
		<a herf=""  class="templink" id="高栏港经济区">高栏港经济区</a>    &nbsp; &nbsp; 
		<a herf=""  class="templink" id="保税区" >保税区</a>    &nbsp; &nbsp; 
</div>
<input type="hidden" name="positionkey" id="positionkey">
</body> 
</html> 
  </body>
</html>
