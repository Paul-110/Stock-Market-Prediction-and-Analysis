<!DOCTYPE html>
<html lang="en">
<head>
<title>User Registration</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" type="image/png" href="images/favicon.png">
<link rel="stylesheet" href="style.css?v=1.2">
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
                        <li class="nav-item"><a href="index.html" class="nav-link"><img src="images/home.png" alt="Home" class="nav-icon-img"/><span>Home</span></a></li>
                        <li class="nav-item"><a href="CompanyLogin.jsp" class="nav-link"><img src="images/company.png" alt="Company" class="nav-icon-img"/><span>Company</span></a></li>
                        <li class="nav-item"><a href="Stock.jsp" class="nav-link"><img src="images/stock.png" alt="Stock" class="nav-icon-img"/><span>Stock</span></a></li>
                        <li class="nav-item"><a href="ArticalsLogin.jsp" class="nav-link"><img src="images/articles.png" alt="Articles" class="nav-icon-img"/><span>Articles</span></a></li>
                        <li class="nav-item active"><a href="UserLogin.jsp" class="nav-link"><img src="images/user.png" alt="User" class="nav-icon-img"/><span>User</span></a></li>
                    </ul>
                </nav>
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
            <div class="container">
                <div class="form-container">
                    <h2>Create a New User Account</h2>
                    <form name="userRegister" action="UserRegAction.jsp" method="post">
                        <div class="form-group">
                            <label for="fullname">Full Name</label>
                            <input type="text" id="fullname" name="fullname" required>
                        </div>
                        <div class="form-group">
                            <label for="email">Email Id</label>
                            <input type="text" id="email" name="email" required>
                        </div>
                        <div class="form-group">
                            <label for="aadhar">Aadhar No</label>
                            <input type="text" id="aadhar" name="aadhar" required>
                        </div>
                        <div class="form-group">
                            <label for="panno">Pancard No</label>
                            <input type="text" id="panno" name="panno" required>
                        </div>
                        <div class="form-group">
                            <label for="mobile">Mobile</label>
                            <input type="text" id="mobile" name="mobile" required>
                        </div>
                        <div class="form-group">
                            <label for="address">Address</label>
                            <input type="text" id="address" name="address" required>
                        </div>
                        <div class="form-group">
                            <label for="username">Username</label>
                            <input type="text" id="username" name="username" required>
                        </div>
                        <div class="form-group">
                            <label for="password">Password</label>
                            <input type="password" id="password" name="password" required>
                        </div>
                        <div class="form-actions">
                            <button type="submit" class="btn btn--primary">Register</button>
                            <input type="reset" class="btn btn--secondary" value="Reset">
                        </div>
                         <div style="text-align: center; margin-top: 1rem;">
                            <p>Already have an account? <a href="UserLogin.jsp" class="form-link">Login Here</a></p>
                        </div>
                    </form>
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
