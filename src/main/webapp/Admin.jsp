<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Login</title>
<%@ include file="component/css.jsp"%>

<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>

</head>
<body>
	<%@include file="component/navbar.jsp"%>

	<div class="container p-5">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card paint-card">
					<div class="card-body">
						<p class="text-center fs-4">Admin Login</p>

						<c:if test="${not empty success}">
							<p class="text-center text-success fs-4">${success }</p>
							<c:remove var="success" scope="session" />
						</c:if>
						<c:if test="${not empty error}">
							<p class="text-center text-danger fs-5">${error}</p>
							<c:remove var="error" scope="session" />
						</c:if>


						<form action="adminlogin" method="post">
							<div class="mb-3">
								<label class="form-label">Email address</label> <input
									type="email" required name="email" class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-label">Password</label> <input
									type="password" required name="password" class="form-control">
							</div>
							<button type="submit" class="btn bg-dark text-white col-md-12">Login</button>
						</form>


					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="component/footer.jsp"%>

</body>
</html>