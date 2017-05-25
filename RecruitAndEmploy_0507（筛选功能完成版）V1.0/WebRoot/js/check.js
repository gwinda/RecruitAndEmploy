	
//页面加载时显示验证码图片
window.onload=function(){
    var verifyObj = document.getElementById("Verify");
    verifyObj.onclick=function(){
        this.src="SecurityCodeImageAction.action?timestamp="+new Date().getTime();
    };
};
    $(function () {  
        //更换验证码图片
        $("#Verify").click(function(){
            $(this).attr("src","SecurityCodeImageAction.action?timestamp="+new Date().getTime());
        });
    });
    $(function () {  
        //当ID对应文本框的失去焦点时
        $("#number").blur(function(){
        	
        	if($(this).val()==""){
        		 $("#num_fail").html("*手机号码不能为空");
        	}
        	if(isNaN($(this).val())){
         		 $("#num_fail").html("*出现非数字");
          	}   
        	if($(this).val().length!=11){
       		 $("#num_fail").html("*手机号码位数为11位");
        	}        	    	
      });
        $("#surname").blur(function(){
        	if($(this).val()==0){
        		 $("#surname_wrong").html("真实姓名不能为空");
        	}
        	
        });       
        $("#mailbox").blur(function(){
        	var myreg =  /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
        	if($(this).val()!=null&&$(this).val().length!=0){
        		if(myreg.test($(this).val())){
        			getExitAjax($(this).val());
            	}
        		else{
        			$("#email_wrong").html("邮箱格式不合法");
        		}
        		
        	}else{
        		 $("#email_wrong").html("邮箱地址不能为空");
        	}
        	
        });
        //登录界面邮箱
        $("#emailbox").blur(function(){
        	var myreg =  /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
        	if($(this).val()!=null&&$(this).val().length!=0){
        		if(!myreg.test($(this).val())){
        			$("#email_wrong").html("邮箱格式不合法");
        		}
        	}
        	else{
          		 $("#email_wrong").html("邮箱地址不能为空");
           	}
        });
        $("#password").blur(function(){
        	if($(this).val().length==0||$(this).val()==null){
        		 $("#psd1_wrong").html("密码不能为空");
        	}
        	if($(this).val().length<6||$(this).val().length>20){
          		 $("#psd1_wrong").html("密码位数为6~20 位");
           	}
        });
        $("#pwd2").blur(function(){
        	if($(this).val()==0){
        		 $("#psd2_wrong").html("确认密码不能为空");
        	}
        	if($(this).val()!=$("#password").val()){
          		 $("#psd2_wrong").html("密码不一致");
           	}
        });
        $("#veryCode").blur(function(){
        	if($(this).val()==0){
        		 $("#info").html("验证码不能为空");
        	}       	
        });
        $("#number").focus(function(){     	
        		$("#num_fail").html("");
        });
        $("#password").focus(function(){        	
        	$("#psd1_wrong").html("");       	
        });
       
        $("#veryCode").focus(function(){        	
        	$("#info").html("");        	      	
        });
        $("#surname").focus(function(){        
        	$("#surname_wrong").html("");      	
        });
        $("#mailbox").focus(function(){
        	 $("#email_wrong").html("");      	
        });
        $("#pwd2").focus(function(){
       	 	$("#psd2_wrong").html("");      	
       });       
    });

    function isRightCode(){
   	 var code = $("#veryCode").val();   	
   	 $.ajax({
   	  type:"json",
   	  url:"validator.action?code="+code,
   	  async: false,
   	  data:code,
   	  success:callback
   	 });
   	}
   	function callback(data){
   	 $("#info").html(data);
   	 return false;
   	}	
   	function checklogin(){
		isRightCode();
		if($("#emailbox").val().length!=0&&$("#password").val().length!=0){
			
			if(document.getElementById("info").textContent=="验证码正确"){			
				//alert("nini");
				if($("input:radio:checked").val()=="person"){
					//alert($("input:radio:checked").val());
					document.form.action="loginC!login.action"; 
					//window.location.href="loginC!login.action?number="+$("#number").val()+"&&password="+$("#password").val();
					//alert($("input:radio:checked").val());	
					return true;
				}
				if($("input:radio:checked").val()=="company"){
					alert($("input:radio:checked").val());
					document.form.action="Login!einformation";
					//window.location.href="error.jsp?number="+$("#number").val()+"&&password="+$("#password").val();
					return true;
					//alert($("input:radio:checked").val());				
				}		   			
			}
			else{
				alert("验证码填写错误");
				 return false;
			}
		}else{
			alert("信息填写不完整");
			return false;
		}
	}  
		
	function check(){
		isRightCode();//判断验证码是否正确
		if($("#number").val().length!=0&&$("#surname").val().length!=0&& $("#mailbox").val().length!=0&& $("#pwd2").val().length!=0){
			//alert("ss");
			//alert($("#email_wrong").html());
			 if($.trim($("#email_wrong").html())==$.trim("该账号未被使用，请放心使用")){
					alert("该账号未被使用，请放心使用");
					if(document.getElementById("info").textContent.equals("验证码正确")){	
						return true;
					}
					else{
						return false;
					}
				}else{
					alert("该邮箱账号已被使用，请重新输入");
					return false;
				}
				
		}
		else{
		alert("信息填写不完整");
			return false;
		}
		
	}
	function  getExitAjax(mail){
		$.ajax({  //异步刷新，可不要
            url :"CheckPersonExit.action",  //后台处理程序          
            type:"post",    //数据发送方式  
            data:"mail="+mail,
            async:false,  
            dataType:"text",   //接受数据格式             
            error: function(){  
              alert("error");
         	},  
				success: function(data){
					//var d=data.IndexOf[0];
					//alert(data.length);
					if(data.length==6){		
						$("#email_wrong").html("该账号未被使用，请放心使用");
					}
					if(data.length==7){		
						$("#email_wrong").html("该账号已被使用，请重新输入");
					}
					else{
						$("#email_wrong").html();
					}
					}
				
				});
	}
