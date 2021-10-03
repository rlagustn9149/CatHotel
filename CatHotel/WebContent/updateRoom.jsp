<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>상품 수정</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 수정</h1>
		</div>
	</div>
	<%@ include file="dbconn.jsp"%>
	<%
		String roomId = request.getParameter("id");

		String sql = "select * from room where r_number = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, roomId);
		rs = pstmt.executeQuery();
		if (rs.next()) {
	%>
	<div class="container">
		<div class="row">
			<div class="col-md-5">
				<img src="./resources/images/<%=rs.getString("r_fileName")%>" alt="image"
					style="width: 100%" />
			</div>
			<div class="col-md-7">
				<form name="newRoom" action="./processupdateRoom.jsp"
					class="form-horizontal" method="post" enctype="multipart/form-data">
					<div class="form-group row">
						<label class="col-sm-2">룸 번호</label>
						<div class="col-sm-3">
							<input type="text" id="roomNumber" name="roomNumber"
								class="form-control" value='<%=rs.getString("r_number")%>'>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">룸 클래스</label>
						<div class="col-sm-3">
							<input type="text" id="roomClass" name="roomClass" class="form-control"
								value="<%=rs.getString("r_class")%>">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">1일 이용가격</label>
						<div class="col-sm-3">
							<input type="text" id="onedayprice" name="onedayprice"
								class="form-control" value="<%=rs.getInt("r_onedayprice")%>">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">최대 이용가능 고양이수</label>
						<div class="col-sm-3">
							<input type="text" id="capacity" name="capacity" class="form-control"
								value="<%=rs.getString("r_capacity")%>">
						</div>
					</div>  
					<div class="form-group row">
						<label class="col-sm-2">상세 설명</label>
						<div class="col-sm-5">
							<textarea id="description" name="description" cols="80" rows="4"
								class="form-control"><%=rs.getString("r_description")%></textarea>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">기본 제공</label>
						<div class="col-sm-5">
							<textarea id="supply" name="supply" cols="80" rows="4"
								class="form-control"><%=rs.getString("r_supply")%></textarea>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">이미지</label>
						<div class="col-sm-5">
							<input type="file" name="roomImage" class="form-control">
						</div>
					</div>
					<div class="form-group row">
						<div class="col-sm-offset-2 col-sm-10 ">
							<input type="submit" class="btn btn-primary" value="등록">
						</div>
					</div>
				</form>

			</div>
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
</body>
</html>
