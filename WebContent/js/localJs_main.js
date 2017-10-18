/**
 * 
 */
$(document).ready(function(){
	for(var i=1;i<=8;i++){
		if($("#"+i).height() > 252.5){
			var precent = (252.5/$("#"+i).height())*100;
			$("#"+i).css("max-width",precent+"%");
			$("#"+i).css("max-height",precent+"%");
		}else if($("#"+i).height() < 252.5){
			$("#"+i).css("padding-top",(252.5-$("#"+i).height())/2+"px");
			$("#"+i).css("padding-bottom",(252.5-$("#"+i).height())/2+"px");
		}
	}
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
				$("#tb_isLogin").attr("style","display:");
				$("#tb_unLogin").attr("style","display:none");
				$("#loginCenter").attr("style","margin-bottom:55px");
			}else{
				$("#nav_loginInfo_unLogin").attr("style","display:block");
				$("#nav_loginInfo_isLogin").attr("style","display:none");
				$("#tb_isLogin").attr("style","display:none");
				$("#tb_unLogin").attr("style","display:");
			}
		}
	})
	$(".main_tr").click(function(){
		//alert($(this).attr("value"));
		$("#form_type_key").val($(this).attr("value"));
		//alert($("#form_type_key").val())
		$("#form_type").submit();
	})
	$(".items").click(function(){
		$("#form_item_ID").val($(this).attr("itemID"));
		$("#form_item").submit();
	})
	$("#signOut").click(function(){
		$.ajax({
			type:"get",
			url:"Ajax_servlet",
			data:{
				type:"logout"
			},
			success:function(data){
				location.reload();
			}
		})
	})
})