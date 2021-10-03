<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.net.URLDecoder"%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>주문 완료</title>
</head>
<body>
	<%
		String reservation_Id="";
		String reservation_name = "";
		String reservation_phoneNumber = "";
		String reservation_checkIn = "";
		String reservation_checkOut = "";
		String reservation_description = "";		

		Cookie[] cookies = request.getCookies();

		if (cookies != null) {
			for (int i = 0; i < cookies.length; i++) {
				Cookie thisCookie = cookies[i];
				String n = thisCookie.getName();
				if (n.equals("Reservation_Id"))
					reservation_Id = URLDecoder.decode((thisCookie.getValue()), "utf-8");
				if (n.equals("Reservation_name"))
					reservation_name = URLDecoder.decode((thisCookie.getValue()), "utf-8");
				if (n.equals("Reservation_checkIn"))
					reservation_checkIn = URLDecoder.decode((thisCookie.getValue()), "utf-8");
				if (n.equals("Reservation_checkOut"))
					reservation_checkOut = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			}
		}
	%>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">예약 완료</h1>
		</div>
	</div>
	<div class="container">
		<h2 class="alert alert-danger">예약해주셔서 감사합니다.</h2>
		<p>	주문번호 :	<%	out.println(reservation_Id);%>
		<p> 예약자 성함 : <% out.println(reservation_name); %>
		<p> 이용일 : <%out.println(reservation_checkIn);%> 부터 <%out.println(reservation_checkOut); %>까지
	</div>
	<div class="container">
		<p>	<a href="./welcome.jsp" class="btn btn-secondary"> &laquo; 홈으로</a>		
	</div>
</body>
</html>
<%
	session.invalidate();

	for (int i = 0; i < cookies.length; i++) {
		Cookie thisCookie = cookies[i];
		String n = thisCookie.getName();
		if (n.equals("Shipping_cartId"))
			thisCookie.setMaxAge(0);
		if (n.equals("Shipping_name"))
			thisCookie.setMaxAge(0);
		if (n.equals("Shipping_shippingDate"))
			thisCookie.setMaxAge(0);
		if (n.equals("Shipping_country"))
			thisCookie.setMaxAge(0);
		if (n.equals("Shipping_zipCode"))
			thisCookie.setMaxAge(0);
		if (n.equals("Shipping_addressName"))
			thisCookie.setMaxAge(0);
		
		if(n.equals("Customer_Id"))
			thisCookie.setMaxAge(0);
		if(n.equals("Customer_name"))
			thisCookie.setMaxAge(0);
		if(n.equals("Customer_phoneNumber"))
			thisCookie.setMaxAge(0);
		if(n.equals("Customer_country"))
			thisCookie.setMaxAge(0);
		if(n.equals("Customer_zipCode"))
			thisCookie.setMaxAge(0);
		if(n.equals("Customer_addressName"))
			thisCookie.setMaxAge(0);
		
		response.addCookie(thisCookie);
	}
%>
