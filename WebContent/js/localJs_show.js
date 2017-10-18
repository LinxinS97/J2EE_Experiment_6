//Ajax_servlet
/**
 * Ajax_servlet判断：
 * ifLogin：返回登录的信息(true/false)，字符串
 * Login：返回登录是否成功
 * ifUsernameExist:返回用户名是否存在(true,false)
 */

$(document).ready(function(){
	$.ajax({
		type:"get",
		url:"Ajax_servlet",
		data:{
			type:"ifLogin"
		},
		success:function(data){
			if(data == "true"){
				$("#nav_loginInfo_unLogin").attr("style","display:none");
				$("#nav_loginInfo_isLogin").attr("style","display:block");
			}else{
				$("#nav_loginInfo_unLogin").attr("style","display:block");
				$("#nav_loginInfo_isLogin").attr("style","display:none");
			}
		}
	})
	
	if($("#item_img").height() > 487.5){
		var precent = (487.5/$("#item_img").height())*100;
		$("#item_img").css("max-width",precent+"%");
		$("#item_img").css("max-height",precent+"%");
	}else if($("#item_img").height() < 487.5){
		$("#item_img").css("padding-top",(487.5 - $("#item_img").height())/2);
		$("#item_img").css("padding-bottom",(487.5 - $("#item_img").height())/2);
	}

	$(".items").click(function(){
		$("#form_item_ID").val($(this).attr("itemID"));
		$("#form_item").submit();
	})
	
	$("#p_btn").mousedown(function(event){
		$.ajax({
			type:"get",
			url:"Ajax_servlet",
			data:{
				type:"ifLogin"
			},
			success:function(data){
				if(data == "true"){
					$("#p_btn").removeAttr("data-toggle");
					$.ajax({
						type:"get",
						url:"Ajax_servlet",
						data:{
							type:"perchaseGo_show",
							itemID:$("#p_btn").attr("ItemID"),
							num:$("#itemNum").val()
						},
						success:function(){
							$("#p_btn").attr("href","perchaseConform.jsp");
						}
					})
				}else{
					$("#p_btn").attr("data-target","#myModal_login");
					return false;
				}
			}
		})
	})
	
	$("#sc_btn").mousedown(function(){
		$.ajax({
			type:"get",
			url:"Ajax_servlet",
			data:{
				type:"addCart",
				ItemID:$(this).attr("ItemID"),
				num:$("#itemNum").val()
			},
			success:function(data){
				if(data == "unLogin"){
					$("#sc_btn").attr("data-target","#myModal_login");
				}else if(data == "isExist"){
					$("#sc_btn").attr("data-target","#myModal_itemExist");
				}else if(data == "true"){
					$("#sc_btn").attr("data-target","#myModal_addSuccess");
					setTimeout(function(){
						location.reload();
					},1000);
				}
			}
		})
	})
	
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
						location.reload();
						$("#nav_loginInfo_unLogin").attr("style","display:none");
						$("#nav_loginInfo_isLogin").attr("style","display:block");
						flag = true;
					}else if(data == "pswError"){
						$("#psw-div").attr("class","form-group has-success has-feedback");
						$("#psw").attr("for","inputSuccess1");
						$("#psw-span").attr("style","display:none");
						$("#helpBlock3").attr("style","display:none");
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