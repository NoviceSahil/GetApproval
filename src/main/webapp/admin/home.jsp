<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.dao.coordinatorDao"%>
<%@page import="com.db.DBConnect"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="../component/css.jsp"%>

<title>Admin Home</title>

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

	<%@include file="navbar.jsp"%>
	<c:if test="${empty adminObj }">
		<c:redirect url="../Admin.jsp"></c:redirect>
	</c:if>

	<!-- ...........Main......... -->
	<div class="container p-5">
		<p class="text-center fs-3">
			<b>Admin Dashboard</b>
		</p>
		<c:if test="${not empty success}">
			<p class="text-center text-dark fs-3">${success }</p>
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
			<div class="col-md-4">
				<div class="card paint-card">
					<div class="card-body text-center text-dark">
						<i class="fas fa-user-md fa-3x"></i><br>
						<p class="text-center fs-4">
							<a class="nav-link active" aria-current="true"
								href="coordinator.jsp"> Coordinator <br></a>

							<%=dao.countCoordinator()%>

						</p>
					</div>
				</div>
			</div>


			<div class="col-md-4">
				<div class="card paint-card">
					<div class="card-body text-center text-dark">
						<i class="fas fa-user-circle fa-3x"></i><br>
						<p class="text-center fs-4">
							<a class="nav-link active" aria-current="true" href="student.jsp">
								Students<br>
							</a>

							<%=dao.countStudent()%>

						</p>
					</div>
				</div>
			</div>

			<div class="col-md-4">
				<div class="card paint-card">
					<div class="card-body text-center text-dark">
						<i class="far fa-calendar-check fa-3x"></i><br>
						<p class="text-center fs-4">
							<a class="nav-link active" aria-current="true" href="nocA.jsp">
								NOC <br>
							</a>
							<%=dao.countNOC()%>

						</p>
					</div>
				</div>
			</div>
			<div class="col-md-4 mt-3">
				<div class="card paint-card" data-bs-toggle="modal"
					data-bs-target="#exampleModal">
					<div class="card-body text-center text-dark">
						<i class="far fa-calendar-check fa-3x"></i><br>
						<p class="text-center fs-4">
							<a class="nav-link active" aria-current="true" href="#"> Add
								Courses <br>
							</a>
							<%=dao.countCourse()%>

						</p>
					</div>
				</div>
			</div>
			<div class="col-md-4 mt-3">
				<div class="card paint-card">
					<div class="card-body text-center text-dark">
						<i class="far fa-calendar-check fa-3x"></i><br>
						<p class="text-center fs-4">
							<a class="nav-link active" aria-current="true"
								href="companyList.jsp"> Company List <br></a>
							<%=dao.countcompany()%>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- .....................Modal......................... -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					<form action="../addcourse" method="post">
						<div class="form-goup">
							<div class="text-center fs-4">
								<label> Enter Course</label><input type="text" name="courName"
									class="form-control">
							</div>
						</div>
						<div class="text-center mt-3">
							<button type="submit" class="btn btn-dark">Add</button>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

</body>
</html>