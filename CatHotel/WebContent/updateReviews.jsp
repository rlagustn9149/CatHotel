<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<title>후기 수정</title>
</head>
<body>
	<%@ include file="menu.jsp" %>
	
	<div class="jumbotron">
		<div class="container">
			<h1>후기 수정</h1>
		</div>
	</div>
	<%@ include file="dbconn.jsp"%>
	<%
		String reviewId = request.getParameter("Id");

		String sql = "select * from review where r_Id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, reviewId);
		rs = pstmt.executeQuery();
		if (rs.next()) {
	%>
	
	<div class="container">
	<form name="newReview" action="./processUpdateReview.jsp" class="form-horizontal" method="post" enctype="multipart/form-data">
		<input type="hidden" id="r_Id" name="r_Id" value="<%=reviewId %>" />
		<div class = "form-group row">
			<label class="col-sm-2">제목</label>
			<div class="col-sm-3">
				<input type="text" id="reviewTitle" name="reviewTitle" class="form-control" value='<%=rs.getString("r_name")%>'>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">이용한 룸</label>
			<div class="col-sm-5">
				<input type="radio" name="reviewclass" value="Standard" > Standard
				<input type="radio" name="reviewclass" value="Deluxe" > Deluxe
				<input type="radio" name="reviewclass" value="Premier" > Premier
			</div>
		</div>
		<div class = "form-group row">
			<label class="col-sm-2">이용 날짜</label>
			<div class="col-sm-3">
				<input type="text" id="reviewUseDay" name="reviewUseDay" class="form-control" value="<%=rs.getString("r_Date")%>">
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">사진 후기</label>
			<div class="col-sm-5">
				<input type="file" name="reviewImage" class="form-control">
			</div>
		</div>	
		<div class="form-group row">
			<label class="col-sm-2">후기</label>
			<div class="col-sm-5">
				<textarea name="description" cols="50" rows="2" id="description"  class="form-control"><%=rs.getString("r_text")%></textarea>
			</div>
		</div>
		<div class="form-group row">
			<div class="col-sm-offset-2 col-sm-10">
				<input type="submit" class="btn btn-secondary" value="등록">
				<a href ="./review.jsp"class="btn btn-secondary" role="button">취소&raquo;</a>
			</div>
		</div>
	</form>
	<hr>
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
	<%@ include file="footer.jsp" %>
</body>
</html>