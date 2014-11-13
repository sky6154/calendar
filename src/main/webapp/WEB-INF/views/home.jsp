<%@ page contentType="text/html;charset=euc-kr"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>Whole Database Info</title>
</head>
<body>
<h1>
	calendarUsers!  
</h1>

<c:forEach var="calendarUser" items="${calendarUsers}" varStatus="status">
<table border=1>
<tr>
	<td align="center" class="listtd"><c:out value="${status.count}"/></td>
	<td align="center" class="listtd"><c:out value="${calendarUser.id}"/></td>
	<td align="left" class="listtd"><c:out value="${calendarUser.name}"/> </td>
	<td align="center" class="listtd"><c:out value="${calendarUser.email}"/> </td>
</tr>
</table>
</c:forEach>

<h1>
	events!  
</h1>

<c:forEach var="event" items="${events}" varStatus="status">
<table border=1>
<tr>
	<td align="center" class="listtd"><c:out value="${status.count}"/></td>
	<td align="center" class="listtd"><c:out value="${event.id}"/></td>
	<td align="left" class="listtd"><c:out value="${event.when.getTime()}"/> </td>
	<td align="center" class="listtd"><c:out value="${event.summary}"/> </td>
	<td align="center" class="listtd"><c:out value="${event.description}"/> </td>
	<td align="center" class="listtd"><c:out value="${event.owner}"/> </td>
	<td align="center" class="listtd"><c:out value="${event.numLikes}"/> </td>
	<td align="center" class="listtd"><c:out value="${event.eventLevel}"/> </td>
</tr>
</table>
</c:forEach>

<h1>
	EventAttendees!  
</h1>

<c:forEach var="eventAttendee" items="${eventAttendees}" varStatus="status">
<table border=1>
<tr>
	<td align="center" class="listtd"><c:out value="${status.count}"/></td>
	<td align="center" class="listtd"><c:out value="${eventAttendee.id}"/></td>
	<td align="left" class="listtd"><c:out value="${eventAttendee.event}"/> </td>
	<td align="center" class="listtd"><c:out value="${eventAttendee.attendee}"/> </td>
</tr>
</table>
</c:forEach>

</body>
</html>

