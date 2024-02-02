<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP WEB APP</title>
<link rel="stylesheet" href="Style1.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
<%@ page import="java.sql.*"%>
<%
int regNo;
regNo=Integer.parseInt(request.getParameter("regNo"));
Class.forName("com.mysql.jdbc.Driver");

Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/projectdb","root","Sa12345@");

PreparedStatement ps=con.prepareStatement("SELECT * FROM register where regNo=?;");
ps.setInt(1,regNo);
ResultSet rs=ps.executeQuery();
String fullName="";
String emailadd ="";
String mobile="";
String gender="";
String department="";
String address="";
if(rs.next()){
	fullName=rs.getString(2);
	emailadd=rs.getString(3);
	mobile=rs.getString(4);
	gender=rs.getString(5);
	department=rs.getString(6);
	address=rs.getString(7);
}


ps.close();
con.close();
%>
	<div class="header">
		<h1>Student <span> Management </span> App</h1>
		
	</div>
	
	<div class="popup" id="popup">
		<div class="title">
		<h2>Update Student</h2>
	</div>
	<form method="post" action="studentAdd.jsp">
		<div class="field">
			<label>Registration No</label>
			<input type="number" value="<%=regNo %>"name="regNo" required readonly>
		</div>
		<div class="field">
			<label>Full Name</label>
			<input type="text" value="<%=fullName%>"name="fullName" required>
		</div>
		<div class="field">
			<label>Email Address</label>
			<input type="email" value="<%=emailadd %>"name="emailadd" required>
		</div>
		<div class="field">
			<label>Mobile No</label>
			<input type="number" value="<%=mobile %>" maxlength="10" name="mobile"required>
		</div>
		<div class="field">
			<label>Gender</label>
			<input type="text" name="gender" value="<%=gender %>">
		</div>
		<div class="field">
			<label>Department</label>
			<input type="text" name="department" value="<%=department %>">
		</div>

		<div class="textarea-field">
			<label>Address</label>
			<textarea name="address"> <%=address %></textarea>
		</div>

		<div class="action-field">
			<input type="submit" value="Update Student">
		</div>
	</form>
</div>

</body>
</html>