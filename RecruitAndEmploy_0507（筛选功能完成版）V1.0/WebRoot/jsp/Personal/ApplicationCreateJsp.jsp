<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'ApplicationJsp.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>

<script type="text/javascript">
  $(document).ready(function(){
   $("#selectkind").click(function(){
		$.ajax({  //异步刷新，可不要
                url :"Lookkind1.action",  //后台处理程序          
                type:"post",    //数据发送方式  
                async:false,  
                dataType:"json",   //接受数据格式             
                error: function(){  
                  alert("error");
             	},  
  				success: function(data){   				
	  				var d=eval(data);
	  				var obj = eval(data["qq"] ); 			 				
	  				$.each(obj,function(i,value) {    				  		
	                     $("#selectkind").append("<option value=" + value.id +" >" + value.name + "</option>");    
	                });                         
            }   
      	 }); 
      	 
    	});			
});

</script>
  </head>
  
  <body>
     <select name="selectkind" id="selectkind"> 
	      <%-- <c:forEach var="kind" items="${industrylist}">
        	<option value="${kind.id}">${kind.name}</option>   
           </c:forEach>  --%>       
       </select> 
  </body>
</html>
