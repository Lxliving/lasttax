<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String username =(String)request.getSession().getAttribute("username");
boolean hasLogined = false;
if(username!=null){
	hasLogined = true;
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<base href="<%=basePath%>">
<title>安徽省国家税务局税企互助交流平台</title>
<meta name="viewport" content="width=device-width" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="css/read.css">
<link rel="stylesheet" href="css/page.css">
<link rel="stylesheet" href="css/head.css">
<link rel="icon" href="image/home/favicon.gif" type="image/x-icon" />
<script src="js/jquery.js" type="text/javascript" charset="utf-8"></script>
<script src="js/page.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="js/star.js" charset="utf-8"></script>
<link rel="stylesheet" href="css/tips.css" />
<link rel="stylesheet" href="css/ScreenChange.css" />

<style type="text/css">
#four {
	border-bottom: 1px solid #fff;
	padding-bottom: 15px;
	color: #fff;
	display: inline-block;
	width: 90%;
	height: 60%;
}

#fourplus {
	background: #1B55A9;
}
</style>

<style type="text/css">
li {
	list-style: none;
}

body {
	min-height: 900px;
	background: #eee;
}
</style>
</head>
<body>
	<div class="top" style="display: flex; justify-content: space-around;">
		<div class="logo"></div>
		<div class="daohang">
			<ul id="tabs_nav"
				style="display: flex; justify-content: space-around;">
				<li id="oneplus"><a href="webPages/NewFile.jsp" id="one">首页</a><span
					class="underline"></span></li>
				<li id="twoplus"><a href="webPages/zixun/zixun.jsp" id="two">咨询</a></li>
				<li id="threeplus"><a href="webPages/jingyan1/jingyan1.jsp"
					id="three">经验分享</a></li>
				<li id="fourplus"><a href="webPages/jiedu/jiedu.jsp" id="four">专业解读</a></li>
				<li id="fiveplus"><a href="webPages/userarea/userarea.jsp"
					id="five">用户专区</a></li>
				<form action="">
					<li class="top_search">
						<div class="search">
							<a href="webPages/zixun/find.jsp"> <img alt="" src="image/icon/fdj.png"
								class="fangdajing">
							</a> <input type="text" id="sousuo" name="title" class="find"
								value="搜索问题…" />
						</div>
					</li>
				</form>

			</ul>
		</div>
		<!--   用户登录     -->
		<div class="user">
		<div class="user_content">

		<%
			if (username == null){
				out.println("<a href=\"webPages/jiedu/login.jsp\" style=\"padding: 0 50px;\"> <img src=\"image/header/u198.png\" class=\"person\">\n");
				out.println("</a>\n");
				out.println("<div style=\"position: absolute; left: 20px; line-height: 0px;\">\n");
				out.println("<div style=\"line-height: 13px;\">\n");
				out.println("<a href=\"webPages/jiedu/login.jsp\">登录</a>\n");
				out.println("</div>\n");
				out.println("<div style=\"line-height: 13px;\">&nbsp;/&nbsp;</div>\n");
				out.println("<div style=\"text-align: left; line-height: 13px;\">\n");
				out.println("<a href=\"webPages/jiedu/register.jsp\">注册</a>\n");
				out.println("</div>\n");
				out.println("</div>\n");
			}
			else{
				out.println("<a href=\"webPages/usercenter/MyIntro.jsp\" style=\"padding: 0 50px;\"> <img src=\"image/header/u198.png\" class=\"person\">\n");
				out.println("</a>\n");
				out.println("<div style=\"position: absolute; left: 20px; line-height: 0px;\">\n");
				out.println("<div style=\"line-height: 13px;\">\n");
				out.println("<a href=\"webPages/usercenter/MyIntro.jsp\">"+ username +"</a>\n");
				out.println("</div>\n");
				out.println("<div style=\"line-height: 13px;\">&nbsp;/&nbsp;</div>\n");
				out.println("<div style=\"text-align: left; line-height: 13px;\">\n");
				out.println("<a href=\"webPages/jiedu/login.jsp\">退出</a>\n");
				out.println("</div>\n");
				out.println("</div>\n");
			}
		
		%>
		<!-- 
			<a href="webPages/jiedu/login.jsp" style="padding: 0 50px;"> <img
				src="image/header/u198.png" class="person">
			</a>
			<div style="position: absolute; left: 20px; line-height: 0px;">
				<div style="line-height: 13px;">
					<a href="webPages/jiedu/login.jsp">登录</a>
				</div>
				<div style="line-height: 13px;">&nbsp;/&nbsp;</div>
				<div style="text-align: left; line-height: 13px;">
					<a href="webPages/jiedu/register.jsp">注册</a>
				</div>
			</div>
		-->
		</div>
	</div>
	</div>


	<script>
        $(function(){
           $(".user_text").hover(function(){
               var width_a = $(this).width();
               var width_b = $(this).find(".user_id").width();
               var indent_px = width_a - width_b;
               if( width_a <= width_b ){
                   $(this).css("text-indent",indent_px);
               }
           },function(){
               $(this).css("text-indent","0");
           });
        });
    </script>
	<!-- input点击清除value值 -->
	<script type="text/javascript">
		wap_val = [];
		$(".ssearch").each(function(i) {
			wap_val[i] = $(this).val();
			$(this).focusin(function() {
				if ($(this).val() == wap_val[i]) {
					$(this).val("");
				}
			}).focusout(function() {
				if ($.trim($(this).val()) == "") {
					$(this).val(wap_val[i]);
				}
			});
		});
		//  用户名显示
		 $(".user_id").each(function(){
		  var maxwidth=4;
		  if($(this).text().length > maxwidth){
		    $(this).text($(this).text().substring(0,maxwidth));
		    $(this).html($(this).html()+'...');
		  }
		}); 
	</script>
