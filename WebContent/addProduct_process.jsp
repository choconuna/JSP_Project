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

String sql = "insert into bread values(?,?,?,?,?,?,?,?,?,?)";
pstmt = conn.prepareStatement(sql);
pstmt.setString(1, breadId);
pstmt.setString(2, bname);
pstmt.setInt(3, price);
pstmt.setString(4, description);
pstmt.setString(5, category);
pstmt.setLong(6, stock);
pstmt.setInt(7, ctt);
pstmt.setInt(8, clr);
pstmt.setString(9, allergy);
pstmt.setString(10, filename);
pstmt.executeUpdate();

if (pstmt != null)
	pstmt.close();
if (conn != null)
	conn.close();

response.sendRedirect("products.jsp");
%>