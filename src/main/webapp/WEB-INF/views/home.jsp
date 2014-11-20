<%@ page contentType="text/html;charset=euc-kr"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="euc-kr">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<!-- 홈페이지 UI와 레이아웃을 꾸미기 위해 파일 추가 -->

<!-- jQuery -->
<script src="<c:url value="/resources/js/jquery.js" />"></script>

<!-- Bootstrap Core JavaScript -->
<script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>

<!-- Scrolling Nav JavaScript -->
<script src="<c:url value="/resources/js/jquery.easing.min.js" />"></script>
<script src="<c:url value="/resources/js/scrolling-nav.js" />"></script>

<!-- Bootstrap Core CSS -->
<link href="<c:url value="/resources/css/bootstrap.min.css" />"
	rel="stylesheet">

<!-- Custom CSS -->
<link href="<c:url value="/resources/css/scrolling-nav.css" />"
	rel="stylesheet">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    
<title>Whole Database Info</title>

</head>
<body id="page-top" data-spy="scroll" data-target=".navbar-fixed-top">
	<!-- Navigation -->
	<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
		<div class="container">
			<div class="navbar-header page-scroll">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-ex1-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand page-scroll" href="#page-top">Intro</a>
			</div>

			<!-- 해당 위치로 이동할 목록 -->
			<div class="collapse navbar-collapse navbar-ex1-collapse">
				<ul class="nav navbar-nav">
					<li class="hidden"><a class="page-scroll" href="#page-top"></a>
					</li>
					<li><a class="page-scroll" href="#users">Calendar Users</a></li>
					<li><a class="page-scroll" href="#events">Events</a></li>
					<li><a class="page-scroll" href="#attendees">EventAttendees</a>
					</li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container -->
	</nav>

	<!-- Intro Section -->
	<section id="intro" class="intro-section">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<h1>2008135005 고겸재</h1>
					<br>
					<h2>Assignment 4</h2>
					<br>
					<p>
						이 페이지는 페이지 소개, Calendar Users 출력, Events 출력, EventAttendee 출력 세
						페이지로 나뉘어 있습니다.<br>
						페이지 상단에 보이는 메뉴를 클릭하여 각 페이지로 이동할 수 있으며,
						스크롤을 움직여서 각 내용을 확인할 수도 있습니다. <br><br>
						본 페이지는 다음과 같이 구성되어있습니다. <br><br>

						<table width="20%" cellpadding="5" cellspacing="0" border="1"
						align="center"
						style="border-collapse: collapse; border: 1px gray solid;"><tr>
							<td style="border: 1px gray solid; height: 60px;">
							Intro</td>
						</tr>
						<tr>
							<td style="border: 1px gray solid; height: 60px;">
							Calendar User List</td>
						</tr>
						<tr>
							<td style="border: 1px gray solid; height: 60px;">
							Event List</td>
						</tr>
						<tr>
							<td style="border: 1px gray solid; height: 60px;">
							Event	Attendee List</td>
						</tr>
					</table>
					</p>

				</div>
			</div>
		</div>
	</section>

	<!-- CalendarUsers Section -->
	<section id="users" class="about-section">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<h1>Calendar User List</h1>
					<br> <br>
					<table style="width: 100%;">
						<tr>
							<td><h3>count</h3></td>
							<td><h3>id</h3></td>
							<td><h3>name</h3></td>
							<td><h3>email</h3></td>
						</tr>
						<c:forEach var="calendarUser" items="${calendarUsers}"
							varStatus="status">
							<tr>
								<td align="center" class="listtd"><c:out
										value="${status.count}" /></td>
								<td align="center" class="listtd"><c:out
										value="${calendarUser.id}" /></td>
								<td align="center" class="listtd"><c:out
										value="${calendarUser.name}" /></td>
								<td align="center" class="listtd"><c:out
										value="${calendarUser.email}" /></td>
							</tr>

						</c:forEach>
					</table>
				</div>
			</div>
		</div>
	</section>

	<!-- Events Section -->
	<section id="events" class="services-section">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<h1>Event List</h1>
					<br> <br>
					<table style="width: 100%;">
						<tr>
							<td><h3>count</h3></td>
							<td><h3>id</h3></td>
							<td><h3>when</h3></td>
							<td><h3>summary</h3></td>
							<td><h3>description</h3></td>
							<td><h3>Owner</h3></td>
							<td><h3>Likes</h3></td>
							<td><h3>Level</h3></td>
						</tr>
						<c:forEach var="event" items="${events}" varStatus="status">

							<tr>
								<td align="center" class="listtd"><c:out
										value="${status.count}" /></td>
								<td align="center" class="listtd"><c:out
										value="${event.id}" /></td>
								<td align="center" class="listtd"><c:out
										value="${event.when.getTime()}" /></td>
								<td align="center" class="listtd"><c:out
										value="${event.summary}" /></td>
								<td align="center" class="listtd"><c:out
										value="${event.description}" /></td>
								<td align="center" class="listtd"><c:out
										value="${event.owner.getName()}" /></td>
								<td align="center" class="listtd"><c:out
										value="${event.numLikes}" /></td>
								<td align="center" class="listtd"><c:out
										value="${event.eventLevel}" /></td>
							</tr>

						</c:forEach>
					</table>
				</div>
			</div>
		</div>
	</section>

	<!-- EventAttendees Section -->
	<section id="attendees" class="contact-section">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<h1>Event Attendee List</h1>
					<br> <br>
					<table style="width: 100%;">
						<tr>
							<td><h3>count</h3></td>
							<td><h3>id</h3></td>
							<td><h3>event</h3></td>
							<td><h3>attendee</h3></td>
						</tr>
						<c:forEach var="eventAttendee" items="${eventAttentees}"
							varStatus="status">

							<tr>
								<td align="center" class="listtd"><c:out
										value="${status.count}" /></td>
								<td align="center" class="listtd"><c:out
										value="${eventAttendee.id}" /></td>
								<td align="center" class="listtd"><c:out
										value="${eventAttendee.event.getSummary()}" /></td>
								<td align="center" class="listtd"><c:out
										value="${eventAttendee.attendee.getName()}" /></td>
							</tr>

						</c:forEach>
					</table>
				</div>
			</div>
		</div>
	</section>
</body>
</html>



