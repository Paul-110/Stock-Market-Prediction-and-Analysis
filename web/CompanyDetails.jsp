<!DOCTYPE html>
<html lang="en">
<head>
<title>Company Details</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" type="image/png" href="images/favicon.png">
<link rel="stylesheet" href="style.css">
<!-- DataTables CSS -->
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.css">
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
                    <h2>Manage Company Details</h2>
                </div>
            </div>
            <div class="container">
                <div class="table-container">
                    <table id="companyTable" class="modern-table clickable-rows">
                        <thead>
                            <tr>
                                <th>Company Name</th>
                                <th>Company ID</th>
                                <th>Company Type</th>
                                <th>TurnOver</th>
                                <th>Address</th>
                                <th>Status</th>
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
                                        String status = rs.getString("status");
                            %>
                                        <tr 
                                            data-product="<%=rs.getString("product")%>"
                                            data-employees="<%=rs.getString("employees")%>"
                                            data-branches="<%=rs.getString("branches")%>"
                                            data-shares="<%=rs.getString("shares")%>"
                                            data-sharevalue="<%=rs.getString("sharevalue")%>"
                                            data-availableshares="<%=rs.getString("availableshares")%>"
                                            data-companyname="<%=rs.getString(1)%>"
                                        >
                                            <td><%=rs.getString(1)%></td>
                                            <td><%=rs.getString(2)%></td>
                                            <td><%=rs.getString(4)%></td>
                                            <td><%=rs.getString(8)%></td>
                                            <td><%=rs.getString(5)%></td>
                                            <%if(status.equals("waiting")){%>
                                                <td onclick="event.stopPropagation();"><a href="#" onclick="confirmDivide(event, '<%=rs.getString(1)%>', '<%=rs.getString(2)%>')" class="btn btn--primary">Divide Share</a></td>
                                            <%} else {%>
                                                <td style="color: green; font-weight: bold;"><%=status%></td>
                                            <%}%>
                                        </tr>
                            <%
                                    }
                                } catch(Exception e) {
                                    out.println("<tr><td colspan='6'>Error: " + e.getMessage() + "</td></tr>");
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

<!-- Modal Structure -->
<div id="detailsModal" class="modal-overlay">
    <div class="modal-content">
        <div class="modal-header">
            <h3 id="modalCompanyName">Company Details</h3>
            <button class="close-button">&times;</button>
        </div>
        <div class="modal-body">
            <p><strong>Product:</strong> <span id="modalProduct"></span></p>
            <p><strong>Employees:</strong> <span id="modalEmployees"></span></p>
            <p><strong>Branches:</strong> <span id="modalBranches"></span></p>
            <p><strong>Total Shares:</strong> <span id="modalShares"></span></p>
            <p><strong>Share Value:</strong> <span id="modalShareValue"></span></p>
            <p><strong>Available Shares:</strong> <span id="modalAvailableShares"></span></p>
        </div>
    </div>
</div>

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
    function confirmDivide(event, companyname, id) {
        event.preventDefault(); // Prevent the default link behavior
        if (confirm("Are you sure you want to set the share value for '" + companyname + "'?")) {
            window.location.href = "DecideShareValue.jsp?companyname=" + companyname + "&id=" + id;
        }
    }

    $(document).ready( function () {
        var table = $('#companyTable').DataTable({
            dom: 'Bfrtip',
            buttons: [
                'csvHtml5'
            ]
        });

        // Modal functionality
        const modal = $('#detailsModal');
        const closeModalButton = $('.close-button');

        // Open modal on row click
        $('#companyTable tbody').on('click', 'tr', function () {
            const row = $(this);
            // Populate modal
            $('#modalCompanyName').text(row.data('companyname'));
            $('#modalProduct').text(row.data('product'));
            $('#modalEmployees').text(row.data('employees'));
            $('#modalBranches').text(row.data('branches'));
            $('#modalShares').text(row.data('shares'));
            $('#modalShareValue').text('₹' + row.data('sharevalue'));
            $('#modalAvailableShares').text(row.data('availableshares'));

            modal.addClass('active');
        });

        // Close modal function
        function closeModal() {
            modal.removeClass('active');
        }

        // Event listeners for closing the modal
        closeModalButton.on('click', closeModal);
        modal.on('click', function(event) {
            if ($(event.target).is(modal)) {
                closeModal();
            }
        });
    } );
</script>
</body>
</html>