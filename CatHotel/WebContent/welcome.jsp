<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ page import = "java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<title>Welcome</title>
</head>
<body>
    <%@ include file="menu.jsp" %>
    
	<%! String greeting = "마루마루 호텔에 오신걸 환영합니다.";
		String tagline = "Welcome to Pet Hotel";%>
	
	<div class="jumbotron">
		<div class="container">
			<h1><%=greeting %></h1>
		</div>
	</div>

	<div class="container">
		<div class="row align-items-center">
			<div class="col-md-7"> 
				<img src= "./resources/images/welcome1.jpg">
			</div> 
			<div class="col-md-3"> 	
				<h3><p class="text-info">냥이들의 편안함과</p></h3>
			</div> 
		</div>
		<div class="row align-items-center">
			<div class="col-md-3"> 
				<h3><p class="text-info">안전함을</p></h3>
				<div class="row">
					<div class="col-3"></div>
					<div class="col">
						<h3><p class="text-info">추구합니다.</p></h3>
					</div>
				</div>
			</div> 
			<div class="col-md-8"> 
				<img src= "./resources/images/welcome2.jpg">
			</div> 
		</div>
		<div class="row align-items-center">
			<div class="col-md-9"> 
				<img src= "./resources/images/welcome3.jpg">	
			</div> 
			<div class="col-md-3"> 
			</div> 
		</div>
		<hr>
	</div>	
	<%@ include file="footer.jsp" %>
</body>
</html>