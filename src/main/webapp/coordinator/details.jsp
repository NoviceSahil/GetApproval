<%@page import="com.entity.coordinator"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.entity.courses"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.coordinatorDao"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<%@page import="com.dao.courseDao"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Coordinator Details</title>
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
		<div class=" col-md-8 ">
			<div class="card paint-card">
				<div class="card-body">
					<p class="fs-3 text-center">Coordinator Details</p>
					<c:if test="${not empty success}">
						<p class="text-center text-dark fs-5" role="alert">${success }</p>
						<c:remove var="success" scope="session" />
					</c:if>
					<c:if test="${not empty error}">
						<p class="text-center text-danger fs-5">${error}</p>
						<c:remove var="error" scope="session" />
					</c:if>

					<table class="table">
						<thead>
							<tr>
								<th scope="col">Full Name</th>
								<th scope="col">Department</th>
								<th scope="col">Department ID</th>

								<th scope="col">Phone No.</th>
								<th scope="col">Email</th>

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

								<td><%=c.getPhoneNo() %></td>
								<td><%=c.getEmail()%></td>

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