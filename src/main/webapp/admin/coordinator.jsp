<%@page import="com.entity.coordinator"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.entity.courses"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.coordinatorDao"%>

<%@page import="com.dao.courseDao"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Coordinator</title>
<%@include file="../component/css.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>

</head>
<body>
	<%@include file="navbar.jsp"%>
	<div class="container-fluid p-3">
		<div class="row">
			<div class="col-md-4">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">Add Coordinator</p>

						<c:if test="${not empty success}">
							<p class="text-center text-dark fs-5" role="alert">${success }</p>
							<c:remove var="success" scope="session" />
						</c:if>
						<c:if test="${not empty error}">
							<p class="text-center text-danger fs-5">${error}</p>
							<c:remove var="error" scope="session" />
						</c:if>

						<form action="../addcoordinator" method="post">
							<div class="mb-3">
								<label class="form-label">Full Name </label> <input type="text"
									required name="fullName" class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-label">Department</label> <select
									name="department" required class="form-contol">

									<option>--Select--</option>
									<% courseDao dao = new courseDao(DBConnect.getConn());
							List<courses> list = dao.getAllCourse();
								for (courses s : list) {
									%>
									<option>
										<%=s.getCourseName()%>
									</option>
									<%
									}
									%>
								</select>
							</div>
							<div class="mb-3">
								<label class="form-label">Department ID</label> <input
									type="text" required name="deptId" class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-label">Password</label> <input type="text"
									required name="password" class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-label">Phone No.</label> <input type="text"
									required name="phoneNo" class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-label">Email</label> <input type="email"
									required name="email" class="form-control">
							</div>

							<button type="submit" class="btn btn-dark ">Submit</button>
						</form>
					</div>
				</div>
			</div>
			<div class=" col-md-8 ">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">Coordinator Details</p>
						<c:if test="${not empty Success}">
							<p class="text-center text-success fs-5">${Success }</p>
							<c:remove var="Success" scope="session" />
						</c:if>
						<c:if test="${not empty Error}">
							<p class="text-center text-danger fs-5">${Error}</p>
							<c:remove var="Error" scope="session" />
						</c:if>
						<table class="table">
							<thead>
								<tr>
									<th scope="col">Full Name</th>
									<th scope="col">Department</th>
									<th scope="col">Department ID</th>
									<th scope="col">Password</th>
									<th scope="col">Phone No.</th>
									<th scope="col">Email</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>
								<%
								coordinatorDao dao2 = new coordinatorDao(DBConnect.getConn());
								List<coordinator> list2 = dao2.getAllcoordinator();
								for (coordinator c : list2) {
								%>
								<tr>
									<td><%=c.getFullName()%></td>
									<td><%=c.getDepartment()%></td>
									<td><%=c.getDeptId() %></td>
									<td><%=c.getPassword()%></td>
									<td><%=c.getPhoneNo() %></td>
									<td><%=c.getEmail()%></td>
									<td><a href="editcoordinator.jsp?id=<%=c.getId()%>"
										class="btn btn-sm btn-primary">Edit</a>
									<td><a href="../deletecoordinator?id=<%=c.getId()%>"
										class="btn btn-sm btn-danger">Delete</a></td>
								</tr>
								<%
								}
								%>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>