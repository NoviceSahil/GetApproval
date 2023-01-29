
<%@page import="com.entity.NOC"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.NocDao"%>
<%@page import="com.entity.coordinator"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View NOC</title>
<%@include file="../component/css.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>

	<%@include file="navbar.jsp"%>
	<div class="container p-3">
		<div class="row">
			<div class="col-md-12">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">Student Details</p>
						<c:if test="${not empty success}">
							<p class="text-center text-dark fs-4">${success }</p>
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
									<th scope="col">Roll_no.</th>
									<th scope="col">Branch</th>
									<th scope="col">Company</th>
									<th scope="col">Duration</th>
									<th scope="col">Email</th>
									<th scope="col">Phone</th>
									<th scope="col">Status</th>
									<th scope="col">Action</th>

								</tr>
							</thead>
							<tbody>
								<%
								
								NocDao dao = new NocDao(DBConnect.getConn());
								List<NOC> list = dao.getAllNoc();
								for (NOC noc : list) {
								%>
								<tr>
									<th><%=noc.getFullName()%></th>
									<td><%=noc.getRoll_no()%></td>
									<td><%=noc.getBranch()%></td>
									<td><%=noc.getCompany()%></td>
									<td><%=noc.getDuration()%></td>
									<td><%=noc.getEmail()%></td>
									<td><%=noc.getPhone()%></td>
									<td><%=noc.getStatus()%></td>
									<td><a href="../download?fn=<%=noc.getLetter()%>"
										class="btn btn-sm btn-primary">Download</a></td>


									<td>
										<!--  disabled Comment Button  --> <%
 if ("Pending".equals(noc.getStatus())) {
 %> <a href="commentA.jsp?id=<%=noc.getId()%>"
										class="btn btn-success btn-sm">Comment</a> <%
 } else {
 %> <a href="#" class="btn btn-success btn-sm disabled">Comment</a> <%
 }
 %> <!--   Disable Comment Button  -->
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
	</div>
</body>
</html>