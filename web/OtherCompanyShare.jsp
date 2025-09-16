<%String companyname=(String)session.getAttribute("companyname");%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>other company shares</title>
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
                        <li class="nav-item"><a href="CompanyHome.jsp" class="nav-link"><img src="images/home.png" alt="Home" class="nav-icon-img"/><span>Home</span></a></li>
                        <li class="nav-item"><a href="ShareHolders.jsp" class="nav-link"><img src="images/shareholders.png" alt="Shareholders" class="nav-icon-img"/><span>Shareholders</span></a></li>
                        <li class="nav-item active"><a href="OtherCompanyShare.jsp" class="nav-link"><img src="images/stock.png" alt="Shares" class="nav-icon-img"/><span>Other Shares</span></a></li>
                    </ul>
                </nav>
                <div class="logout-link">
                     <a href="CompanyLogin.jsp" class="btn btn--secondary">Logout</a>
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
                    <h2>Other Company Share Details</h2>
                </div>
            </div>
            <div class="container">
                <div class="table-container">
                    <table id="otherSharesTable" class="modern-table">
                        <thead>
                            <tr>
                                <th>Company Name</th>
                                <th>Share Value</th>
                                <th>Total Shares</th>
                                <th>Available Shares</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%@page import="databaseconnection.databasecon" %>
                            <%@page import="java.sql.*"%>
                            <%
                                Connection con = null;
                                PreparedStatement ps = null;
                                ResultSet rs = null;
                                try {
                                    con = databasecon.getconnection();
                                    String sql = "select * from comregister where companyname != ? and status='activated'";
                                    ps = con.prepareStatement(sql);
                                    ps.setString(1, companyname);
                                    rs = ps.executeQuery();
                                    while(rs.next()){
                            %>
                                        <tr>
                                            <td><%=rs.getString(1)%></td>
                                            <td><%=rs.getString(13)%></td>
                                            <td><%=rs.getString(12)%></td>
                                            <td><%=rs.getString(14)%></td>
                                        </tr>
                            <%
                                    }
                                } catch(Exception e) {
                                    out.println("<tr><td colspan='4'>Error: " + e.getMessage() + "</td></tr>");
                                } finally {
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
<!-- jQuery and DataTables JS -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/buttons/2.2.2/js/dataTables.buttons.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/buttons/2.2.2/js/buttons.html5.min.js"></script>
<script>
    $(document).ready( function () {
        $('#otherSharesTable').DataTable({
            dom: 'Bfrtip',
            buttons: [
                'csvHtml5'
            ]
        });
    } );
</script>
</body>
</html>