</body>
</html>
<div class="mask" ></div> 
<div class="dialog"> 
  
<div class="title"> 
<img alt="点击可以关闭" src="image/icon/closepopwinbtn.png" width="20px" height="20px;"> 
</div> 
  
<div class="tips_content"> 
<img alt="" src="image/tips.png" width="115px" height="115px" style="position: absolute; margin-left: 80px;margin-right: 80px;margin-top: 0px;"> 
	<div class="content_wenzi" ><span >请先登录用户</span> </div>
</div> 
 
<div class="bottom"> 
<input type="button" id="ok" value="确定" class="ok_btn" style=" "> 
</div> 
  
</div>
<div class="content">
	<div class="content_main">
		<div class="shuiwu_center_search"></div>
		<div class="c_s_header">
			<div class="lists">
				<div class="ex_main_left_content_header">

					<ul style="background: none">


						<li><span>专业解读</span></li>



					</ul>
				</div>
				<div id="exSharingContainer">
					<div class="exSharingContent">

						<ul class="ex_main_left_content_ul uls clearfix">
							<li class="center_top">
								<ul>
									<li style="padding-left: 20px"><a
										href="webPages/posts/post_1475754962616.jsp">焦点问题的意见</a></li>
									<li style="float: right;">2012-12-13</li>
								</ul>
							</li>
							<li class="center_bottom">
								<ul style="background: none">
									<li><span>浏览：</span> <span> 67</span></li>
									<li><span>收藏：</span> <span class="starCount">3</span></li>
									<li	onClick="star(this)" style="float:right;cursor:pointer;display:"block"">
										<span class="star" >收藏</span>
										<span class="has_star" style="display: none">已收藏</span></li>
								</ul>
							</li>
						</ul>

						<ul class="ex_main_left_content_ul uls clearfix">
							<li class="center_top">
								<ul>
									<li style="padding-left: 20px"><a
										href="webPages/posts/post_1475754962618.jsp">当事人关于争议焦点问题的意见</a></li>
									<li style="float: right;">2012-12-12</li>
								</ul>
							</li>
							<li class="center_bottom">
								<ul style="background: none">
									<li><span>浏览：</span> <span> 34</span></li>
									<li><span>收藏：</span> <span class="starCount">1</span></li>
								<li	onClick="star(this)" style="float:right;cursor:pointer;display:"block"">
										<span class="star" >收藏</span>
										<span class="has_star" style="display: none">已收藏</span></li>
								</ul>
							</li>
						</ul>

						<ul class="ex_main_left_content_ul uls clearfix">
							<li class="center_top">
								<ul>
									<li style="padding-left: 20px"><a
										href="webPages/posts/post_1513307706343.jsp">所得的税的缴纳</a></li>
									<li style="float: right;">2017-12-15</li>
								</ul>
							</li>
							<li class="center_bottom">
								<ul style="background: none">
									<li><span>浏览：</span> <span> 27</span></li>
									<li><span>收藏：</span> <span class="starCount">0</span></li>
								<li	onClick="star(this)" style="float:right;cursor:pointer;display:"block"">
										<span class="star" >收藏</span>
										<span class="has_star" style="display: none">已收藏</span></li>
								</ul>
							</li>
						</ul>

						<ul class="ex_main_left_content_ul uls clearfix">
							<li class="center_top">
								<ul>
									<li style="padding-left: 20px"><a
										href="webPages/posts/post_1513390982768.jsp">专业解读所得税</a></li>
									<li style="float: right;">2017-12-16</li>
								</ul>
							</li>
							<li class="center_bottom">
								<ul style="background: none">
									<li><span>浏览：</span> <span> 14</span></li>
									<li><span>收藏：</span> <span class="starCount">0</span></li>
									<li	onClick="star(this)" style="float:right;cursor:pointer;display:"block"">
										<span class="star" >收藏</span>
										<span class="has_star" style="display: none">已收藏</span></li>
								</ul>
							</li>
						</ul>

						<ul class="ex_main_left_content_ul uls clearfix">
							<li class="center_top">
								<ul>
									<li style="padding-left: 20px"><a
										href="webPages/posts/post_1513477945710.jsp">专业解读个人所得税？</a></li>
									<li style="float: right;">2017-12-17</li>
								</ul>
							</li>
							<li class="center_bottom">
								<ul style="background: none">
									<li><span>浏览：</span> <span> 4</span></li>
									<li><span>收藏：</span> <span class="starCount">1</span></li>
									<li	onClick="star(this)" style="float:right;cursor:pointer;display:"block"">
										<span class="star" >收藏</span>
										<span class="has_star" style="display: none">已收藏</span></li>
								</ul>
							</li>
						</ul>

						<ul class="ex_main_left_content_ul uls clearfix">
							<li class="center_top">
								<ul>
									<li style="padding-left: 20px"><a
										href="webPages/posts/post_1513478325043.jsp">专业解读车船税</a></li>
									<li style="float: right;">2017-12-17</li>
								</ul>
							</li>
							<li class="center_bottom">
								<ul style="background: none">
									<li><span>浏览：</span> <span> 2</span></li>
									<li><span>收藏：</span> <span class="starCount">0</span></li>
								<li	onClick="star(this)" style="float:right;cursor:pointer;display:"block"">
										<span class="star" >收藏</span>
										<span class="has_star" style="display: none">已收藏</span></li>
								</ul>
							</li>
						</ul>

						<ul class="ex_main_left_content_ul uls clearfix">
							<li class="center_top">
								<ul>
									<li style="padding-left: 20px"><a
										href="webPages/posts/post_1513478658168.jsp">专业解读1</a></li>
									<li style="float: right;">2017-12-17</li>
								</ul>
							</li>
							<li class="center_bottom">
								<ul style="background: none">
									<li><span>浏览：</span> <span> 6</span></li>
									<li><span>收藏：</span> <span class="starCount">0</span></li>
									<li	onClick="star(this)" style="float:right;cursor:pointer;display:"block"">
										<span class="star" >收藏</span>
										<span class="has_star" style="display: none">已收藏</span></li>
								</ul>
							</li>
						</ul>

						<ul class="ex_main_left_content_ul uls clearfix">
							<li class="center_top">
								<ul>
									<li style="padding-left: 20px"><a
										href="webPages/posts/post_1513560162834.jsp">专业解读4</a></li>
									<li style="float: right;">2017-12-18</li>
								</ul>
							</li>
							<li class="center_bottom">
								<ul style="background: none">
									<li><span>浏览：</span> <span> 4</span></li>
									<li><span>收藏：</span> <span class="starCount">0</span></li>
									<li	onClick="star(this)" style="float:right;cursor:pointer;display:"block"">
										<span class="star" >收藏</span>
										<span class="has_star" style="display: none">已收藏</span></li>
								</ul>
							</li>
						</ul>

						<ul class="ex_main_left_content_ul uls clearfix">
							<li class="center_top">
								<ul>
									<li style="padding-left: 20px"><a
										href="webPages/posts/post_1513749519576.jsp">专业解读税收政策</a></li>
									<li style="float: right;">2017-12-20</li>
								</ul>
							</li>
							<li class="center_bottom">
								<ul style="background: none">
									<li><span>浏览：</span> <span> 0</span></li>
									<li><span>收藏：</span> <span class="starCount">0</span></li>
									<li	onClick="star(this)" style="float:right;cursor:pointer;display:"block"">
										<span class="star" >收藏</span>
										<span class="has_star" style="display: none">已收藏</span></li>
								</ul>
							</li>
						</ul>

					</div>
					<div id="exSharingPage" class="box"></div>
				</div>
			</div>
		</div>
	</div>
