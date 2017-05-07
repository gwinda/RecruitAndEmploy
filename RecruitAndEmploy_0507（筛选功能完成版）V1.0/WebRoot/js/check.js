	
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
        		 $("#num_fail").html("账号不能为空");
        	}
        	var myreg =  /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
        	if(!myreg.test($(this).val())){
       		 	$("#email_wrong").html("邮箱格式不合法");
        	}
        	    	
      });
        $("#surname").blur(function(){
        	if($(this).val()==0){
        		 $("#surname_wrong").html("真实姓名不能为空");
        	}
        	
        });       
        $("#mailbox").blur(function(){
        	var myreg =  /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
        	if($(this).val()==null){
        		 $("#email_wrong").html("邮箱地址不能为空");
        	}
        	if(!myreg.test($(this).val())){
       		 	$("#email_wrong").html("邮箱格式不合法");
        	}
        });
        
        $("#password").blur(function(){
        	if($(this).val()==0){
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
        	if($(this).test($("#password").val())){
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
		if(document.getElementById("info").textContent=="验证码正确"){			
			//alert("nini");
			if($("input:radio:checked").val()=="person"){
			//	alert($("input:radio:checked").val());
				document.form.action="loginC!login.action"; 
				//window.location.href="loginC!login.action?number="+$("#number").val()+"&&password="+$("#password").val();
				//alert($("input:radio:checked").val());	
				return true;
			}
			if($("input:radio:checked").val()=="company"){
				//alert($("input:radio:checked").val());
				document.form.action="Login!einformation";
				//window.location.href="error.jsp?number="+$("#number").val()+"&&password="+$("#password").val();
				return true;
				//alert($("input:radio:checked").val());				
			}
	   			
		}
		return false;
	}  
	function check(){
		isRightCode();
		if(document.getElementById("info").textContent=="验证码正确"){	
			return true;
		}
		return false;
	}
