
<%@page import="com.entity.company"%>
<%@page import="com.dao.companyDao"%>
<%@page import="com.entity.courses"%>
<%@page import="com.dao.courseDao"%>
<%@page import="com.entity.coordinator"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.coordinatorDao"%>
<%
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student NOC</title>
<%@include file="component/css.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 8px 0 rgba(0, 0, 0, 0.3);
}

.backImg {
	background: linear-gradient(rgba(0, 0, 0, .4), rgba(0, 0, 0, .4)),
		url("img/hospital.jpg");
	height: 20vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
}
</style>
</head>
<body>
	<%@include file="component/navbar.jsp"%>

	<div class="container p-3">
		<div class="row">
			<div class="col-md-6 p-3">
				<img alt="" src="img/img2.jpg" width="470" height="450">
			</div>
			<div class="col-md-6 ">
				<div class="card paint-card">
					<div class="card-body">
						<p class="text-center fs-3">Student NOC Form</p>

						<c:if test="${not empty success}">
							<p class="text-center text-success fs-5">${success }</p>
							<c:remove var="success" scope="session" />
						</c:if>
						<c:if test="${not empty error}">
							<p class="text-center text-danger fs-5">${error}</p>
							<c:remove var="error" scope="session" />
						</c:if>

						<form class="row g-3" action="add_NOC" method="post"
							enctype="multipart/form-data">

							<input type="hidden" name="studentid" value="${studentObj.id}">
								
							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Full Name</label> <input
									required type="text" class="form-control" name="fullName">
							</div>

							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Roll No.</label> <input
									required type="number" class="form-control" name="roll_no">
							</div>
							<div class="col-md-6">
								<label for="inputPassword4" class="form-label">Branch</label> <select
									required class="form-control" name="branch">
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
							<div class="col-md-6">
								<label for="inputPassword4" class="form-label">Coordinator
									Name</label> <select required class="form-control"
									name="coordinator_id">
									<option value="">--select--</option>
									<%
									coordinatorDao dao = new coordinatorDao(DBConnect.getConn());
									List<coordinator> list = dao.getAllcoordinator();
									for (coordinator c : list) {
									%>
									<option value="<%=c.getId()%>"><%=c.getFullName()%>(<%=c.getDepartment()%>)
									</option>
									<%
									}
									%>
								</select>
							</div>
							<div class="col-md-6">
								<label for="inputPassword4" class="form-label">Company</label> <select
									required class="form-control" name="company">
									<option value="">--select--</option>
									<%
									companyDao dao3 = new companyDao(DBConnect.getConn());
									List<company> list3 = dao3.getAllCompany();
									for (company d : list3) {
									%>
									<option><%=d.getCompanyName()%>
									</option>
									<%
									}
									%>
								</select>
							</div>
							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Duration(in
									Months)</label> <input required type="text" class="form-control"
									name="duration">
							</div>
							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Email</label> <input
									required type="email" class="form-control" name="email">
							</div>
							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Phone No.</label> <input
									maxlength="10" required type="number" class="form-control"
									name="phone">
							</div>
							<div class="col-md-6">

								<label>Letter(in PDF)</label> <input type="file" name="letter"
									class="form-control">
							</div>
							<c:if test="${empty studentObj}">
								<a href="Student.jsp" class="col-md-6 offset-md-3 btn btn-dark">Submit</a>
							</c:if>

							<c:if test="${not empty studentObj}">
								<button class="col-md-6 offset-md-3 btn btn-dark">Submit</button>
							</c:if>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="component/footer.jsp"%>
</body>
</html>