<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%String username=(String)session.getAttribute("username");%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Prediction Result</title>
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
                        <li class="nav-item"><a href="UserHome.jsp" class="nav-link"><img src="images/home.png" alt="Home" class="nav-icon-img"/><span>Home</span></a></li>
                        <li class="nav-item"><a href="ViewCompanies.jsp" class="nav-link"><img src="images/company.png" alt="Company" class="nav-icon-img"/><span>View Companies</span></a></li>
                        <li class="nav-item"><a href="AllBoughtShares.jsp" class="nav-link"><img src="images/cart.png" alt="Shares" class="nav-icon-img"/><span>My Shares</span></a></li>
                        <li class="nav-item active"><a href="Predict.jsp" class="nav-link"><img src="images/predict.png" alt="Predict" class="nav-icon-img"/><span>Predict</span></a></li>
                    </ul>
                </nav>
                <div class="logout-link">
                     <a href="UserLogin.jsp" class="btn btn--secondary">Logout</a>
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
                    <h2>Prediction Result</h2>
                </div>
            </div>
            <div class="container">
                <div class="content-card" style="max-width: 600px; margin: 2rem auto; text-align: center;">
                    <%
                        double value = (Double)session.getAttribute("value");
                        double a1 = (Double)session.getAttribute("a1");
                        double value2 = value * a1 / 100;
                        double value3 = value + value2;
                    %>
                    <div class="card-icon"><img src="images/positive.png" alt="Positive" class="card-icon-img"/></div>
                    <h3>Positive Outlook</h3>
                    <p style="font-size: 1.2rem; color: var(--text-color);">
                        Hello, <strong><%=username%></strong>! Based on our analysis, your purchased company share value has a positive outlook.
                    </p>
                    <p style="font-size: 1.5rem; font-weight: bold; color: #28a745; margin: 1rem 0;">
                        Potential Increase: ₹<%=String.format("%.2f", value3)%>
                    </p>
                    <a href="Predict.jsp" class="btn btn--primary" style="margin-top: 1rem;">Run Another Prediction</a>
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