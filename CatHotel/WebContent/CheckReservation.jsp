<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.net.URLDecoder"%>
<%@ page import="java.sql.*" %>
<%
	request.setCharacterEncoding("UTF-8");

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
			if (n.equals("Reservation_phoneNumber"))
				reservation_phoneNumber = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if (n.equals("Reservation_checkIn"))
				reservation_checkIn = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if (n.equals("Reservation_checkOut"))
				reservation_checkOut = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if (n.equals("Reservation_description"))
				reservation_description = URLDecoder.decode((thisCookie.getValue()), "utf-8");
		}
	}
%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>예약 정보</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">예약 정보</h1>
		</div>
	</div>

	<div class="container col-8 alert alert-info">
		<div class="text-center ">
			<h1>영수증</h1>
		</div>
		<div class="row justify-content-between">
			<div class="col-6" align="left">
				<strong>마루마루 호텔</strong> <br> 성명 : <% out.println(reservation_name); %>	<br> 
				전화 번호 : <%out.println(reservation_phoneNumber);%><br> 
				이용 날짜 : <%	out.println(reservation_checkIn);%> ~ <%out.println(reservation_checkOut);%> <br>
			</div>
		</div>
		<div>
			<table class="table table-hover">			
			<tr>
				<th class="text-center">객실</th>
				<th class="text-center">1일 이용료</th>
				<th class="text-center">이용 일수</th>
				<th class="text-center">총액</th>
			</tr>
			<%! 
				long stayDate=0;			
			%>
			
			<%@ include file="dbconn.jsp"%>
			<%
				String roomNumber = (String)session.getAttribute("roomNumber");
			
				String sql = "select * from room where r_number=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,roomNumber);
				rs = pstmt.executeQuery();
				
				try{
					SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
					Date checkInDate=format.parse(reservation_checkIn);
					Date checkOutDate=format.parse(reservation_checkOut);
					
					stayDate=(checkOutDate.getTime()-checkInDate.getTime())/(24*60*60*1000);
					
				}catch(Exception e){
					e.printStackTrace();
				}
				
				while(rs.next()){
			%>
			<tr>
				<td class="text-center"><%=rs.getString("r_class")%></td>
				<td class="text-center"><%=rs.getInt("r_onedayprice")%></td>
				<td class="text-center"><%=stayDate%></td>
				<td class="text-center"><%=rs.getInt("r_onedayprice")*stayDate %></td>
			</tr>					
			</table>
			<p><strong>요청사항 : </strong><%=reservation_description %>
			<p>	<a href="./reservationRoom.jsp?reservationId=<%=reservation_Id %>"class="btn btn-secondary" role="button"> 이전 </a>
				<a href="./thankCustomer.jsp"  class="btn btn-success" role="button"> 주문 완료 </a>
				<a href="./reservationCancelled.jsp" class="btn btn-secondary"	role="button"> 취소 </a>			
		</div>
			<%
				}	
			if (rs != null)
				rs.close();
 			if (pstmt != null)
 				pstmt.close();
 			if (conn != null)
				conn.close();
		%>	
	 	
	</div>	
</body>
</html>
