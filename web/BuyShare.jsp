<%String username=(String)session.getAttribute("username");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Buy Share</title>
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
                    <h2>Buy Share</h2>
                </div>
            </div>
            <div class="container">
            <%
                String id = request.getParameter("companyid");
                String companyname = request.getParameter("companyname");
                Double shares = Double.parseDouble(request.getParameter("shares"));
                String sharevalue = request.getParameter("sharevalue");
                Double availableshare = Double.parseDouble(request.getParameter("availableshare"));
                if (availableshare != 0) {
            %>
                <div class="form-container">
                    <h3>Welcome, <%=username%>!</h3>
                    <p>You are about to purchase shares for <%=companyname%>.</p>
                    <form action="BuyShare1.jsp" name="share" method="post" style="margin-top: 1.5rem;">
                        <div class="form-group">
                            <label>Company Name</label>
                            <input type="text" name="company" value="<%=companyname%>" readonly>
                        </div>
                        <div class="form-group">
                            <label>Company ID</label>
                            <input type="text" name="id" value="<%=id%>" readonly>
                        </div>
                        <div class="form-group">
                            <label>Company Total Shares</label>
                            <input type="text" name="shares" value="<%=shares%>" readonly>
                        </div>
                        <div class="form-group">
                            <label>Company Share Value (Rs/-)</label>
                            <input type="text" name="sharevalue" value="<%=sharevalue%>" readonly>
                        </div>
                        <div class="form-group">
                            <label for="amount">Enter Amount (Rs/-)</label>
                            <input type="text" id="amount" name="amount" placeholder="Enter amount based on share value" required>
                        </div>
                        <div class="form-actions">
                            <button type="submit" class="btn btn--primary">Buy Share</button>
                            <input type="reset" class="btn btn--secondary" value="Reset">
                        </div>
                    </form>
                </div>
            <% } else { %>
                <script type="text/javascript">
                    window.alert("Sorry.. No Shares Are Available To Purchase for this company.");
                    window.location = "ViewCompanies.jsp";
                </script>
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
