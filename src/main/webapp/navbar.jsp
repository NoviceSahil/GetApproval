<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
	<div class="container-fluid">
		<a class="navbar-brand" href="home.jsp"> <i
			class="fa-sharp fa-solid fa-thumbs-up"></i> Get Approval
		</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link active" href="Home.jsp">
						Home</a></li>
				<li class="nav-item"><a class="nav-link active"
					href="coordinator.jsp">Coordinator</a></li>
				<!-- <li class="nav-item"><a class="nav-link active"
					href="view_coordinator.jsp">View Coordinator</a></li> -->
				<li class="nav-item"><a class="nav-link active"
					href="student.jsp">Student</a></li>
				<li class="nav-item"><a class="nav-link active"
					href="courses.jsp">Courses</a></li>
				<li class="nav-item"><a class="nav-link active"
					href="companyList.jsp">Company</a></li>
			</ul>
			<form>
				<div class="d-flex">
					<div class="dropdown">
						<button class="btn btn-light dropdown-toggle" type="button"
							id="dropdownMenuButton1" data-bs-toggle="dropdown"
							aria-expanded="false">Admin</button>
						<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
							<li><a class="dropdown-item" href="../AdminLogout">Logout</a></li>
						</ul>
					</div>
				</div>
			</form>
		</div>
	</div>
</nav>