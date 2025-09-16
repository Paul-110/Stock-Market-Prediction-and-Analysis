<% String articlename=(String)session.getAttribute("articlename");%>
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
                        <li class="nav-item active"><a href="ArticleHome.jsp" class="nav-link"><img src="images/home.png" alt="Home" class="nav-icon-img"/><span>Home</span></a></li>
                        <li class="nav-item"><a href="PublishArticle.jsp" class="nav-link"><img src="images/publish.png" alt="Publish" class="nav-icon-img"/><span>Publish Article</span></a></li>
                        <li class="nav-item"><a href="ViewCompanyDetails.jsp" class="nav-link"><img src="images/company.png" alt="Company" class="nav-icon-img"/><span>Company Details</span></a></li>
                        <li class="nav-item"><a href="PublishedArticles.jsp" class="nav-link"><img src="images/published.png" alt="Published" class="nav-icon-img"/><span>Published</span></a></li>
                    </ul>
                </nav>
                <div class="logout-link">
                     <a href="ArticalsLogin.jsp" class="btn btn--secondary">Logout</a>
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
                    <h2>Welcome, <%=articlename%>!</h2>
                </div>
            </div>
            <div class="container">
                <div class="dashboard-grid">
                    <a href="PublishArticle.jsp" class="content-card">
                        <div class="card-icon"><img src="images/publish.png" alt="Publish" class="card-icon-img"/></div>
                        <h3>Publish New Article</h3>
                        <p>Create and publish a new financial article for analysis.</p>
                    </a>
                    <a href="ViewCompanyDetails.jsp" class="content-card">
                        <div class="card-icon"><img src="images/company.png" alt="Company" class="card-icon-img"/></div>
                        <h3>View Company Details</h3>
                        <p>Browse details of all registered companies.</p>
                    </a>
                    <a href="PublishedArticles.jsp" class="content-card">
                        <div class="card-icon"><img src="images/published.png" alt="Published" class="card-icon-img"/></div>
                        <h3>My Published Articles</h3>
                        <p>View and manage all the articles you have published.</p>
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