<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page errorPage="exceptionNoRoom.jsp" %>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<html>
<head>
<title>호텔 정보</title>
</head>
<body>
	<%@ include file="menu.jsp" %>
	
	<%
		String roomNumber=request.getParameter("roomNumber");		
		String checkSession= (String)session.getAttribute("roomNumber");
		
		if(checkSession == null)
		{
			session.setAttribute("roomNumber",roomNumber);
		}else{
			session.removeAttribute("roomNumber");
			session.setAttribute("roomNumber",roomNumber);
		}
	%>
	<%@ include file="dbconn.jsp"%>
			<%
				String sql = "select * from room where r_number=?";
	
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,roomNumber);
				rs = pstmt.executeQuery();
				while (rs.next()) {
			%>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3"><%=rs.getString("r_class")%></h1>
		</div>
	</div>
	
	<div class="container">
		<div class="row">
			<div class="col-md-5"> 
				<img src="./resources/images/<%=rs.getString("r_fileName")%>">
			</div> 
			<div class="col-md-7"> 
				<p> <b><%=rs.getString("r_description")%></b>
				<p>	<b> 수용 가능 고양이 수 : </b> <%=rs.getString("r_capacity")%>
				<p> <b> 1일 이용료 : </b> <%=rs.getString("r_onedayprice")%>원
				<p> <b> ▶ 기본제공</b>
				<p> <%=rs.getString("r_supply")%>
				<p> <a href =" ./rooms.jsp" class="btn btn-secondary"> 호텔 룸 목록 &raquo;</a>	
				<a href="reservationRoom.jsp?" class="btn btn-info" onclick="reservation()">호텔 예약 &raquo;</a>		
			</div> 
		</div>
		<hr>
		<div> 
			<p><img src="./resources/images/<%=rs.getString("r_fileName1")%>">
		</div>
		<div> 
			<p><img src="./resources/images/<%=rs.getString("r_fileName2")%>">
		</div> 
		<div> 
			<p><img src="./resources/images/<%=rs.getString("r_fileName3")%>">
		</div>  
		<hr>
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
	<%@ include file="footer.jsp" %>
	
</body>
</html>