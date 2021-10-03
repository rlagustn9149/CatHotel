<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.net.URLEncoder"%>
<%
	request.setCharacterEncoding("UTF-8");	

	Cookie reservationId = new Cookie("Reservation_Id", URLEncoder.encode(request.getParameter("reservationId"), "utf-8"));
	Cookie name = new Cookie("Reservation_name", URLEncoder.encode(request.getParameter("name"), "utf-8"));
	Cookie phoneNumber = new Cookie("Reservation_phoneNumber", URLEncoder.encode(request.getParameter("phoneNumber"), "utf-8"));
	Cookie checkIn = new Cookie("Reservation_checkIn",	URLEncoder.encode(request.getParameter("checkIn"), "utf-8"));
	Cookie checkOut = new Cookie("Reservation_checkOut",	URLEncoder.encode(request.getParameter("checkOut"), "utf-8"));
	Cookie description = new Cookie("Reservation_description",	URLEncoder.encode(request.getParameter("description"), "utf-8"));
	
		
	name.setMaxAge(24 * 60 * 60);
	phoneNumber.setMaxAge(24 * 60 * 60);
	checkIn.setMaxAge( 24 * 60 * 60);
	checkOut.setMaxAge(24 * 60 * 60);
	description.setMaxAge(24 * 60 * 60);

	response.addCookie(reservationId);
	response.addCookie(name);
	response.addCookie(phoneNumber);
	response.addCookie(checkIn);
	response.addCookie(checkOut);
	response.addCookie(description);
	
	response.sendRedirect("CheckReservation.jsp");
%>