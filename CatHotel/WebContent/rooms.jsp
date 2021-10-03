<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%> 
<jsp:useBean id="roomDAO" class="dao.RoomRepository" scope="session"/>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<title>고양이 호텔</title>
</head>
<body>
	<%@ include file="menu.jsp" %>
	<% 
		String greeting ="고양이 호텔";
		String description = "더 이상 넓고 쾌적할 순 없다!  다녀가신 보호자분들의 이구동성입니다.";
	%>
	
	<div class="container">
		<p><h1><p class="text-info"><%=greeting %></p></h1>
		<hr>
		<p><h4><p class="text-info"><%=description %></p></h4>
		<hr>
	</div>
		<div class="container">
		<div class="col" align="Left">
			<%@ include file="dbconn.jsp"%>
				<%
					String sql = "select * from room";
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					while (rs.next()) {
				%>	
			<div class="row">
				<div class="col-4">
					<img src="./resources/images/<%=rs.getString("r_fileName")%>" style="width:100%">
				</div>
				<div class="col-7">
				<h3><%=rs.getString("r_class") %></h3> <br>
					<div class="row">
						<div class="col-md-7">
							<p><%=rs.getString("r_description") %>
							<p>수용 가능 고양이 수 : <%=rs.getString("r_capacity") %>
							<p>1박 : <%=rs.getString("r_onedayprice") %>	원
						</div>
						<div class ="col-2">
							<a href ="./room.jsp?roomNumber=<%=rs.getString("r_number")%>"
							class="btn btn-secondary" role="button">&raquo;</a>	
						</div>
					</div>
				</div>		
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
		</div>
		
		
	<%@ include file="footer.jsp" %>
</body>
</html>