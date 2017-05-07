<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'RecruitmentJsp.jsp' starting page</title>
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
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="js/jquery-1.11.3.js"></script>
<script type="text/javascript">
  $(document).ready(function(){
  //	$("#selectkind").click(function(){
		$.ajax({  //异步刷新，可不要
                url :"Lookkind1.action",  //后台处理程序          
                type:"post",    //数据发送方式  
                async:false,  
                dataType:"json",   //接受数据格式             
                error: function(){  
                  alert("error");
             	},  
  				success: function(data){  
  				 	$("#selectkind").empty();			
	  				var d=eval(data);
	  				var obj = eval(data["qq"] ); 			 				
	  				$.each(obj,function(i,value) {    				  		
	                     $("#selectkind").append("<option value=" + value.id +" >" + value.name + "</option>");    
	                });                         
            }   
      	 });       	 
    	//});	
    $("#selectkind").change(function(){
		var kid=$("#selectkind").val();
		//alert(kid);
		$.ajax({  //异步刷新，可不要
                url :"Lookposition.action?kid="+kid,  //后台处理程序                 
                type:"get",    //数据发送方式  
                async:false,  
                dataType:"json",   //接受数据格式        
                 error: function(){  
                  alert("error");
              },  
                success:function(data){ 
                	$("#selectposition").empty();
                	var json=eval(data["Joblist"]);
                	//alert(json);
					$.each(json,function(i,value){ 
						$("#selectposition").append("<option value=" + value.id +" >" + value.name + "</option>");     
				}) ;			
    }
    });    				
	});				
});

</script>
<style>
input[type="text"]{
       width:250px;
       height:35px;
       margin-top: 5px;
	
}
input[type="date"]{
       width:250px;
       height:35px;
       margin-top: 5px;
	
}
select{
       width:90px;
       height:35px;
       margin-top: 5px;
	
}
textarea{
       width:250px;
       height:70px;
       margin-top: 5px;
	
}
input[type="submit"]{
       
       width:80px;
       height:35px;
       margin-top: 10px;
}
</style>
  </head>
  
  <body>
    <form name="form1" method="post" action="Rec!createRecruitment">
	      职位名称：
	      <input type="text" name="name"/><br>
	   <!--  <input type="text" name="name"><br>   -->
	 
	     就职要求：  
	     <textarea rows="3" cols="20" name="requirement"></textarea>
	     <br>
	    <!-- <input type="text" name="requirement"><br> -->
	  <!--   开始时间： 
	      <input type="date" name="starttime" value="Select date" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Select date';}"> 
	   <input type="text" name="starttime"> -->
	     结束时间： 
	      <input type="date" name="endtime" value="Select date" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Select date';}"> 
	 <!--    <input type="text" name="endtime"> --><br>
	     职位种类：  
	   <!--  <input type="text" name="position"><br> -->
	    <select name="selectkind" id="selectkind"> 
	            <option value=""> 请选择</option>
       </select> 
        <select name="position" id="selectposition"> 	          
       </select>  
       <br>        
	     工作地点：  
	   <select name="workplace" id="workplace"> 
	            <option value="null"> 请选择</option>
	             <option value="香洲区"> 香洲区</option>
	              <option value="金湾区">  金湾区</option>
	               <option value="斗门区"> 斗门区</option>
	                <option value="高新区">高新区</option>
	                 <option value="万山区"> 万山区</option>
	                  <option value="高栏港经济区"> 高栏港经济区</option>
	                   <option value="保税区"> 保税区</option>	            
	               	    <option value=" 横琴新区"> 横琴新区</option>	               
       </select>
       <br>  
	    职位月薪：
	    <input type="text" name="salary"><br> 
	    招聘人数：
	    <input type="text" name="number"><br>   
     	<input type="submit" value="确定发布"/>
    </form>
  </body>
</html>
