
$(document).ready(function(){
	for(var i=1;i<=8;i++){
		if($("#imgPath"+i).height() > 100){
			var precent = (100/$("#imgPath"+i).height())*100;
			$("#imgPath"+i).css("max-width",precent+"%");
			$("#imgPath"+i).css("max-height",precent+"%");
		}else if($("#imgPath"+i).height() < 100){
			$("#imgPath"+i).css("padding-top",(100-$("#imgPath"+i).height())/2+"px");
			$("#imgPath"+i).css("padding-bottom",(100-$("#imgPath"+i).height())/2+"px");
		}
	}
	var sum = 0;
	$(".totalPrice").each(function(){
		sum += parseFloat($(this).attr("value"));
	})
	$("#sumPrice").html("￥"+sum);
	$("#conform").click(function(){
		$.ajax({
			type:"get",
			url:"Ajax_servlet",
			data:{
				type:"perchaseConform"
			},
			success:function(){
				$("#myModal_perchaseSuccess").modal("show");
				setTimeout(function(){
					location.href="Welcome";
				},2000)
			}
		})
	})
})