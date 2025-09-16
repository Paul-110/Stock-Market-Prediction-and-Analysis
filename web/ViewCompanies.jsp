<%String username=(String)session.getAttribute("username");%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>View Companies</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" type="image/png" href="images/favicon.png">
<link rel="stylesheet" href="style.css?v=1.4">
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
                    <h2>View Companies</h2>
                </div>
            </div>
            <div class="container">
                <div class="table-container">
                    <table id="companiesTable" class="modern-table">
                        <thead>
                            <tr>
                                <th>Company Name</th>
                                <th>Company Id</th>
                                <th>Product</th>
                                <th>Type</th>
                                <th>Address</th>
                                <th>Employees</th>
                                <th>Branches</th>
                                <th>Total Shares</th>
                                <th>Available Shares</th>
                                <th>Share Value</th>
                                <th>Buy</th>
                                <th>Article</th>
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
                                    String sql = "select * from comregister";
                                    ps = con.prepareStatement(sql);
                                    rs = ps.executeQuery();
                                    while(rs.next()){
                            %>
                                     <tr>
                                         <td><%=rs.getString(1)%></td>
                                         <td><%=rs.getString(2)%></td>
                                         <td><%=rs.getString(3)%></td>
                                         <td><%=rs.getString(4)%></td>
                                         <td><%=rs.getString(5)%></td>
                                         <td><%=rs.getString(6)%></td>
                                         <td><%=rs.getString(11)%></td>
                                         <td><%=rs.getString(12)%></td>
                                         <td><%=rs.getString(14)%></td>
                                         <td><%=rs.getString(13)%></td>
                                         <td><a href="BuyShare.jsp?companyid=<%=rs.getString("companyid")%>&companyname=<%=rs.getString(1)%>&shares=<%=rs.getString(12)%>&sharevalue=<%=rs.getString(13)%>&availableshare=<%=rs.getString(14)%>" class="btn btn--primary">Buy</a></td>
                                         <td><a href="ViewArticle.jsp?company=<%=rs.getString(1)%>&id=<%=rs.getString("companyid")%>" class="btn btn--secondary">View</a></td>
                                     </tr>
                            <%      }
                                } catch(Exception e) {
                                    out.println(e);  
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
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/buttons/2.2.2/js/buttons.html5.min.js"></script>
<script>
    $(document).ready( function () {
        $('#companiesTable').DataTable({
            dom: 'Bfrtip',
            buttons: ['csvHtml5', 'pdfHtml5']
        });
    } );
</script>
</body>
</html>
