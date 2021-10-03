<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<html>
<head>
<title>상세 리뷰</title>
</head>
<body>
	<%@ include file="menu.jsp" %>
	<%@ include file="dbconn.jsp"%>
	<%
		String r_Id=(String)request.getParameter("r_Id");		
		
		String sql = "select * from review where r_Id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,r_Id);
		rs = pstmt.executeQuery();
		
		
		while(rs.next()){
			String filecheck=rs.getString("r_fileName");
	%>
	
	<div class="container">
		<p><h1><p class="text-info"><%=rs.getString("r_name")%></p></h1>
		<hr>
		<%
			if(!filecheck.equals(""))
			{
		%>
		<div class>
			<img src="./resources/images/<%=rs.getString("r_fileName")%>">
		</div>
		<%} %>
		<div class>
			<p><%=rs.getString("r_text") %>
		</div>
		<div style="text-align : right">
			<a href ="./review.jsp"class="btn btn-secondary" role="button-right">이전&raquo;</a>
		</div>
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
	
	
	<hr>
	<%@ include file="footer.jsp" %>	
	
</body>
</html>