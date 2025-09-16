
<%String username=(String)session.getAttribute("username");%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Sentiment Analysis</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" type="image/png" href="images/favicon.png">
<link rel="stylesheet" href="style.css">
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
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
                    <h2>Sentiment Analysis</h2>
                </div>
            </div>
            <div class="container">
                <div class="table-container" style="margin-bottom: 2rem; animation-delay: 0.2s;">
                    <canvas id="sentimentChart"></canvas>
                </div>
            </div>
            <div class="container">
                <div class="table-container">
                    <h3 style="margin-bottom: 1rem;">Welcome, <%=username%>! Here is the latest sentiment analysis from published articles.</h3>
                    <table class="modern-table">
                        <thead>
                            <tr>
                                <th>Company Name</th>
                                <th>Published By</th>
                                <th style="color: green;">Positive</th>
                                <th style="color: red;">Negative</th>
                                <th style="color: grey;">Neutral</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%@page import="databaseconnection.databasecon" %>
                             <%@page import="java.sql.*"%>
                             <%@page import="java.util.List, java.util.ArrayList"%>
                            <%
                                List<String> companyNames = new ArrayList<>();
                                List<String> positiveScores = new ArrayList<>();
                                List<String> negativeScores = new ArrayList<>();
                                List<String> neutralScores = new ArrayList<>();
                                Connection con = null;
                                PreparedStatement ps = null;
                                ResultSet rs = null;
                                try {
                                    con = databasecon.getconnection();
                                    // Using PreparedStatement for security and best practices.
                                    String sql = "select * from publish";
                                    ps = con.prepareStatement(sql);
                                    rs = ps.executeQuery();
                                    while (rs.next()) {
                                        // Escape double quotes in company name to prevent JS errors
                                        String companyNameForJs = rs.getString(2).replace("\"", "\\\"");
                                        String positive = rs.getString(6);
                                        String negative = rs.getString(7);
                                        String neutral = rs.getString(8);
                                        companyNames.add(companyNameForJs);
                                        positiveScores.add(positive);
                                        negativeScores.add(negative);
                                        neutralScores.add(neutral);
                            %>
                                     <tr>
                                         <td><%=rs.getString(2)%></td>
                                         <td><%=rs.getString(1)%></td>
                                         <td><%=positive%></td>
                                         <td><%=negative%></td>
                                         <td><%=neutral%></td>
                                     </tr>
                            <%
                                    }
                                } catch (Exception e) {
                                    out.println("<tr><td colspan='5'>Error loading data: " + e.getMessage() + "</td></tr>");
                                } finally {
                                    // Always close database resources to prevent leaks
                                    if (rs != null) try { rs.close(); } catch (SQLException e) {}
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
<script>
    const labels = [<% for(int i=0; i<companyNames.size(); i++) { out.print("\"" + companyNames.get(i) + "\""); if(i < companyNames.size() - 1) out.print(","); } %>];
    const positiveData = [<% for(int i=0; i<positiveScores.size(); i++) { out.print(positiveScores.get(i)); if(i < positiveScores.size() - 1) out.print(","); } %>];
    const negativeData = [<% for(int i=0; i<negativeScores.size(); i++) { out.print(negativeScores.get(i)); if(i < negativeScores.size() - 1) out.print(","); } %>];
    const neutralData = [<% for(int i=0; i<neutralScores.size(); i++) { out.print(neutralScores.get(i)); if(i < neutralScores.size() - 1) out.print(","); } %>];

    const data = {
        labels: labels,
        datasets: [
            {
                label: 'Positive',
                data: positiveData,
                backgroundColor: 'rgba(40, 167, 69, 0.6)',
                borderColor: 'rgba(40, 167, 69, 1)',
                borderWidth: 1
            },
            {
                label: 'Negative',
                data: negativeData,
                backgroundColor: 'rgba(220, 53, 69, 0.6)',
                borderColor: 'rgba(220, 53, 69, 1)',
                borderWidth: 1
            },
            {
                label: 'Neutral',
                data: neutralData,
                backgroundColor: 'rgba(108, 117, 125, 0.6)',
                borderColor: 'rgba(108, 117, 125, 1)',
                borderWidth: 1
            }
        ]
    };

    const config = {
        type: 'bar',
        data: data,
        options: {
            responsive: true,
            plugins: {
                legend: {
                    position: 'top',
                },
                title: {
                    display: true,
                    text: 'Company Sentiment Analysis'
                }
            },
            scales: {
                y: {
                    beginAtZero: true,
                    title: { display: true, text: 'Sentiment Score' }
                }
            }
        },
    };

    const sentimentChart = new Chart(document.getElementById('sentimentChart'), config);
</script>
</body>
</html>
