<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*"%>

<%@ include file="dbconn.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");

	String filename="";
	String realFolder= "C:\\Users\\rlagu\\eclipse-newworkspace\\CatHotel\\WebContent\\resources\\images";
	int maxSize= 5 * 1024 * 1024;
	String encType = "utf-8";
	
	MultipartRequest multi= new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
	
	String reviewTitle= multi.getParameter("reviewTitle");
	String reviewclass= multi.getParameter("reviewclass");
	String reviewUseDay= multi.getParameter("reviewUseDay");
	String text= multi.getParameter("text");
	
	Enumeration files= multi.getFileNames();
	String fname = (String) files.nextElement();
	String fileName = multi.getFilesystemName(fname);
	
	String sql ="select * from review";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	rs.last();
	int getlastRow = rs.getRow()+1;
	String reviewr_Id=Integer.toString(getlastRow);
	
	sql = "insert into review values(?,?,?,?,?,?)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1,reviewr_Id);
	pstmt.setString(2,reviewclass);
	pstmt.setString(3,reviewUseDay);
	pstmt.setString(4,reviewTitle);
	pstmt.setString(5,text);
	if(fileName==null) pstmt.setString(6,"");
	else pstmt.setString(6,fileName);
	pstmt.executeUpdate();
	
	if (pstmt != null)
 		pstmt.close();
 	if (conn != null)
		conn.close();
	response.sendRedirect("review.jsp");

%>