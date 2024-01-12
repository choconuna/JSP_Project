<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="dbconn.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%
String sessionId = (String) session.getAttribute("sessionId");
String quantity = request.getParameter("quantity");
String b_id = request.getParameter("id");
String filename = "";
int price = 0;

int qtt = Integer.valueOf(quantity);
int total = 0;
int stock = 0;

PreparedStatement pstmt = null;
ResultSet rs = null;

String sql = "select * from bread where b_id = ?";
pstmt = conn.prepareStatement(sql);
pstmt.setString(1, b_id);
rs = pstmt.executeQuery();
if (rs.next()) {
	filename = rs.getString("b_filename"); // 주문한 상품의 이미지를 받아옴
	price = rs.getInt("b_unitPrice");
	stock = rs.getInt("b_unistInStock");
}

total = price * qtt;
stock -= qtt;

Date currentDatetime = new Date(System.currentTimeMillis());
java.sql.Date sqlDate = new java.sql.Date(currentDatetime.getTime());
java.sql.Timestamp timestamp = new java.sql.Timestamp(currentDatetime.getTime());
%>

<sql:setDataSource var="dataSource"
	url="jdbc:mysql://localhost:3306/BakeryDB"
	driver="com.mysql.jdbc.Driver" user="root" password="100409" />

<sql:update dataSource="${dataSource}" var="resultSet">
   INSERT INTO Orders(memid, b_id, order_count, total_price, b_filename, order_day) VALUES (?, ?, ?, ?, ?, ?)
   <sql:param value="<%=sessionId%>" />
	<sql:param value="<%=b_id%>" />
	<sql:param value="<%=qtt%>" />
	<sql:param value="<%=total%>" />
	<sql:param value="<%=filename%>" />
	<sql:param value="<%=timestamp%>" />
</sql:update>

<sql:update dataSource="${dataSource}" var="resultSet">
   UPDATE Bread SET b_unistInStock=? where b_id =?
   <sql:param value="<%=stock%>" />
	<sql:param value="<%=b_id%>" />
</sql:update>

<%
if (rs != null)
	rs.close();
if (pstmt != null)
	pstmt.close();
if (conn != null)
	conn.close();

response.sendRedirect("product.jsp?id=" + b_id);
%>