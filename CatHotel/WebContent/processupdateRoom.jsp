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
	String roomNumber = multi.getParameter("roomNumber");
	String roomClass = multi.getParameter("roomClass");
	String onedayprice = multi.getParameter("onedayprice");
	String capacity = multi.getParameter("capacity");
	String description = multi.getParameter("description");
	String supply = multi.getParameter("supply");

	Integer roomprice;

	if (onedayprice.isEmpty())
		roomprice = 0;
	else
		roomprice = Integer.valueOf(onedayprice);

	Integer roomcapacity;

	if (capacity.isEmpty())
		roomcapacity = 0;
	else
		roomcapacity = Integer.valueOf(capacity);

	Enumeration files = multi.getFileNames();
	String fname = (String) files.nextElement();
	String fileName = multi.getFilesystemName(fname);	

	
		String sql = "select * from room where r_number = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, roomNumber);
		rs = pstmt.executeQuery();

		if (rs.next()) {
			if (fileName != null) {
				sql = "UPDATE room SET r_class=?, r_description=?, r_supply=?, r_onedayprice=?, r_capacity=?, r_fileName=? WHERE r_number=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, roomClass);
				pstmt.setString(2, description);
				pstmt.setString(3, supply);
				pstmt.setInt(4, roomprice);
				pstmt.setInt(5, roomcapacity);
				pstmt.setString(6, fileName);
				pstmt.setString(7, roomNumber);
				pstmt.executeUpdate();
			} else {
				sql = "UPDATE room SET r_class=?, r_description=?, r_supply=?, r_onedayprice=?, r_capacity=? WHERE r_number=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, roomClass);
				pstmt.setString(2, description);
				pstmt.setString(3, supply);
				pstmt.setInt(4, roomprice);
				pstmt.setInt(5, roomcapacity);
				pstmt.setString(6, roomNumber);
				pstmt.executeUpdate();
			}
		}
	if (rs != null)
		rs.close();
 	if (pstmt != null)
 		pstmt.close();
 	if (conn != null)
		conn.close();

	response.sendRedirect("editRoom.jsp?edit=update");
%>


