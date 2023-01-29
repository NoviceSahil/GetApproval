<%@page import="com.entity.coordinator"%>
<%@page import="com.entity.NOC"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.coordinatorDao"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.NocDao"%>
<%@page import="com.entity.student"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View NOC</title>
<%@include file="component/css.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}

.backImg {
	background: linear-gradient(rgba(0, 0, 0, .4), rgba(0, 0, 0, .4)),
		url("img/img2.jpg");
	height: 20vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
}
</style>
</head>
<body>
	<%@include file="component/navbar.jsp"%>
	<c:if test="${empty studentObj }">
		<c:redirect url="student_login.jsp"></c:redirect>
	</c:if>
	<div class="container-fluid backImg p-5">
		<p class=" text-center fs-2 text-white"></p>
	</div>
	<div class="container p-3">
		<div class="row">
			<div class="col-md-12">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-4 fw-bold text-center text-success">NOC List</p>
					</div>
					<table class="table">
						<thead>
							<tr>
								<th scope="col">Full Name</th>
								<th scope="col">Roll No.</th>
								<th scope="col">Branch</th>
								<th scope="col">Coordinator</th>
								<th scope="col">Company</th>
								<th scope="col">Duration</th>
								<th scope="col">Email</th>
								<th scope="col">Phone</th>
								<th scope="col">Status</th>
							</tr>
						</thead>
						<tbody>
							<%
							student student = (student) session.getAttribute("studentObj");
							NocDao dao = new NocDao(DBConnect.getConn());
							coordinatorDao dao2 = new coordinatorDao(DBConnect.getConn());
							List<NOC> list = dao.getAllNocByLoginStudent(student.getId());

							for (NOC noc : list) {
								coordinator d = dao2.getCoordinatorById(noc.getCoordinator_id());
							%>
							<tr>
								<th><%=noc.getFullName()%></th>
								<td><%=noc.getRoll_no()%></td>
								<td><%=noc.getBranch()%></td>
								<td><%=d.getFullName()%></td>
								<td><%=noc.getCompany()%></td>
								<td><%=noc.getDuration()%></td>
								<td><%=noc.getEmail()%></td>
								<td><%=noc.getPhone()%></td>

								<td>
									<%
									if ("Pending".equals(noc.getStatus())) {
									%> <a href="#" class="btn btn-sm btn-warning">Pending</a> <%
 } else {
 %> <%=noc.getStatus()%> <%
 }
 %>
								</td>
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
</body>
</html>