<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.entity.courses"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.courseDao"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Change Password</title>
<%@include file="component/css.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
	<%@include file="component/navbar.jsp"%>
	<c:if test="${empty studentObj }">
		<c:redirect url="Student.jsp"></c:redirect>
	</c:if>
	<div class="container p-4">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card paint-card">
					<p class="text-center fs-3">Change Password</p>
					<c:if test="${not empty success}">
						<p class="text-center text-success fs-3">${success }</p>
						<c:remove var="success" scope="session" />
					</c:if>
					<c:if test="${not empty error}">
						<p class="text-center text-danger fs-4">${error}</p>
						<c:remove var="error" scope="session" />
					</c:if>
					<div class="card-body">
						<form action="changespassword" method="post">
							<div class="mb-3">
								<label>Enter Old Password</label><input type="text"
									name="oldPassword" class="form-control" required>
							</div>
							<div class="mb-3">
								<label>Enter New Password</label><input type="text"
									name="newPassword" class="form-control" required>
							</div>

							<input type="hidden" value="${studentObj.id}" name="sid">
							<button class="btn btn-dark col-md-12">Change Password</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>