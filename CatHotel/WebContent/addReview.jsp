<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<title>리뷰 작성</title>
</head>
<body>
	<%@ include file="menu.jsp" %>
	
	<div class="jumbotron">
		<div class="container">
			<h1>후기 쓰기</h1>
		</div>
	</div>
	
	<div class="container">
	<form name="newReview" action="./processAddReview.jsp" class="form-horizontal" method="post" enctype="multipart/form-data">
		<div class = "form-group row">
			<label class="col-sm-2">제목</label>
			<div class="col-sm-3">
				<input type="text" id="reviewTitle" name="reviewTitle" class="form-control">
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
				<input type="text" id="reviewUseDay" name="reviewUseDay" class="form-control">
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
				<textarea name="text" cols="50" rows="2" class=form-control></textarea>
			</div>
		</div>
		<div class="form-group row">
			<div class="col-sm-offset-2 col-sm-10">
				<input type="submit" class="btn btn-secondary" value="글쓰기">
				<a href ="./review.jsp"class="btn btn-secondary" role="button">취소&raquo;</a>
			</div>
		</div>
	</form>
	<hr>
	</div>
	
	<%@ include file="footer.jsp" %>
</body>
</html>