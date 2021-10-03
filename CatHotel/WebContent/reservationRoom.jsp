<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript" src="./resources/js/validation.js"></script>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<title>호텔 예약</title>
</head>
<body>

	<%
		String roomNumber=(String)session.getAttribute("roomNumber");		
		String reservationId=request.getParameter("reservationId");	
		if(reservationId==null){
			reservationId=session.getId();
		} 
	%>

	<fmt:setLocale value='<%= request.getParameter("language") %>'/>
	<fmt:bundle basename="bundle.message">

	<%@ include file="menu.jsp" %>
	
	<div class="container">
		<p><h1><fmt:message key="title"/></h1>
		<hr>
	</div>
	<div class="container">
		<div class="text-right">
			<a href="?language=ko">Korean</a> | <a href="?language=en">English</a>
			<a href="logout.jsp" class="btn btn-sm btn-success pull-right">logout</a>
		</div>
	
		<form name="newReservation"action="./processReservation.jsp" class="form-horizontal" method="post">
			<input type="hidden" name="reservationId" value="<%=reservationId%>"/>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="name"/></label>
				<div class="col-sm-3">
					<input name="name" id="name" type="text" class="form-control" />
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="phoneNumber"/></label>
				<div class="col-sm-3">
					<input name="phoneNumber" id="phoneNumber" type="text" placeholder="010-1234-1234" class="form-control" />
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="checkIn"/></label>
				<div class="col-sm-3">
					<input name="checkIn" id="checkIn" type="text" placeholder="yyyy-mm-dd" class="form-control" />
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="checkOut"/></label>
				<div class="col-sm-3">
					<input name="checkOut" id="checkOut" type="text" placeholder="yyyy-mm-dd" class="form-control" /> 
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="description"/></label>
				<div class="col-sm-5">
					<textarea name="description" id="description" cols="50" rows="2" placeholder="<fmt:message key="description1"/>"
					class="form-control"></textarea>
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10 ">
					<a href="./room.jsp?roomNumber=<%=roomNumber%>" class="btn btn-secondary" role="button"> 이전 </a> 
					<input	type="button" class="btn btn-primary" value="예약" onclick="CheckReservation()"/>
					<a href="./reservationCancelled.jsp" class="btn btn-secondary" role="button"> 취소 </a>
				</div>
			</div>
			<hr>
			<h3><p class="text-danger"><fmt:message key="notice"/></p></h3> 
			<p> -<fmt:message key="notice1"/>
			<p> -<fmt:message key="notice2"/>
		</form>
	</div>
</fmt:bundle>
</body>
</html>
