<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.coordinatorDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Coordinator Dashboard</title>
<%@include file="../component/css.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
<style>
a:link {
	color: black;
	background-color: transparent;
	text-decoration: none;
}

a:visited {
	color: black;
	background-color: transparent;
	text-decoration: none;
}

a:active {
	color: black;
	background-color: transparent;
}
</style>
</head>
<body>
	<c:if test="${empty coordinatorObj }">
		<c:redirect url="../Coordinator.jsp"></c:redirect>
	</c:if>
	<%@include file="navbar.jsp"%>
	<div class="container p-5">
		<p class="text-center fs-3">Coordinator Dashboard</p>
		<c:if test="${not empty success}">
			<p class="text-center text-success fs-3">${success }</p>
			<c:remove var="success" scope="session" />
		</c:if>
		<c:if test="${not empty error}">
			<p class="text-center text-danger fs-5">${error}</p>
			<c:remove var="error" scope="session" />
		</c:if>
		<%
		coordinatorDao dao = new coordinatorDao(DBConnect.getConn());
		%>
		<div class="row">
			<div class="col-md-4 offset-md-2">
				<div class="card paint-card">
					<div class="card-body text-center text-dark">
						<i class="fas fa-user-md fa-5x"></i><br>
						<p class="text-center fs-4">
							<a class="nav-link active" href="details.jsp"> Coordinators <br></a>
							<%=dao.countCoordinator()%>
						</p>
					</div>
				</div>
			</div>

			<div class="col-md-4">
				<div class="card paint-card">
					<div class="card-body text-center text-dark">
						<i class="far fa-calendar-check fa-3x"></i><br>
						<p class="text-center fs-4">
							<a class="nav-link active" aria-current="true" href="noc.jsp">

								NOC <br> <%=dao.countNOC()%>
						</p>
					</div>
				</div>
			</div>
		</div>
</body>
</html>

