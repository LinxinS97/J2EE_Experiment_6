/**
 * 
 */
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
	$(".stock").each(function(){
		if(parseInt($(this).attr("value")) < 11){
			$("#divLeft"+$(this).attr("itemID")).css("background-color","#fff8e1");
			$("#divRight"+$(this).attr("itemID")).css("background-color","#fff8e1");
		}
	})
	$(".itemIDList").click(function(){
		$("#sum").html($(".itemIDList:checked").length);
		var sumPrice = 0;
		$(".itemIDList:checked").each(function(){
			sumPrice += parseFloat($("#totalPrice"+$(this).val()).attr("totalPrice"))
		})
		$("#sumPrice").html("总价: ￥"+sumPrice);
	})
	$(".checkAll").click(function(){
		var sum = 0;
		var sumPrice = 0;
	    if($("input.checkAll").prop("checked")){
	    	$(".itemIDList").prop("checked",true);
	    	sum = $(".itemIDList").length;
	    	$("#sum").html(sum);
	    	$(".itemIDList:checked").each(function(){
				sumPrice += parseFloat($("#totalPrice"+$(this).val()).attr("totalPrice"));
			})
			$("#sumPrice").html("总价: ￥"+sumPrice);
	    }else{
	    	$(".itemIDList").prop("checked",false);
	    	$("#sum").html(0);
	    	$("#sumPrice").html("总价: ￥0.00");
	    }
	});
	$(".itemNum").blur(function(){
		if(parseInt($(this).val()) > parseInt($("#stock"+$(this).attr("itemID")).attr("value"))){
			$(this).val($("#stock"+$(this).attr("itemID")).attr("value"));
		}else if(parseInt($(this).val()) < 1){
			$(this).val("1");
		}
		$("#totalPrice"+$(this).attr("itemID")).attr("totalPrice",$(this).attr("onePrice")*$(this).val())
		$("#totalPrice"+$(this).attr("itemID")).html(
				"总价:￥"+($(this).attr("onePrice")*$(this).val())
				);
	})
	$(".deleteCart").click(function(){
		$("#div"+$(this).attr("itemID")).fadeOut();
		$.ajax({
			type:"get",
			url:"Ajax_servlet",
			data:{
				type:"deleteCart",
				itemID:$(this).attr("itemID")
			},
			success:function(){
				setTimeout(function(){
					location.reload();
				},500);
			}
		})
	})
	$("#deleteCheckedCart").click(function(){
		if($(".itemIDList:checked").length == 0)
			return;
		var list = new Array();
		$(".itemIDList:checked").each(function(index){
			$.ajax({
				type:"get",
				url:"Ajax_servlet",
				data:{
					type:"deleteCart",
					itemID:$(this).val()
				}
			})
		})
		setTimeout(function(){
			location.reload();
		},500);
	})
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
	$("#perchaseGo").click(function(){
		var list1 = new Array();
		var list2 = new Array();
		$(".itemIDList:checked").each(function(index){
			list1[index] = $(this).val();
		})
		$(".itemNum").each(function(index){
			for(var i=0; i<list1.length;i++){
				if($(this).attr("itemID") == list1[i])
					list2[index] = $(this).val();
			}
		})
		$.ajax({
			type:"get",
			url:"Ajax_servlet",
			data:{
				type:"perchaseGo_cart",
				itemList:list1.toString(),
				numList:list2.toString()
			},
			success:function(){
				location.href="perchaseConform.jsp"
			}
		})
	})
})