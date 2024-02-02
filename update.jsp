<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<%
	int regNo;
	String fullName,emailadd,mobile,gender,department,address;
	regNo=Integer.parseInt(request.getParameter("regNo"));
	fullName=request.getParameter("fullName");
	emailadd=request.getParameter("emailadd");
	mobile=request.getParameter("mobile");
	gender=request.getParameter("gender");
	department=request.getParameter("department");
	address=request.getParameter("address");
	
	Class.forName("com.mysql.jdbc.Driver");
	
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/projectdb","root","Sa12345@");
	String sql="UPDATE register SET Fullname=?,EmailAdd=?,MobileNo=?, Gender=?, Department=?, Address=? WHERE RegNo=?";
	PreparedStatement ps=con.prepareStatement(sql);
	ps.setInt(7,regNo);
	ps.setString(1,fullName);
	ps.setString(2,emailadd);
	ps.setString(3,mobile);
	ps.setString(4,gender);
	ps.setString(5,department);
	ps.setString(6,address);
	
	ps.executeUpdate();
	ps.close();
	con.close();
	
%>
<script>
	 alert('Student registered successfully!!')
	 <%
	response.sendRedirect("update.jsp");
	%>
</script>

