<%@page import="com.lsse.UsersDtls"%>
<%@page import="com.lsse.UsersDAO"%>
<%@page import="com.lsse.DbConnect"%>
<%@page import="java.sql.*"%>
<html lang="en">
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Edit Person - Local Service Search Engine</title>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicons -->
<link href="assets/img/favicon.png" rel="icon">
<link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Google Fonts -->
<link href="https://fonts.gstatic.com" rel="preconnect">
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="../assets1/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="../assets1/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="../assets1/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link href="../assets1/vendor/quill/quill.snow.css" rel="stylesheet">
<link href="../assets1/vendor/quill/quill.bubble.css" rel="stylesheet">
<link href="../assets1/vendor/remixicon/remixicon.css" rel="stylesheet">
<link href="../assets1/vendor/simple-datatables/style.css"
	rel="stylesheet">

<!-- Template Main CSS File -->
<link href="../assets1/css/style.css" rel="stylesheet">

</head>

<body>

	<!-- ======= Header ======= -->
	<header id="header" class="header fixed-top d-flex align-items-center">

		<div class="d-flex align-items-center justify-content-between">
			<a href="dashboard.jsp" class="logo d-flex align-items-center"> <span
				class="d-none d-lg-block">LSSEMS</span>
			</a> <i class="bi bi-list toggle-sidebar-btn"></i>
		</div>
		<!-- End Logo -->

		<nav class="header-nav ms-auto">
			<ul class="d-flex align-items-center">


				<li class="nav-item dropdown pe-3"><a
					class="nav-link nav-profile d-flex align-items-center pe-0"
					href="#" data-bs-toggle="dropdown"> <span
						class="d-none d-md-block dropdown-toggle ps-2">Admin</span>
				</a>
				<!-- End Profile Iamge Icon -->

					<ul
						class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
						<li class="dropdown-header">
							<h6>Admin</h6>
						</li>

						<li>
							<hr class="dropdown-divider">
						</li>

						<li><a class="dropdown-item d-flex align-items-center"
							href="changePassword.jsp"> <i class="bi bi-gear"></i> <span>Account
									Settings</span>
						</a></li>
						<li>
							<hr class="dropdown-divider">
						</li>

						<li>
							<hr class="dropdown-divider">
						</li>

						<li><a class="dropdown-item d-flex align-items-center"
							href="../logout"> <i class="bi bi-box-arrow-right"></i> <span>Sign
									Out</span>
						</a></li>

					</ul>
					<!-- End Profile Dropdown Items --></li>
				<!-- End Profile Nav -->

			</ul>
		</nav>
		<!-- End Icons Navigation -->

	</header>
	<!-- End Header -->

	<!-- ======= Sidebar ======= -->
	<aside id="sidebar" class="sidebar">

		<ul class="sidebar-nav" id="sidebar-nav">

			<li class="nav-item"><a class="nav-link" href="dashboard.jsp">
					<i class="bi bi-grid"></i> <span>Dashboard</span>
			</a></li>
			<!-- End Dashboard Nav -->

			<li class="nav-item"><a class="nav-link collapsed"
				href="viewCategory.jsp"> <i class="bi bi-question-circle"></i> <span>Category</span>
			</a></li>
			<!-- End F.A.Q Page Nav -->

			<li class="nav-item"><a class="nav-link collapsed"
				href="viewPerson.jsp"> <i class="bi bi-envelope"></i> <span>Person
						List</span>
			</a></li>
			<!-- End Contact Page Nav -->

			<li class="nav-item"><a class="nav-link collapsed"
				href="changePassword.jsp"> <i class="bi bi-card-list"></i> <span>Change
						Password</span>
			</a></li>
			<!-- End Register Page Nav -->

			<li class="nav-item"><a class="nav-link collapsed" href="../logout">
					<i class="bi bi-box-arrow-in-right"></i> <span>Logout</span>
			</a></li>
			<!-- End Login Page Nav -->
		</ul>

	</aside>
	<!-- End Sidebar-->

	<main id="main" class="main">
	<div class="pagetitle">
		<h1>Edit Person</h1>
		<nav>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="dashboard.jsp">Home</a></li>
				<li class="breadcrumb-item active"><a href="viewPerson.jsp">View
						Person</a></li>
				<li class="breadcrumb-item active">Edit Person</li>
			</ol>
		</nav>
	</div>

	<%
    String msg=request.getParameter("msg");
    if("valid".equals(msg))
    {
  %>
    <script>
		alert("Person Updated Successfully");
		window.location.assign("viewPerson.jsp");
	</script>  	
  <%
    }
  %>

	<section class="section profile">
		<div class="row">

			<div class="col-xl-12">

				<div class="card">
					<div class="card-body pt-3">
						<!-- Bordered Tabs -->
						<ul class="nav nav-tabs nav-tabs-bordered">

							<li class="nav-item">
								<button class="nav-link active" data-bs-toggle="tab"
									data-bs-target="#profile-overview">Update Person</button>
							</li>
						</ul>
						
						<%
                    		String category="";
							int id = Integer.parseInt(request.getParameter("id"));
                    		UsersDAO dao= new UsersDAO(DbConnect.Connect());
							UsersDtls p =dao.getPersonById(id);
							category=p.getCategory();
					
						%>
						<div class="tab-content pt-2">

							<div class="tab-pane fade show active profile-overview"
								id="profile-overview">
								<form method="post" enctype="multipart/form-data" action="../updatePerson">
            					<input type="hidden" name="id" value="<%= id%>">
								

									<div class="row mb-3">
										<label class="col-md-4 col-lg-3 col-form-label">Service
											Category</label>
										<div class="col-md-8 col-lg-9">
											<select name="Category" class="form-control" required>
												<%
                                     try
                                      {
                                    	
                                    	Connection con= DbConnect.Connect();
	                                    Statement st = con.createStatement();
	                                    ResultSet rs = st.executeQuery("select Category from category");
	                                    %>
	                                    <option value="<%=category%>"><%=category%></option>
	                                    <% 
	                                    while(rs.next())
	                                    {
	                                   %>
	                                    <option value="<%=rs.getString("Category")%>"><%=rs.getString("Category")%></option>
	                                   <%
	                                    }
                                     }

								catch(Exception e){
									System.out.println(e);
                                }
								%>
											</select>
										</div>
									</div>

									<div class="row mb-3">
										<label class="col-md-4 col-lg-3 col-form-label">Name</label>
										<div class="col-md-8 col-lg-9">
											<input type="text" name="Name" class="form-control"
												value="<%= p.getName()%>" required>
										</div>
									</div>
									
									<div class="row mb-3">                                	
                                    	<label class="col-md-4 col-lg-3 col-form-label">Product Photo</label>
                                    	<div class="col-md-8 col-lg-6">                                    
                                    		<input type="file" name="Picture" accept=".jpg,.png" class="custom-control">
                                    		<img src="../images1/<%= p.getPicture()%>" width="100" height="100" class="float-right">
                                    	</div>
                                	</div>
                                
									<div class="row mb-3">
										<label class="col-md-4 col-lg-3 col-form-label">Mobile
											Number</label>
										<div class="col-md-8 col-lg-9">
											<input type="text" name="MobileNumber" class="form-control"
												value="<%= p.getMobileNumber()%>" required>
										</div>
									</div>

									<div class="row mb-3">
										<label class="col-md-4 col-lg-3 col-form-label">Address</label>
										<div class="col-md-8 col-lg-9">
											<textarea name="Address" class="form-control"
												required><%= p.getAddress()%></textarea>
										</div>
									</div>

									<div class="row mb-3">
										<label class="col-md-4 col-lg-3 col-form-label">City</label>
										<div class="col-md-8 col-lg-9">
											<input type="text" name="City" class="form-control"
												value="<%= p.getCity()%>" required>
										</div>
									</div>

									<div class="text-center">
										<button type="submit" class="btn btn-primary">Submit</button>
									</div>
								</form>

							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</section>


	</main>
	<!-- End #main -->

	<!-- ======= Footer ======= -->
	<footer id="footer" class="footer">
		<div class="copyright">
			&copy; Copyright <strong><span>Local Service Search Engine Management System</span></strong>.
		</div>
	</footer>
	<!-- End Footer -->

	<a href="#"
		class="back-to-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

	<!-- Vendor JS Files -->
	<script src="../assets1/vendor/apexcharts/apexcharts.min.js"></script>
	<script src="../assets1/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="../assets1/vendor/chart.js/chart.min.js"></script>
	<script src="../assets1/vendor/echarts/echarts.min.js"></script>
	<script src="../assets1/vendor/quill/quill.min.js"></script>
	<script src="../assets1/vendor/simple-datatables/simple-datatables.js"></script>
	<script src="../assets1/vendor/tinymce/tinymce.min.js"></script>
	<script src="../assets1/vendor/php-email-form/validate.js"></script>

	<!-- Template Main JS File -->
	<script src="../assets1/js/main.js"></script>

</body>
</html>