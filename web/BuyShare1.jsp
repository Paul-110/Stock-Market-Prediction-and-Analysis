<%String username=(String)session.getAttribute("username");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Confirm Purchase</title>
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
                        <li class="nav-item active"><a href="ViewCompanies.jsp" class="nav-link"><img src="images/company.png" alt="Company" class="nav-icon-img"/><span>View Companies</span></a></li>
                        <li class="nav-item"><a href="AllBoughtShares.jsp" class="nav-link"><img src="images/cart.png" alt="Shares" class="nav-icon-img"/><span>My Shares</span></a></li>
                        <li class="nav-item"><a href="Predict.jsp" class="nav-link"><img src="images/predict.png" alt="Predict" class="nav-icon-img"/><span>Predict</span></a></li>
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
                    <h2>Confirm Purchase</h2>
                </div>
            </div>
            <div class="container">
            <%
                String companyname = request.getParameter("company");
                String id = request.getParameter("id");
                Double shares = Double.parseDouble(request.getParameter("shares"));
                Double sharevalue = Double.parseDouble(request.getParameter("sharevalue"));
                Double amount = Double.parseDouble(request.getParameter("amount"));
                Double share = amount / sharevalue;
                if (share >= 1) {
            %>
                <div class="form-container" style="text-align: center;">
                    <h3>Congratulations, <%=username%>!</h3>
                    <p style="margin: 1rem 0;">You are eligible to purchase <strong><%=String.format("%.2f", share)%></strong> shares.</p>
                    <form action="BuySharesDB.jsp" name="share" method="post">
                        <input type="hidden" name="company" value="<%=companyname%>">
                        <input type="hidden" name="id" value="<%=id%>">
                        <input type="hidden" name="shares" value="<%=shares%>">
                        <input type="hidden" name="sharevalue" value="<%=sharevalue%>">
                        <input type="hidden" name="usershare" value="<%=share%>">
                        <div class="form-actions" style="justify-content: center; gap: 1rem;">
                            <button type="submit" class="btn btn--primary">Confirm Purchase</button>
                            <a href="ViewCompanies.jsp" class="btn btn--secondary">Cancel</a>
                        </div>
                    </form>
            <% } else { %>
                <div class="content-card" style="max-width: 600px; margin: 2rem auto; text-align: center;">
                    <div class="card-icon"><img src="images/negative.png" alt="Error" class="card-icon-img"/></div>
                    <h3 style="color: #dc3545;">Purchase Not Possible</h3>
                    <p>Sorry, the amount you entered is not sufficient to purchase even one share.</p>
                    <a href="ViewCompanies.jsp" class="btn btn--primary" style="margin-top: 1rem;">Back to Companies</a>
                </div>
            <% } %>
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