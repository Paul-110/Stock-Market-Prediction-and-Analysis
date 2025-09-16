<%String username=(String)session.getAttribute("username");%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Predict Stock Performance</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" type="image/png" href="images/favicon.png">
<link rel="stylesheet" href="style.css?v=1.3">
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
                    <h2>Predict Stock Performance</h2>
                </div>
            </div>
            <div class="container">
                 <div class="table-container">
                    <h3 style="margin-bottom: 1rem;">Welcome, <%=username%>! Select a holding to run a prediction.</h3>
                    <table class="modern-table">
                        <thead>
                            <tr>
                                <th>Company Name</th>
                                <th>Company Id</th>  
                                <th>Company Total Shares</th> 
                                <th>Your Purchased Shares</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%@page import="databaseconnection.databasecon" %>
                            <%@page import="java.sql.*"%>
                            <%
                                Connection con = null;
                                PreparedStatement ps = null;
                                ResultSet r = null;
                                try {
                                    con = databasecon.getconnection();
                                    String sql = "select * from purchaseshare where buyer = ?";
                                    ps = con.prepareStatement(sql);
                                    ps.setString(1, username);
                                    r = ps.executeQuery();
                                    while(r.next()){
                            %>
                                     <tr>
                                         <td><%=r.getString(2)%></td>
                                         <td><%=r.getString(3)%></td>
                                         <td><%=r.getString(4)%></td>
                                         <td><%=r.getString(5)%></td>
                                         <td><a class="btn btn--primary" href="PredictAction.jsp?companyname=<%=r.getString(2)%>">Predict</a></td>
                                     </tr>
                            <%      }
                                } catch(Exception e) {
                                    out.println(e);  
                                } finally {
                                    if (r != null) try { r.close(); } catch (SQLException e) {}
                                    if (ps != null) try { ps.close(); } catch (SQLException e) {}
                                    if (con != null) try { con.close(); } catch (SQLException e) {}
                                }
                            %>
                        </tbody>
                    </table>	
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
