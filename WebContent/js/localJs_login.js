$(document).ready(function(){
	$("#nav-mypocket").attr("style","display:none");
	$("#nav-myfavourite").attr("style","display:none");
	$("#my-nav-dropdown").attr("style","display:none");
	
	//判断用户名是否为空
	//判断用户名是否为空
	$("#username").blur(function(){
		if($("#username").val() == ""){
			$("#username-div").addClass("has-error");
			$("#username-span").attr("style","display:block");
		}else{
			$("#username-div").attr("class","form-group has-success has-feedback");
			$("#username").attr("for","inputSuccess1");
			$("#username-span").attr("style","display:none");
			$("#helpBlock1").attr("style","display:none");
			$("#helpBlock4").attr("style","display:none");
		}
	})
	
	//判断密码是否为空
	$("#psw").blur(function(){
		if($("#psw").val() == ""){
			$("#psw-div").addClass("has-error");
			$("#psw-span").attr("style","display:block");
		}else{
			$("#psw-div").attr("class","form-group has-success has-feedback");
			$("#psw").attr("for","inputSuccess1");
			$("#psw-span").attr("style","display:none");
			$("#helpBlock2").attr("style","display:none");
			$("#helpBlock3").attr("style","display:none");
		}
	})
	
	//用户名或密码为空则不允许登录
	$("#bt-submit").click(function(event){
		var flag = false;
		if($("#username").val() == "" && !$("#username-div").hasClass("has-error")){
			$("#username-div").addClass("has-error");
			$("#username-span").attr("style","display:block");
			$("#helpBlock1").attr("style","display:block");
			return flag;
		}else if($("#psw").val() == "" && !$("#username-div").hasClass("has-error")){
			$("#psw-div").addClass("has-error");
			$("#psw-span").attr("style","display:block");
			$("#helpBlock2").attr("style","display:block");
			return flag;
		}else if($("#psw-div").hasClass("has-error") || $("#username-div").hasClass("has-error")){
			return flag;
		}else{
			$.ajax({
				type:"post",
				url:"Ajax_servlet",
				data:{
					type:"login",
					username:$("#username").val(),
					password:$("#psw").val()
				},
				success:function(data){
					if(data == "true"){
						location.href = "Welcome";
					}else if(data == "pswError"){
						$("#psw-div").attr("class","form-group has-error has-feedback");
						$("#psw-span").attr("style","display:block");
						$("#helpBlock3").attr("style","display:block");
						flag = false;
					}else if(data == "unknownUsername"){
						$("#username-div").addClass("has-error");
						$("#username-span").attr("style","display:block");
						$("#helpBlock4").attr("style","display:block");
						flag = false;
					}
				}
			})
			return flag;
		}
	})
});