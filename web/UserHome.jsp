<%String username=(String)session.getAttribute("username");%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>User Home</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" type="image/png" href="images/favicon.png">
<link rel="stylesheet" href="style.css?v=1.4">
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
                        <li class="nav-item active"><a href="UserHome.jsp" class="nav-link"><img src="images/home.png" alt="Home" class="nav-icon-img"/><span>Home</span></a></li>
                        <li class="nav-item"><a href="ViewCompanies.jsp" class="nav-link"><img src="images/company.png" alt="Company" class="nav-icon-img"/><span>View Companies</span></a></li>
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
                    <h2>Welcome, <%=username%>!</h2>
                </div>
            </div>

            <div class="container">
                <div class="dashboard-grid">
                    <!-- Card 1: Sentiment Analysis -->
                    <a href="Sentiment.jsp" class="content-card">
                        <div class="card-icon"><img src="images/sentiment.png" alt="Sentiment" class="card-icon-img"/></div>
                        <h3>Sentiment Analysis</h3>
                        <p>Analyze market sentiment from news and articles to guide your investment decisions.</p>
                        <span class="btn btn--primary">Analyze Sentiment</span>
                    </a>

                    <!-- Card 2: POS Tagger -->
                    <a href="POSTagger.jsp" class="content-card">
                        <div class="card-icon"><img src="images/tag.png" alt="Tagger" class="card-icon-img"/></div>
                        <h3>POS Tagger</h3>
                        <p>Use Part-of-Speech tagging for advanced textual analysis of financial documents.</p>
                        <span class="btn btn--primary">Use Tagger</span>
                    </a>

                    <!-- Card 3: RSS Feed -->
                    <a href="RSSFeed.jsp" class="content-card">
                        <div class="card-icon"><img src="images/rss.png" alt="RSS" class="card-icon-img"/></div>
                        <h3>RSS Feed</h3>
                        <p>Stay updated with the latest financial news from various sources via RSS feeds.</p>
                        <span class="btn btn--primary">View Feeds</span>
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
