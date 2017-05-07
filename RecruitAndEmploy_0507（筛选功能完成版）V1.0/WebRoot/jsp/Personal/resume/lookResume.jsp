<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html
	class="ace ace-card-on ace-tab-nav-on ace-main-nav-on ace-sidebar-on"
	data-theme-color="#c0e3e7">
<head>
<base href="<%=basePath%>">

<title>个人简历</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<meta name="description" content="">

<link rel="apple-touch-icon" href="apple-touch-icon.png">
<link rel="shortcut icon" href="favicon.ico">

<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css?family=Quicksand:400,700"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Pacifico"
	rel="stylesheet">

<!-- Icon Fonts -->
<link href="resume/css/style.css" rel="stylesheet">

<!-- Styles -->
<link href="resume/css/solarized-light.css" rel="stylesheet">
<link href="resume/js/style.css" rel="stylesheet">

<!-- Modernizer -->
<script type="text/javascript" src="resume/js/modernizr-3.3.1.min.js"></script>
</head>
<body>
	<div>
		<article id="ace-card" class="ace-card bg-primary">
		<div class="ace-card-inner text-center">
		<c:choose>
		    	<c:when test="${OnePerson.picture!=null}">
		     		<img class="avatar avatar-195" src="personPicture/${OnePerson.picture}"width="195" height="195" alt="">
		   		</c:when>
		    	<c:otherwise>
		    		<img class="avatar avatar-195" src="resume/img/nop.jpg" width="195" height="195" alt="">
		   		</c:otherwise>
		</c:choose>	
			<h1>${OnePerson.name}</h1>
			<p class="text-muted">${OnePerson.householdRegister} | ${OnePerson.sex}</p>

		</div>

		<footer class="ace-card-footer"> <a
			class="btn btn-lg btn-block btn-thin btn-upper " href="downloadbefore">下载简历</a> </footer> </article>
		<!-- #ace-card -->

		<div id="ace-content" class="ace-container-shift">
			<div class="ace-container">
				<div class="ace-paper-stock">
					<main class="ace-paper clearfix">
					<div class="ace-paper-cont clear-mrg">
						<!-- START: PAGE CONTENT -->
						<div class="padd-box clear-mrg">
							<section class="section brd-btm">
							<div class="row">
								<div class="col-sm-12 clear-mrg text-box">
									<h2 class="title-lg text-upper">${OnePerson.name}的个人简历</h2>

								</div>
							</div>
							</section>
							<!-- .section -->

							<section class="section brd-btm">
							<div class="row">
								<div class="col-sm-6 clear-mrg">
									<h2 class="title-thin text-muted">基本资料</h2>

									<dl class="dl-horizontal clear-mrg">
										<dt class="text-upper">姓    名</dt>
										<dd>${OnePerson.name}</dd>

										<dt class="text-upper">籍贯</dt>
										<dd>${OnePerson.householdRegister}</dd>

										<dt class="text-upper">政治面貌</dt>
										<dd>${OnePerson.politicalStatus}</dd>

										<dt class="text-upper">学历</dt>
										<dd>
											${OnePerson.education}
										</dd>

										<dt class="text-upper">毕业院校</dt>
										<dd>${OnePerson.school}</dd>
									</dl>
								</div>
								<!-- .col-sm-6 -->

								<div class="col-sm-6 clear-mrg">
									<h2 class="title-thin text-muted">
										<font color="#FFFFFF">基本资料</font>
									</h2>
									<dl class="dl-horizontal clear-mrg">
										<dt class="text-upper">性    别</dt>
										<dd>${OnePerson.sex}</dd>

										<dt class="text-upper">电话</dt>
										<dd>${OnePerson.phone}</dd>

										<dt class="text-upper">邮箱</dt>
										<dd>${OnePerson.mailbox}</dd>

										<dt class="text-upper">身高</dt>
										<dd>
											153cm
										</dd>

										<dt class="text-upper">住址</dt>
										<dd>${OnePerson.address}</dd>


									</dl>

								</div>
								<!-- .col-sm-6 -->
							</div>
							<!-- .row --> </section>
							<!-- .section -->

							<section class="section brd-btm">
							<div class="row">
								<div class="col-sm-6 clear-mrg">
									<h2 class="title-thin text-muted">兴趣爱好</h2>
									<!-- 兴趣爱好文本框-->
									<div class="textbox"
										style="margin-left:40px; width:80%;height:120px">
										${Oneresume.hobby}</div>

								</div>
								<!-- .col-sm-6 -->
								<!-- .col-sm-6 -->
							</div>
							<!-- .row --> </section>
							<!-- .section -->

							<section class="section brd-btm">
							<div class="row">
								<div class="col-sm-6 clear-mrg">
									<h2 class="title-thin text-muted">工作经验</h2>

									<div class="progress-line ace-animate" role="progressbar"
										aria-valuenow="90" aria-valuemin="0" aria-valuemax="100">
										<div class="textbox"
											style="margin-left:40px; width:80%;height:120px">
											${Oneresume.handsOnBackground}</div>
									</div>
								</div>
								<!-- .col-sm-6 -->
							</section>
							<!-- .section -->
							<section class="section brd-btm">
							<div class="row">
								<div class="col-sm-6 clear-mrg">
									<h2 class="title-thin text-muted">获奖情况</h2>

									<ul class="styled-list clear-mrg">

										<li>${Oneresume.awardSituation}</li>
									</ul>
								</div>
								<!-- .col-sm-6 -->
							</div>
							<!-- .row --> 
							</section>
							<!-- .section -->
						<section class="section">							
							<div class="row">
								<!-- .col-sm-6 -->
								<!-- .col-sm-6 -->
							</div>
							<!-- .row --> </section>
							<!-- .section -->
						</div>
						<!-- .padd-box -->
						<!-- END: PAGE CONTENT -->

					</div>
					<!-- .ace-paper-cont --> </main>
					<!-- .ace-paper -->
				</div>
				<!-- .ace-paper-stock -->

			</div>
			<!-- .ace-container -->
		</div>
		<!-- #ace-content -->
		<!-- #ace-sidebar -->

		<footer id="ace-footer" class="ace-container-shift">
		<div class="ace-container">
			<div class="ace-footer-cont clear-mrg">
				<p class="text-center">Copyright &copy; 2017.Company name All
					rights reserved. 珠海招聘</p>
			</div>
		</div>
		<!-- .ace-container --> </footer>
		<!-- #ace-footer -->


	</div>
	<!-- .ace-wrapper -->

	<!-- Scripts -->
	<script type="text/javascript" src="resume/js/jquery-1.12.4.min.js"></script>


</body>
</html>
