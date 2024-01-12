<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="dbconn.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<%
String orderid = request.getParameter("orderid");

PreparedStatement pstmt1 = null;
ResultSet rs1 = null;

PreparedStatement pstmt2 = null;
ResultSet rs2 = null;

int quantity = 0;
int total = 0;
String b_id = "";

String sql1 = "select * from orders where orderid = ?";
pstmt1 = conn.prepareStatement(sql1);
pstmt1.setString(1, orderid);
rs1 = pstmt1.executeQuery();

if (rs1.next()) {
	quantity = rs1.getInt("order_count");
	b_id = rs1.getString("b_id");
}

String sql2 = "select * from bread where b_id = ?";
pstmt2 = conn.prepareStatement(sql2);
pstmt2.setString(1, b_id);
rs2 = pstmt2.executeQuery();

if (rs2.next()) {
	total = rs2.getInt("b_unistInStock");
}

total += quantity;
%>

<sql:setDataSource var="dataSource"
	url="jdbc:mysql://localhost:3306/BakeryDB"
	driver="com.mysql.jdbc.Driver" user="root" password="100409" />

<sql:update dataSource="${dataSource}" var="resultSet">
   DELETE FROM orders WHERE orderid = ?
   <sql:param value="<%=orderid%>" />
</sql:update>

<sql:update dataSource="${dataSource}" var="resultSet">
   UPDATE Bread SET b_unistInStock=? where b_id =?
   <sql:param value="<%=total%>" />
	<sql:param value="<%=b_id%>" />
</sql:update>

<%
response.sendRedirect("order.jsp");
%>
