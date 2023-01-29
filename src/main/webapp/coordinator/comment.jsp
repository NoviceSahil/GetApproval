
<%@page import="com.entity.NOC"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.NocDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Comment</title>
<%@include file="../component/css.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}

.backImg {
	background: linear-gradient(rgba(0, 0, 0, .4), rgba(0, 0, 0, .4)),
		url("../img/img2.jpg");
	height: 20vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
}
</style>
</head>
<body>
	<c:if test="${empty coordinatorObj }">
		<c:redirect url="../Coordinator.jsp"></c:redirect>
	</c:if>
	<%@include file="navbar.jsp"%>
	<div class="container-fluid backImg p-5">
		<p class=" text-center fs-2 text-white"></p>
	</div>

	<div class="container p-3">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card paint-card">
					<div class="card-body">
						<p class="text-center fs-4">Student NOC Comment</p>
						<%
						int id = Integer.parseInt(request.getParameter("id"));
						NocDao dao = new NocDao(DBConnect.getConn());
						NOC noc = dao.getNOCByID(id);
						%>
						<form class="row" action="../updatestatus" method="post">
							<div class="col-md-6">
								<label>Student Name</label><input type="text" readonly
									value="<%=noc.getFullName()%>" class="form-control">
							</div>
							<div class="col-md-6">
								<label>Roll No.</label><input type="text" readonly
									value="<%=noc.getRoll_no()%>" class="form-control">
							</div>
							<div class="col-md-6">
								<label>Branch</label><input type="text" readonly
									value="<%=noc.getBranch()%>" class="form-control">
							</div>
							<div class="col-md-6">
								<label>Company</label><input type="text" readonly
									value="<%=noc.getCompany()%>" class="form-control">
							</div>
							<div class="col-md-6">
								<label>Duration</label><input type="text" readonly
									value="<%=noc.getDuration()%>" class="form-control">
							</div>

							<div class="col-md-6">
								<label>Email</label><input type="text" readonly
									value="<%=noc.getEmail()%>" class="form-control">
							</div>
							<div class="col-md-6">
								<label>Phone</label><input type="text" readonly
									value="<%=noc.getPhone()%>" class="form-control">
							</div>
							<div class="col-md-6">
								<label>Status</label><input type="text" readonly
									value="<%=noc.getStatus()%>" class="form-control">
							</div>
							<div class="col-md-12">
								<br> <label>Comment</label>
								<textarea required name="comment" class="form-control" rows="3"
									cols=""></textarea>
							</div>
							<input type="hidden" name="id" value="<%=noc.getId()%>"><input
								type="hidden" name="cid" value="<%=noc.getCoordinator_id()%>">

							<button class="mt-3 btn btn-primary col-md-6 offset-md-3">Submit</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>