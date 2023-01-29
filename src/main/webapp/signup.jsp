<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.entity.company"%>
<%@page import="com.dao.companyDao"%>
<%@page import="com.entity.courses"%>
<%@page import="com.dao.courseDao"%>
<%@page import="com.entity.coordinator"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.coordinatorDao"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sign Up</title>
<%@include file="component/css.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
	<%@include file="component/navbar.jsp"%>
	<!-- ...............Main.......... -->
	<div class="container p-2">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card paint-card">
					<div class="card-body">
						<p class="text-center fs-4">Student Registration</p>


						<c:if test="${not empty success}">
							<p class="text-center text-success fs-3">${success}</p>
							<c:remove var="success" scope="session" />
						</c:if>
						<c:if test="${not empty error}">
							<p class="text-center text-danger fs-4">${error}</p>
							<c:remove var="error" scope="session" />
						</c:if>


						<form action="student_register" method="post">
							<div class="mb-2">
								<label class="form-label">Full Name</label> <input type="text"
									required name="fullName" class="form-control">
							</div>
							<div class="mb-2">
								<label class="form-label">Roll No.</label> <input type="text"
									required name="roll_no" class="form-control">
							</div>
							<div class="mb-2">
								<label class="form-label">Email Address</label> <input
									type="email" required name="email" class="form-control">
							</div>

							<div class="mb-2">
								<label class="form-label">Branch</label> <select required
									class="form-control" name="branch">
									<option value="">--select--</option>
									<%
									courseDao dao1 = new courseDao(DBConnect.getConn());
									List<courses> list1 = dao1.getAllCourse();
									for (courses d : list1) {
									%>
									<option><%=d.getCourseName()%>
									</option>
									<%
									}
									%>
								</select>
							</div>
							<div class="mb-2">
								<label class="form-label">Password</label> <input
									type="password" required name="password" class="form-control">
							</div>
							<button type="submit" class="btn bg-dark text-white col-md-12">Register</button>
							<br> Already have an account? <a href="Student.jsp"
								class="text-decoration-none textcolor-black">Sign In Here</a>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>