<% String username=(String)session.getAttribute("username");%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Stock Home</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" type="image/png" href="images/favicon.png">
<link rel="stylesheet" href="style.css">
</head>
<body id="page1">
<div class="main">
<!-- header -->
	<header class="header">
		<div class="container">
			<div class="header-content">
                <div class="logo">
                    <h1><a href="index.html">Stock Market Prediction And Analysis</a></h1>
                </div>
                <nav class="navigation">
                    <ul class="nav-menu">
                        <li class="nav-item active"><a href="StockHome.jsp" class="nav-link"><img src="images/home.png" alt="Home" class="nav-icon-img"/><span>Home</span></a></li>
                        <li class="nav-item"><a href="CompanyDetails.jsp" class="nav-link"><img src="images/company.png" alt="Company" class="nav-icon-img"/><span>Company Details</span></a></li>
                        <li class="nav-item"><a href="UserDetails.jsp" class="nav-link"><img src="images/user.png" alt="User" class="nav-icon-img"/><span>User Details</span></a></li>
                        <li class="nav-item"><a href="ArticalsDetails.jsp" class="nav-link"><img src="images/articles.png" alt="Articles" class="nav-icon-img"/><span>Article Details</span></a></li>
                    </ul>
                </nav>
                <div class="logout-link">
                     <a href="StockLogin.jsp" class="btn btn--secondary">Logout</a>
                </div>
                 <div class="mobile-menu-toggle">
                    <span></span>
                    <span></span>
                    <span></span>
                </div>
            </div>
		</div>
	</header>
<!-- / header -->
<!-- content -->
	<section id="content">
            <div class="page-header">
                <div class="container">
                    <h2>Stock Authority Dashboard</h2>
                </div>
            </div>
            <div class="container">
                <div class="dashboard-grid">
                    <a href="CompanyDetails.jsp" class="content-card">
                        <div class="card-icon"><img src="images/company.png" alt="Company" class="card-icon-img"/></div>
                        <h3>Company Details</h3>
                        <p>View and manage registered company information and status.</p>
                    </a>
                    <a href="UserDetails.jsp" class="content-card">
                        <div class="card-icon"><img src="images/user.png" alt="User" class="card-icon-img"/></div>
                        <h3>User Details</h3>
                        <p>View and manage registered user information and status.</p>
                    </a>
                    <a href="ArticalsDetails.jsp" class="content-card">
                        <div class="card-icon"><img src="images/articles.png" alt="Articles" class="card-icon-img"/></div>
                        <h3>Article Details</h3>
                        <p>View and manage registered article publisher information.</p>
                    </a>
                </div>
            </div>
	</section>
<!-- / content -->
<!-- footer -->
	<footer class="footer">
		<div class="container">
			<div class="footer-content">
				<p>&copy; 2024 Stock Market Prediction And Analysis. All rights reserved.</p>
				<p>Designed with modern web technologies for financial excellence</p>
			</div>
		</div>
	</footer>
<!-- / footer -->
</div>
<script src="app.js"></script>
</body>
</html>