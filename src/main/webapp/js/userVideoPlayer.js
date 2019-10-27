

function play0(){
    var file = document.getElementById('v_file').files[0];
    var url = URL.createObjectURL(file);
    console.log(url);
    $("#video").attr("src",url);
    $("#video").attr("autoplay","autoplay");
    //$("#video").setAttribute("autoplay",autoplay);
//    $("#v_file").hide();
}

function play2(path){
	var url = "contextPath/" + path;
	$("video").attr("src",url);
}

$(function(){
	$("#videoIframe").css("display","none");
	$("#historyInf").click(function(){
		$("#videoIframe").css("display","none");
		$("#historyIframe").css("display","block");
		doSelectClass(this);
		/*$.ajax({
			url:"${pageContext.request.contextPath}/user/videoPlayingHistory",
			type:"post",
			success:function(){
				
			}
		});*/
	});
	$("#videoInf").click(function(){
		$("#videoIframe").css("display","block");
		$("#historyIframe").css("display","none");
		doSelectClass(this);
	});
	//修改样式
	function doSelectClass(obj){
		$(".videoFile input").each(function(i){
			$(this).css("color","#000");
			$(this).css("background-color","#dbdbdb");
		});
		$(obj).css("color","#fff");
		$(obj).css("font-weight","bold");
		$(obj).css("background-color","#209e85");
	}
});
