<% String articlename=(String)session.getAttribute("articlename");%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Company Details</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" type="image/png" href="images/favicon.png">
<link rel="stylesheet" href="style.css">
<!-- DataTables CSS -->
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/buttons/2.2.2/css/buttons.dataTables.min.css">
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
                        <li class="nav-item"><a href="ArticleHome.jsp" class="nav-link"><img src="images/home.png" alt="Home" class="nav-icon-img"><span>Home</span></a></li>
                        <li class="nav-item"><a href="PublishArticle.jsp" class="nav-link"><img src="images/publish.png" alt="Publish" class="nav-icon-img"><span>Publish Article</span></a></li>
                        <li class="nav-item active"><a href="ViewCompanyDetails.jsp" class="nav-link"><img src="images/company.png" alt="Company" class="nav-icon-img"><span>Company Details</span></a></li>
                        <li class="nav-item"><a href="PublishedArticles.jsp" class="nav-link"><img src="images/published.png" alt="Published" class="nav-icon-img"><span>Published</span></a></li>
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
                    <h2>Company Details</h2>
                </div>
            </div>
            <div class="container">
                <div class="table-container">
                    <table id="companyDetailsTable" class="modern-table">
                        <thead>
                            <tr>
                                <th>Company Name</th>
                                <th>Company ID</th>
                                <th>Company Type</th>
                                <th>Address</th>
                                <th>Branches</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%@page import="java.sql.*" %>
                            <%@page import="databaseconnection.databasecon" %>
                            <%
                                Connection con = null;
                                PreparedStatement ps = null;
                                ResultSet rs = null;
                                try {
                                    con = databasecon.getconnection();
                                    String sql = "select * from comregister where status='activated'";
                                    ps = con.prepareStatement(sql);
                                    rs = ps.executeQuery();
                                    while (rs.next()) {
                            %>
                                    <tr>
                                        <td><%=rs.getString(1)%></td>
                                        <td><%=rs.getString(2)%></td>
                                        <td><%=rs.getString(4)%></td>
                                        <td><%=rs.getString(5)%></td>
                                        <td><%=rs.getString(7)%></td>
                                    </tr>
                            <%
                                    }
                                } catch (Exception e) {
                                    out.println("<tr><td colspan='5'>Error: " + e.getMessage() + "</td></tr>");
                                } finally {
                                    if(rs != null) rs.close();
                                    if(ps != null) ps.close();
                                    if(con != null) con.close();
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
<!-- jQuery and DataTables JS -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/buttons/2.2.2/js/dataTables.buttons.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/buttons/2.2.2/js/buttons.html5.min.js"></script>
<script>
    $(document).ready( function () {
        $('#companyDetailsTable').DataTable({
            dom: 'Bfrtip',
            buttons: [
                'csvHtml5'
            ]
        });
    } );
</script>
</body>
</html>