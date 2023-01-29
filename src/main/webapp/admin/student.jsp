
<%@page import="com.entity.NOC"%>
<%@page import="com.entity.student"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.coordinatorDao"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.studentDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin | Student Details</title>
<%@include file="../component/css.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<div class="col-md-12">
		<div class="card paint-card">
			<div class="card-body">
				<p class="fs-3 text-center">Student Details</p>
				<table class="table">
					<thead>
						<tr>
							<th scope="col">Full Name</th>
							<th scope="col">Roll No.</th>
							<th scope="col">Email</th>
							<th scope="col">Branch</th>

						</tr>
					</thead>
					<tbody>
						<%
								studentDao dao2 = new studentDao(DBConnect.getConn());
								List<student> list2 = dao2.getAllstudents();
								for (student s : list2) {
								%>
						<tr>
							<td><%=s.getFullName()%></td>
							<td><%=s.getRollno()%></td>
							<td><%=s.getBranch()%></td>
							<td><%=s.getEmail() %></td>

						</tr>
						<%
								}
								%>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>