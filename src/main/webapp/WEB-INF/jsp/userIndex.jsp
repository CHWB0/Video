<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html  PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="multipart/form-data; charset=utf-8" />
	<title></title>
	<link rel="stylesheet"  type="text/css" href="${contextPath}/css/userIndex.css" />
	<script type="text/javascript" src="${contextPath}/js/jquery-2.1.0.js"></script>
	<script type="text/javascript" src="${contextPath}/js/userVideoPlayer.js"></script>
	<script type="text/javascript" src="${contextPath}/js/pcAndPhone.js"></script>
	<style type="text/css">
		.videoPicture{
			float:left;
			width:20%;
			height:155px;
			text-align:center;
		}
		.videoImg{
			float:left;
			width:20%;
			height:125px;
			text-align:center;
		    box-shadow: 1px 1px 1px rgba(0,0,0,0.3);  
		}
		.vMessage{
			float:left;
			width:30%;
			height:125px;
			text-align:center;
		    box-shadow: 1px 1px 1px rgba(0,0,0,0.3);  
		}
    	td{
			overflow: hidden;
			text-overflow:ellipsis;
			white-space: nowrap;
		}
    </style>
</head>
<body oncontextmenu = "return false">
	<div id="headerDiv" style="max-width: 95%;margin: 0px auto;">
		<!-- 描述：第一部分logo -->
		<div style="height: 90px;text-align: center;">
			<div class="logo" style="text-align: left;">
				<img src="${pageContext.request.contextPath }/img/logo.jpg" width="90%" height="80px"/>
			</div>
			<div class="logo">
				<form action="${contextPath }/user/doVideoListByDate" method="post"> 
					<input type="date" name="uploadTime" size="40" style="height: 40px; width: 70%;" >	
					<input type="submit" value="视频搜索">
				</form>
			</div>
			<div class="logo">
				<a href="showUserIndex"><font size="5">首页 |</font></a>&emsp;
				<a href="personInf"><font size="5" color="#000000">个人信息 |</font></a>&emsp;
				<a href="${contextPath }/showIndex"><font size="5">退出 |</font></a>
				<a href="#"><font size="5">帮助 </font></a>&emsp;
			</div>
	    </div>
	   
	    <!-- 清除浮动 -->
		<div style="clear: both;"></div>
		 <!-- 描述：第二部分：导航栏 -->
	    <div style="background-color: black;height: 53px;">
	    	<a class="menu" href="#">首页</a>&emsp;&nbsp;
	    	<a class="menu" href="#">单词学习</a>&emsp;&nbsp;
	    	<a class="menu" href="#">阅读学习</a>&emsp;&nbsp;
	    	<a class="menu" href="#">听力学习</a>&emsp;&nbsp;
	    	<a class="menu" href="#">翻译学习</a>&emsp;&nbsp;
	    	<a class="menu" href="#">写作学习</a>
	    </div>
	    <!-- 描述：第三部分：播放器+最近播放+打开文件视频 -->
	    <div>
	    	<!-- 描述：播放器 -->
	        <div class="videoPlayer">
	        	<video id="video" width="730px" height="450px" controls="controls" controlsList="nodownload" οncοntextmenu="return false" preload="auto">
				  	<source src="${contextPath }/${entity.path}" type="video/mp4" />
				</video>
	        </div>
	        <!-- 描述：最近播放的10个视频+新打开的文件目录 -->
	        <div class="videoFile">
	        	<div>
	        		<input type="button" id="historyInf" value="播放记录"/>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
        			<input type="button" id="videoInf" value="视频目录"/>
	        	</div>
	        	<div>
	        		<iframe src="${contextPath }/user/videoPlayingHistory" frameBorder="0" scrolling="no" id="historyIframe"></iframe>
	        		<iframe src="${contextPath }/video/videoList0/1" frameBorder="0" scrolling="no" id="videoIframe"></iframe>
	        	</div>
	        	<div style="margin-top:-70px;margin-left:10px">
	        		本地磁盘：<input id="v_file" type="file" onChange="play0()"/>
	        	</div>
	        </div>
	        <!-- 第四部分：视频播放图片 -->
    	<!-- 清除浮动加一空格行 -->
   		<div style="width:100%;height:50px;clear: both;"></div>
    	<div>
    		<div>
    			<h2>热门栏目推荐<img src="${contextPath }/img/title2.jpg"></h2>
    			<hr>
    		</div>
    		<div id="dv" style="float:left;width:100%">
    			<c:forEach var="vMg" items="${fileEntity }">
   					<div class="videoPicture">
   						<img src="${contextPath }/${vMg.picturePath}" onclick="play('${contextPath}/${vMg.path}','${vMg.fileId }','${vMg.playingAmount }')"/>
   						<p>${vMg.titleOrig }</p>
   						<p>点击量${vMg.playingAmount }</p>
   					</div>
   				</c:forEach>
    		</div>
    	</div>
    	<!-- 第五部分：最后三天上传的视频，分期显示  -->
    	<div style="max-width: 95%;margin: 0px auto;">
   		<!-- day1 -->
   		<!-- 清除浮动加一空格行 -->
   		<div style="width:100%;height:50px;clear: both;"></div>
   		<div class="group">
   			<h2>${day1}日上传视频</h2>
   			<hr>
   			<div class="dayVideo" style="float:left;width:100%">
   				<c:forEach var="day1" items="${entityDay1 }">
   					<div class="videoImg">
   						<video id="video" controls="controls" controlsList="nodownload" οncοntextmenu="return false"  preload="auto" width="100%" height="125px" onplaying="InsertRelation('${day1.fileId }','${day1.playingAmount }')" >
						  	<source src="${contextPath }/${day1.path}" type="video/mp4" />
						</video>
   					</div>
   					<div class="vMessage"><p>${day1.titleOrig }</p><p>${day1.uploadTime }</p><p>${day1.type }</p></div>
   				</c:forEach>
   			</div>
   		</div>
   		<!-- day2 -->
   		<div style="width:100%;height:50px;clear: both;"></div>
   		<div class="group">
   			<h2>${day2}日上传视频</h2>
   			<hr>
   			<div class="dayVideo" style="float:left;width:100%">
   				<c:forEach var="day2" items="${entityDay2 }">
   					<div class="videoImg">
   						<video id="video" controls="controls" controlsList="nodownload" οncοntextmenu="return false" preload="auto" width="100%" height="125px" onplaying="InsertRelation('${day2.fileId }','${day2.playingAmount }')" >
						  	<source src="${contextPath }/${day2.path}" type="video/mp4" />
						</video>
   					</div>
   					<div class="vMessage"><p>${day2.titleOrig }</p><p>${day2.uploadTime }</p><p>${day2.type }</p></div>
   				</c:forEach>
   			</div>
   		</div>
   		<!-- day3 -->
   		<div style="width:100%;height:50px;clear: both;"></div>
   		<div class="group">
   			<h2>${day3}日上传视频</h2>
   			<hr>
   			<div class="dayVideo" style="float:left;width:100%">
   				<c:forEach var="day3" items="${entityDay3 }">
   					<div class="videoImg">
   						<video id="video" controls="controls" controlsList="nodownload" οncοntextmenu="return false" preload="auto" width="100%" height="125px" onplaying="InsertRelation('${day3.fileId }','${day3.playingAmount }')" >
						  	<source src="${contextPath }/${day3.path}" type="video/mp4" />
						</video>
   					</div>
   					<div class="vMessage"><p>${day3.titleOrig }</p></p><p>${day3.uploadTime }</p><p>${day3.type }</p></div>
   				</c:forEach>
   			</div>
   		</div>
	    </div>
	</div>
