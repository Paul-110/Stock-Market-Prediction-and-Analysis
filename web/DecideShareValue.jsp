<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Decide Share Value</title>
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
                            <li class="nav-item"><a href="StockHome.jsp" class="nav-link"><img src="images/home.png" alt="Home" class="nav-icon-img"/><span>Home</span></a></li>
                            <li class="nav-item active"><a href="CompanyDetails.jsp" class="nav-link"><img src="images/company.png" alt="Company" class="nav-icon-img"/><span>Company Details</span></a></li>
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
                    <h2>Set Share Value for <%=request.getParameter("companyname")%></h2>
                </div>
            </div>
            <div class="container">
                <div class="form-container">
                    <form action="ShareValue.jsp" method="post">
                        <input type="hidden" name="companyname" value="<%=request.getParameter("companyname")%>">
                        <input type="hidden" name="id" value="<%=request.getParameter("id")%>">
                        <div class="form-group">
                            <label for="shares">Total Shares</label>
                            <input type="number" id="shares" name="shares" required>
                        </div>
                        <div class="form-group">
                            <label for="sharevalue">Value per Share (₹)</label>
                            <input type="number" id="sharevalue" name="sharevalue" step="0.01" required>
                        </div>
                        <div class="form-actions">
                            <button type="submit" class="btn btn--primary">Set Value</button>
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