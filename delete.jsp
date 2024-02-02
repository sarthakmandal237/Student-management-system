<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<%
	int regNo;
	
	regNo=Integer.parseInt(request.getParameter("regNo"));
	
	
	Class.forName("com.mysql.jdbc.Driver");
	
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/projectdb","root","Sa12345@");
	String sql="DELETE FROM register WHERE RegNo=?;";
	PreparedStatement ps=con.prepareStatement(sql);
	ps.setInt(1,regNo);
	
	
	ps.executeUpdate();
	ps.close();
	con.close();
	
%>
<script>
	 alert('Student registered successfully!!')
	
</script>
 <%
	response.sendRedirect("index.jsp");
	%>