</div>
</body>
<script type="text/javascript">
	function play(path,id,amount){
		var url =  path;
		//console.log(url);
		$("#video").attr("src",url);
		$("#video", parent.document.body).attr("autoplay","autoplay");
		var playingAmount = amount;
		var fileId = id;
		$.ajax({
			url:"${pageContext.request.contextPath}/video/updateVideoPlayingAmount",
			type:"post",
			data:{"fileId":fileId,"playingAmount":playingAmount},
			success:function(data){
				//console.log(data);
			}
		});
		$.ajax({
			url:"${pageContext.request.contextPath}/user/insertUvRelation",
			type:"post",
			data:{"fileId":fileId},
			success:function(data){
				//console.log(data);
			}
		});
	}
</script>
<script type="text/javascript">
	function InsertRelation(id,amount){
		var fileId = id;
		var playingAmount = amount;
	    console.log(playingAmount);
		$.ajax({
			url:"${pageContext.request.contextPath}/video/updateVideoPlayingAmount",
			type:"post",
			data:{"fileId":fileId,"playingAmount":playingAmount},
			success:function(data){
				//console.log(data);
			}
		}); 
		$.ajax({
			url:"${pageContext.request.contextPath}/user/insertUvRelation",
			type:"post",
			data:{"fileId":fileId},
			success:function(data){
				//console.log(data);
			}
		});
	}
	
	var vid = document.getElementById("video");
	vid.onpause = function(){
		window.location.reload();
	};
</script>
</html>