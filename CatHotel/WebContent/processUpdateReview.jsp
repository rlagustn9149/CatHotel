<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ include file="dbconn.jsp" %>
<%
	String filename = "";
	String realFolder = "C:\\Users\\rlagu\\eclipse-newworkspace\\CatHotel\\WebContent\\resources\\images"; //웹 어플리케이션상의 절대 경로
	String encType = "utf-8"; //인코딩 타입
	int maxSize = 5 * 1024 * 1024; //최대 업로드될 파일의 크기5Mb

	MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType,
			new DefaultFileRenamePolicy());
	String r_Id=multi.getParameter("r_Id");
	String reviewTitle = multi.getParameter("reviewTitle");
	String reviewclass = multi.getParameter("reviewclass");
	String reviewUseDay = multi.getParameter("reviewUseDay");
	String description = multi.getParameter("description");

	Enumeration files = multi.getFileNames();
	String fname = (String) files.nextElement();
	String fileName = multi.getFilesystemName(fname);	

	
		String sql = "select * from review where r_Id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, r_Id);
		rs = pstmt.executeQuery();

		if (rs.next()) {
			if (fileName != null) {
				sql = "UPDATE review SET r_class=?, r_Date=?, r_name=?, r_text=?,r_fileName=? WHERE r_Id=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, reviewclass);
				pstmt.setString(2, reviewUseDay);
				pstmt.setString(3, reviewTitle);
				pstmt.setString(4, description);
				pstmt.setString(5, fileName);
				pstmt.setString(6, r_Id);
				pstmt.executeUpdate();
			} else {
				sql = "UPDATE review SET r_class=?, r_Date=?, r_name=?, r_text=? WHERE r_Id=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, reviewclass);
				pstmt.setString(2, reviewUseDay);
				pstmt.setString(3, reviewTitle);
				pstmt.setString(4, description);
				pstmt.setString(5, r_Id);
				pstmt.executeUpdate();
			}
		}
	if (rs != null)
		rs.close();
 	if (pstmt != null)
 		pstmt.close();
 	if (conn != null)
		conn.close();

	response.sendRedirect("ReviewEdit.jsp?edit=update");
%>


