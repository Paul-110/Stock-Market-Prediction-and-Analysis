<%String companyname=(String)session.getAttribute("companyname");%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Company Home</title>
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
                        <li class="nav-item active"><a href="CompanyHome.jsp" class="nav-link"><img src="images/home.png" alt="Home" class="nav-icon-img"/><span>Home</span></a></li>
                        <li class="nav-item"><a href="ShareHolders.jsp" class="nav-link"><img src="images/shareholders.png" alt="Shareholders" class="nav-icon-img"/><span>Shareholders</span></a></li>
                        <li class="nav-item"><a href="OtherCompanyShare.jsp" class="nav-link"><img src="images/stock.png" alt="Shares" class="nav-icon-img"/><span>Other Shares</span></a></li>
                    </ul>
                </nav>
                <div class="logout-link">
                     <a href="CompanyLogin.jsp" class="btn btn--secondary">Logout</a>
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
                    <h2>Welcome, <%=companyname%>!</h2>
                </div>
            </div>
            <div class="container">
                <div class="dashboard-grid">
                    <a href="ShareHolders.jsp" class="content-card">
                        <div class="card-icon"><img src="images/shareholders.png" alt="Shareholders" class="card-icon-img"/></div>
                        <h3>View Shareholders</h3>
                        <p>See a detailed list of all shareholders for your company.</p>
                    </a>
                    <a href="OtherCompanyShare.jsp" class="content-card">
                        <div class="card-icon"><img src="images/stock.png" alt="Shares" class="card-icon-img"/></div>
                        <h3>Other Company Shares</h3>
                        <p>Analyze share information from other companies in the market.</p>
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
