
<%String username=(String)session.getAttribute("username");%>
<%String artclename=request.getParameter("artclename");
String companyname=request.getParameter("companyname");
String companyid=request.getParameter("companyid");%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Write a Comment</title>
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
                    <h2>Write a Comment</h2>
                </div>
            </div>
            <div class="container">
                <div class="form-container">
                    <h3>Welcome, <%=username%>!</h3>
                    <p>You are commenting on the article "<%=artclename%>" for <%=companyname%>.</p>
                    <form action="CommentAtion.jsp" name="comment" method="post" style="margin-top: 1.5rem;">
                        <input type="hidden" name="articlename" value="<%=artclename%>">
                        <input type="hidden" name="companyname" value="<%=companyname%>">
                        <input type="hidden" name="companyid" value="<%=companyid%>">
                        <div class="form-group">
                            <label for="opinion">Opinion</label>
                            <select id="opinion" name="opinion" class="form-group" style="width:100%; padding: 0.75rem; border: 1px solid var(--border-color); border-radius: var(--border-radius);">
                                <option value="">-- Select --</option>
                                <option value="positive">Positive</option>
                                <option value="negative">Negative</option>
                                <option value="neutral">Neutral</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="comment">Your Comment</label>
                            <textarea id="comment" name="comment" rows="4" required style="width:100%; padding: 0.75rem; border: 1px solid var(--border-color); border-radius: var(--border-radius); font-family: inherit;"></textarea>
                        </div>
                        <div class="form-actions">
                            <button type="submit" class="btn btn--primary">Submit Comment</button>
                            <input type="reset" class="btn btn--secondary" value="Reset">
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
