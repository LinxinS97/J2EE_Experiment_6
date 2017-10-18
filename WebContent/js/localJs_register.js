/**
 * helpBlock1:用户名为空
 * helpBlock2:密码为空
 * helpBlock3:密码确认为空
 * helpBlock4:两次密码输入不一致
 * helpBlock5:手机号码为空
 * helpBlock6:手机号码格式不标准
 * helpBlock7:用户名已存在
 */

$(document).ready(function(){
	$("#nav-mypocket").attr("style","display:none");
	$("#nav-myfavourite").attr("style","display:none");
	$("#my-nav-dropdown").attr("style","display:none");
	
	$("#username").blur(function(){
		if($("#username").val() == ""){
			$("#username-div").addClass("has-error");
			$("#wrong1").attr("style","display:block");
		}else{
			$.ajax({
				type:"get",
				url:"Ajax_servlet",
				data:{
					type:"ifUsernameExist",
					username:$("#username").val()
				},
				success:function(data){
					if(data == "true"){
						$("#username-div").addClass("has-error");
						$("#username-span").attr("style","display:block");
						$("#helpBlock7").attr("style","display:block");
						return;
					}else{
						$("#helpBlock7").attr("style","display:none");
					}
				}
			})
			$("#username-div").attr("class","form-group has-success has-feedback");
			$("#username").attr("for","inputSuccess1");
			$("#wrong1").attr("style","display:none");
			$("#helpBlock1").attr("style","display:none");
		}
	})
	$("#psw").blur(function(){
		if($("#psw").val() == ""){
			$("#psw-div").addClass("has-error");
			$("#wrong2").attr("style","display:block");
		}else{
			$("#psw-div").attr("class","form-group has-success has-feedback");
			$("#psw").attr("for","inputSuccess1");
			$("#wrong2").attr("style","display:none");
			$("#helpBlock2").attr("style","display:none");
		}
	})
	$("#psw-conform").blur(function(){
		if($("#psw-conform").val() == ""){
			$("#psw-conform-div").addClass("has-error");
			$("#wrong3").attr("style","display:block");
			$("#helpBlock3").attr("style","display:block");
			$("#helpBlock4").attr("style","display:none");
		}else if($("#psw-conform").val() != $("#psw").val()){
			$("#psw-conform-div").addClass("has-error");
			$("#wrong3").attr("style","display:block");
			$("#helpBlock3").attr("style","display:none");
			$("#helpBlock4").attr("style","display:block");
		}else{
			$("#psw-conform-div").attr("class","form-group has-success has-feedback");
			$("#psw-conform").attr("for","inputSuccess1");
			$("#wrong3").attr("style","display:none");
			$("#helpBlock3").attr("style","display:none");
			$("#helpBlock4").attr("style","display:none");
		}
	})
	$("#tel").blur(function(){
		var ret = /^1[34578]\d{9}$/;
		var str = $("#tel").val();
		if($("#tel").val() == ""){
			$("#tel-div").addClass("has-error");
			$("#wrong4").attr("style","display:block");
			$("#helpBlock5").attr("style","display:block");
			$("#helpBlock6").attr("style","display:none");
		}else if(!ret.test(str)){
			$("#tel-div").addClass("has-error");
			$("#wrong4").attr("style","display:block");
			$("#helpBlock6").attr("style","display:block");
			$("#helpBlock5").attr("style","display:none");
		}else{
			$("#tel-div").attr("class","form-group has-success has-feedback");
			$("#tel").attr("for","inputSuccess1");
			$("#wrong4").attr("style","display:none");
			$("#helpBlock5").attr("style","display:none");
			$("#helpBlock6").attr("style","display:none");
		}
	})
	$("#bt-submit").click(function(){
		if($("#username-div").hasClass("has-error") 
				|| $("#psw-div").hasClass("has-error") 
				|| $("#psw-conform-div").hasClass("has-error") 
				|| $("#tel-div").hasClass("has-error")){
			return false;
		}else if($("#username").val() == "" 
			|| $("#psw").val() == "" 
				|| $("#psw-conform").val() == "" 
					|| $("#tel").val() == ""){
			return false;
		}
	})
	$("#img").change(function(){   
		var file = this.files[0];
		if (window.FileReader) {    
			var reader = new FileReader();    
			reader.readAsDataURL(file);    
			//监听文件读取结束后事件    
			reader.onloadend = function (e) {
			    $("#img-show").attr("src",e.target.result);    //e.target.result就是最后的路径地址
			}
		}
	})
});