</div>

<form style="display: none" id="postsForm" method="GET"
	action="../posts">
	<input value="1" name="page" type="hidden"> <input value="10"
		name="size" type="hidden"> <input value="1" name="type"
		type="hidden" />
</form>



<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
/* 底部 */
.shuiwu_footers {
	width: 100%;
	height: 110px;
	background: #1B55A9;
	overflow: hidden;
	min-width: 1200px;
}

.shuiwu_footers_content {
	width: 1200px;
	height: 150px;
	text-align: center;
	margin: -2px auto;
}

.shuiwu_footers_content ul {
	margin: 25px 0;
	color: #fff;
	font-size: 14px;
}

.shuiwu_footers_content ul li {
	height: 20px;
	line-height: 20px;
}

.shuiwu_footers_content ul li a {
	color: #fff;
	text-decoration: none;
}

.shuiwu_footers_content ul:nth-child(1) {
	height: 50px;
	width: 450px;
	margin: 0 auto;
	text-align: center;
}

.shuiwu_footers_content ul:nth-child(2) {
	width: 505px;
	margin: 0 auto;
	text-align: center;
}

.shuiwu_footers_content ul:nth-child(1) li {
	width: 130px;
	height: 50px;
	text-align: right;
	margin: 0 10px;
	line-height: 50px;
}

