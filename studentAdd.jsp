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
	String sql="INSERT INTO register VALUES(?,?,?,?,?,?,?);";
	PreparedStatement ps=con.prepareStatement(sql);
	ps.setInt(1,regNo);
	ps.setString(2,fullName);
	ps.setString(3,emailadd);
	ps.setString(4,mobile);
	ps.setString(5,gender);
	ps.setString(6,department);
	ps.setString(7,address);
	
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
