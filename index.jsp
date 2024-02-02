<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP WEB APP</title>
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
<%@ page import="java.sql.*"%>
	<div class="header">
		<h1>Student <span> Management </span> App</h1>
		<button onclick="toggle()">Add Student <i class="fa-solid fa-plus"></i></button>
	</div>
	<div class="details">
		<table>
			<thead>
				<tr>
					<th>RegNo</th>
					<th>Full Name</th>
					<th>Email Address</th>
					<th>Mobile No</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<%
					Class.forName("com.mysql.jdbc.Driver");
					Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/projectdb","root","Sa12345@");

					
					PreparedStatement ps=con.prepareStatement(" SELECT * FROM register;");
					ResultSet rs=ps.executeQuery();
					int regNo=0;
					String fullName="";
					String emailadd="";
					String mobile="";
					
					while(rs.next()){
						regNo=rs.getInt(1);
						fullName=rs.getString(2);
						emailadd=rs.getString(3);
						mobile=rs.getString(4);
						
					%>
					<tr>
						<td><%=regNo %></td>
						<td><%=fullName %></td>
						<td><%=emailadd %></td>
						<td><%=mobile %></td>
						<td>
							<a href="StudentEdit.jsp?regNo=<%=regNo %>"><i class="fa-solid fa-pen-to-square"></i></a>
							<a href="delete.jsp?regNo=<%=regNo %>"><i class="fa-solid fa-trash"></i></a>
						</td>
					</tr>
					<%
				}
				%>
			</tbody>
		</table>
	</div>
	
	
	<div class="popup" id="popup">
		<div class="title">
		<h2>Add Student</h2>
	</div>
	<form method="post" action="update.jsp">
		<div class="field">
			<label>Registration No</label>
			<input type="number" name="regNo" required>
		</div>
		<div class="field">
			<label>Full Name</label>
			<input type="text" name="fullName" required>
		</div>
		<div class="field">
			<label>Email Address</label>
			<input type="email" name="emailadd"required>
		</div>
		<div class="field">
			<label>Mobile No</label>
			<input type="number" maxlength="10" name="mobile"required>
		</div>
		<div class="field">
			<label>Gender</label>
			<select name="gender">
				<option value="" selected>Gender</option>
				<option value="Male" >Male</option>
				<option value="Female" >Female</option>
			</select>
		</div>
		<div class="field">
			<label>Department</label>
			<select name="department">
				<option value="" selected>Department</option>
				<option value="IT" >IT</option>
				<option value="ECE" >ECE</option>
			</select>
		</div>

		<div class="textarea-field">
			<label>Address</label>
			<textarea name="address"></textarea>
		</div>

		<div class="action-field">
			<input type="submit" value="Add Student">
		</div>
	</form>
</div>
<script>
	window.onload=toggle();
function toggle(){
	var popup=document.querySelector("#popup");
	if (popup.style.display=='none')
		{
		popup.style.display='block';

		}
	else
		{
		popup.style.display='none';

		}
}
</script>
</body>
</html>