.shuiwu_footers_content ul:nth-child(1) li:nth-child(1) {
	float: left;
	background: url(image/home/footer_notice.png) left 30px center no-repeat;
	background-size: 25% 61%;
}

.shuiwu_footers_content ul:nth-child(1) li:nth-child(2) {
	float: left;
	background: url(image/home/footer_proposal.png) left 28px center
		no-repeat;
	background-size: 25% 61%;
}

.shuiwu_footers_content ul:nth-child(1) li:nth-child(3) {
	float: left;
	background: url(image/home/footer_contact.png) left 28px center
		no-repeat;
	background-size: 25% 61%;
}

.shuiwu_use {
	display: flex;
}
</style>
<body>
	<div class="shuiwu_footers" id="footer">
		<div class="shuiwu_footers_content">
			<ul class="shuiwu_use">

				<li><a href="webPages/zixun/UseKnow.jsp" target="_blank">使用须知</a></li>
				<li><a href="webPages/zixun/UseHelp.jsp" target="_blank">网站帮助</a></li>
				<li><a href="webPages/zixun/ContactUs.jsp" target="_blank">联系我们</a></li>
			</ul>
			<ul>

				<!-- <li>技术服务由科大讯飞股份有限公司提供</li>
				<li>地址：合肥市xx区xx路xxxx号 邮编：xxxxxx</li>
				<li>传真：xxxxx 电子邮件：xxxxx</li> -->
				<li>安徽省国家税务局主办 ICP备案号********</li>
				<li>技术服务由科大讯飞股份有限公司提供</li>
				<li>通讯地址：合肥市包河区中山路3398号 联系电话：0551-12366</li>
				<!-- <li>建议使用IE9以上浏览器，分辨率大于1024*768</li> -->
			</ul>
		</div>
	</div>
</body>
</html>
<!-- 底部内容end -->




<script type="text/javascript">
var i=0;
function star(obj){
	var x=<%=hasLogined%>;
	if(x==false){
	$(".mask").css("opacity","0.3").show(); 
		//制作对话框 
	showDialog(); 
		//展现css的特效 
	$(".dialog").show(); 
			}
     else{
     i=i+1;
       if(i%2!=0){
	     $(obj).find('.star').css("display","none");
	     $(obj).find('.has_star').css("display","block");
     }
       else{
    	 $(obj).find('.has_star').css("display","none");
    	 $(obj).find('.star').css("display","block");
     };
    }
}; 
			
			
			
			
			
			
			</script>



<script type="text/javascript">
	
		 var totalPages = Math.ceil(1.1);
		 console.log('totalPages', totalPages);
		 $('#exSharingPage').page({
	         initPageNo: 1, 							// 初始页码
	         totalPages: totalPages, 							// 总页数
	         totalCount: '合计 11条数据', 			// 条目总数
	         slideSpeed: 600, 							// 缓动速度。单位毫秒
	         jump: true, 								// 是否支持跳转
	         initLoad: false,
	         callback: function(page) { 				// 回调函数
	         	var postsForm = document.getElementById("postsForm");
	         	postsForm.page.value = page;
	         	postsForm.submit();
	         }
	     });
		 jQuery(function(){
		  	$('#nextPage').click(function(){$('html,body').animate({scrollTop: '100px'}, 0);return false;});
		  	$('#prePage').click(function(){$('html,body').animate({scrollTop: '100px'}, 0);return false;});
		 	$('#firstPage').click(function(){$('html,body').animate({scrollTop: '100px'}, 0);return false;});
		 	$('#lastPage').click(function(){$('html,body').animate({scrollTop: '100px'}, 0);return false;});
		 	$('.sel-page').click(function(){$('html,body').animate({scrollTop: '100px'}, 0);return false;});
		 	$('.selpage').click(function(){$('html,body').animate({scrollTop: '100px'}, 0);return false;});
		 	$('.jump-button').click(function(){$('html,body').animate({scrollTop: '100px'}, 0);return false;});
		 	$('.turnPage').click(function(){$('html,body').animate({scrollTop: '100px'}, 0);return false;});
		 	$('.last-page').click(function(){$('html,body').animate({scrollTop: '100px'}, 0);return false;});
		 });
	</script>
</body>
</html>
