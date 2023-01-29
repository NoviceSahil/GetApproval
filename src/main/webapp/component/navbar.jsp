<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark ">
	<div class="container-fluid">
		<a class="navbar-brand" href="Home.jsp"><i
			class="fa-sharp fa-solid fa-thumbs-up"></i> Get Approval</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">

			<ul class="navbar-nav ms-auto mb-2 mb-lg-20">


				<c:if test="${empty studentObj }">

					<div class="dropdown">
						<button class="btn btn-light dropdown-toggle" type="button"
							id="dropdownMenuButton1" data-bs-toggle="dropdown"
							aria-expanded="false">Login Here</button>
						<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
							<li><a class="dropdown-item" href="Admin.jsp">Admin</a></li>
							<li><a class="dropdown-item" href="Coordinator.jsp">Coordinator</a></li>
							<li><a class="dropdown-item" href="Student.jsp">Student</a></li>
						</ul>
					</div>

				</c:if>


				<c:if test="${not empty studentObj }">
				
						
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="student_noc.jsp">NOC</a></li>
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="view_noc.jsp"> View NOC</a></li>

					<div class="dropdown">
						<button class="btn btn-light dropdown-toggle" type="button"
							id="dropdownMenuButton1" data-bs-toggle="dropdown"
							aria-expanded="false">
							<i class="fa-solid fa-circle-user"></i> ${studentObj.fullName }
						</button>
						<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
							<!-- <li><a class="dropdown-item" href="change_spassword.jsp">Change Password</a></li> -->
							<li><a class="dropdown-item" href="studentlogout">Logout</a></li>
						</ul>

					</div>
				</c:if>
			</ul>
		</div>
	</div>
</nav>