$(document).ready(function(){
	$.ajax({
		type:"get",
		url:"Ajax_servlet",
		data:{
			type:"ifLogin"
		},
		success:function(data){
			if(data != "true"){
				location.href="login.jsp";
			}
		}
	})
	for(var i=1;i<5;i++){
		$(".cartItem"+i).fadeIn(i*200)
	}
	for(var i=1;i<=8;i++){
		if($("#"+i).height() > 130){
			var precent = (130/$("#"+i).height())*100;
			$("#"+i).css("max-width",precent+"%");
			$("#"+i).css("max-height",precent+"%");
		}else if($("#"+i).height() < 130){
			$("#"+i).css("padding-top",(130-$("#"+i).height())/2+"px");
			$("#"+i).css("padding-bottom",(130-$("#"+i).height())/2+"px");
		}
	}
	$(".pageNum").click(function(){
		for(var i=1;i<5;i++){
			$(".cartItem"+i).fadeOut((5-i)*200);
		}
		$.ajax({
			type:"get",
			url:"Ajax_servlet",
			data:{
				type:"changePageState",
				changeType:"pageNum",
				pageNum:$(this).attr("pageState")
			},
			success:function(){
				setTimeout(function(){
					location.reload();
				},500)
			}
		})
	})
	$("#next").click(function(){
		for(var i=1;i<5;i++){
			$(".cartItem"+i).fadeOut((5-i)*200);
		}
		$.ajax({
			type:"get",
			url:"Ajax_servlet",
			data:{
				type:"changePageState",
				changeType:"pageNext"
			},
			success:function(){
				setTimeout(function(){
					location.reload();
				},500)
			}
		})
	})
	$("#previous").click(function(){
		for(var i=1;i<5;i++){
			$(".cartItem"+i).fadeOut((5-i)*200);
		}
		$.ajax({
			type:"get",
			url:"Ajax_servlet",
			data:{
				type:"changePageState",
				changeType:"pagePrevious"
			},
			success:function(){
				setTimeout(function(){
					location.reload();
				},500)
			}
		})
	})
})