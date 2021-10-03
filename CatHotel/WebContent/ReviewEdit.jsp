<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%> 
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<title>리뷰 수정</title>
<script type="text/javascript">
	function deleteConfirm(id) {
		if (confirm("해당 리뷰를 삭제합니다!!") == true)
			location.href = "./deleteReview.jsp?id=" + id;
		else
			return;
	}
</script>
</head>
<body>
	<%@ include file="menu.jsp" %>
	<% 
		String greeting ="★마루마루호텔 후기★";
	%>
		
	<div class="container">
		<div class="row align-items-center">
			<div class="col-9">
				<p><h1><p class="text-info"><%=greeting %></p></h1>
			</div>
			<div class="col-3" style="text-align : right">
				<a href ="./addReview.jsp"class="btn btn-secondary" role="button-right">글쓰기&raquo;</a>
				<a href ="./ReviewEdit.jsp"class="btn btn-secondary" role="button-right">글수정&raquo;</a>
			</div>
		</div>
		<hr>
	</div>
		
	<div class="container">
		<div class="row">
			<div class="col-1" style="text-align : center">번호</div>
			<div class="col-2" style="text-align : center">객실</div>
			<div class="col-3" style="text-align : center">제목</div>
			<div class="col-3" style="text-align : center">이용 날짜</div>
			<div class="col-3" style="text-align : center"></div>
		</div>
		<hr>
		<%@ include file="dbconn.jsp"%>
		<%
			String sql = "select * from review";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {			
		%>
		<div class="row">
			<div class="col-1" style="text-align : center"><%=rs.getString("r_Id")%></div>
			<div class="col-2" style="text-align : center"><%=rs.getString("r_class")%></div>
			<div class="col-3" style="text-align : center"><%=rs.getString("r_name")%></div>
			<div class="col-3" style="text-align : center"><%=rs.getString("r_Date") %></div>
			<div class="col-3" style="text-align : center">
				<a href ="./updateReviews.jsp?Id=<%=rs.getString("r_Id")%>"class="btn btn-secondary" role="button">수정&raquo;</a>
				<a href ="#" onclick="deleteConfirm('<%=rs.getString("r_Id") %>')" class="btn btn-danger" role="button">삭제&raquo;</a>	
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
	<%@ include file="footer.jsp" %>
</body>
</html>