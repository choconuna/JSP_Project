<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ include file="dbconn.jsp"%>

<%
request.setCharacterEncoding("utf-8");

String realPath = "C:\\PTJImage";
int maxSize = 5 * 1024 * 1024;
String enctype = "utf-8";

MultipartRequest multi = new MultipartRequest(request, realPath, maxSize, enctype, new DefaultFileRenamePolicy());

String breadId = multi.getParameter("breadId");
String bname = multi.getParameter("bname");
String breadPrice = multi.getParameter("breadPrice");
String description = multi.getParameter("description");
String category = multi.getParameter("category");
String unitsInStock = multi.getParameter("unitsInStock");
String content = multi.getParameter("content");
String calorie = multi.getParameter("calorie");
String allergy = multi.getParameter("allergy");

Integer price, ctt, clr;
long stock;

if (breadPrice.isEmpty())
	price = 0;
else
	price = Integer.valueOf(breadPrice);

if (unitsInStock.isEmpty())
	stock = 0;
else
	stock = Long.valueOf(unitsInStock);

if (content.isEmpty())
	ctt = 0;
else
	ctt = Integer.valueOf(content);

if (calorie.isEmpty())
	clr = 0;
else
	clr = Integer.valueOf(calorie);

Enumeration fnames = multi.getFileNames();
String filenames = (String) fnames.nextElement();
String filename = multi.getFilesystemName(filenames);

PreparedStatement pstmt = null;
ResultSet rs = null;

String sql = "select * from bread where b_id=?";
pstmt = conn.prepareStatement(sql);
pstmt.setString(1, breadId);
rs = pstmt.executeQuery();

if (rs.next()) {
	if (filename != null) { // 이미지 파일도 변경할 경우
		sql = "update bread set b_name=?, b_unitPrice=?, b_description=?, b_category=?, b_unistInStock=?, b_content=?, b_calorie=?, b_allergy=?, b_filename=? where b_id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, bname);
		pstmt.setInt(2, price);
		pstmt.setString(3, description);
		pstmt.setString(4, category);
		pstmt.setLong(5, stock);
		pstmt.setInt(6, ctt);
		pstmt.setInt(7, clr);
		pstmt.setString(8, allergy);
		pstmt.setString(9, filename);
		pstmt.setString(10, breadId);
		pstmt.executeUpdate();
	} else {
		sql = "update bread set b_name=?, b_unitPrice=?, b_description=?, b_category=?, b_unistInStock=?, b_content=?, b_calorie=?, b_allergy=? where b_id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, bname);
		pstmt.setInt(2, price);
		pstmt.setString(3, description);
		pstmt.setString(4, category);
		pstmt.setLong(5, stock);
		pstmt.setInt(6, ctt);
		pstmt.setInt(7, clr);
		pstmt.setString(8, allergy);
		pstmt.setString(9, breadId);
		pstmt.executeUpdate();
	}
}

if (rs != null)
	rs.close();
if (pstmt != null)
	pstmt.close();
if (conn != null)
	conn.close();

response.sendRedirect("editProduct.jsp");
%>