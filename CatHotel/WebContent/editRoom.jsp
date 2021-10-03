<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>호텔 편집</title>
</script>
</head>
<%
	String edit = request.getParameter("edit");
%>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 편집</h1>
		</div>
	</div>

	<div class="container">
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
							<p>
								<%
									if (edit.equals("update")) {
								%>
								<a href="./updateRoom.jsp?id=<%=rs.getString("r_number")%>"	class="btn btn-success" role="button"> 수정 &raquo;></a>	
								<%
								}
								%>		
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
	<jsp:include page="footer.jsp" />
</body>
</html>