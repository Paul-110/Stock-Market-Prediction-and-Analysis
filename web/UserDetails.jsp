<!DOCTYPE html>
<html lang="en">
<head>
<title>User Details</title>
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
                        <li class="nav-item"><a href="CompanyDetails.jsp" class="nav-link"><img src="images/company.png" alt="Company" class="nav-icon-img"/><span>Company Details</span></a></li>
                        <li class="nav-item active"><a href="UserDetails.jsp" class="nav-link"><img src="images/user.png" alt="User" class="nav-icon-img"/><span>User Details</span></a></li>
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
                    <h2>Manage User Details</h2>
                </div>
            </div>
            <div class="container">
                <div class="table-container">
                    <table id="userTable" class="modern-table clickable-rows">
                        <thead>
                            <tr>
                                <th>Name</th>
                                <th>Email ID</th>
                                <th>Aadhar No</th>
                                <th>Pan No</th>
                                <th>Mobile</th>
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
                                    String sql = "select * from userreg";
                                    ps = con.prepareStatement(sql);
                                    rs = ps.executeQuery();
                                    while(rs.next()){
                                        String status = rs.getString("status");
                            %>
                                        <tr
                                            data-name="<%=rs.getString(1)%>"
                                            data-email="<%=rs.getString(2)%>"
                                            data-aadhar="<%=rs.getString(3)%>"
                                            data-pan="<%=rs.getString(4)%>"
                                            data-mobile="<%=rs.getString(5)%>"
                                            data-address="<%=rs.getString(6)%>"
                                        >
                                            <td><%=rs.getString(1)%></td>
                                            <td><%=rs.getString(2)%></td>
                                            <td><%=rs.getString(3)%></td>
                                            <td><%=rs.getString(4)%></td>
                                            <td><%=rs.getString(5)%></td>
                                            <td><%=rs.getString(6)%></td>
                                            <%if(status.equals("waiting")){%>
                                                <td onclick="event.stopPropagation();"><a href="#" onclick="confirmAccept(event, '<%=rs.getString(1)%>')" class="btn btn--primary">Accept User</a></td>
                                            <%} else {%>
                                                <td style="color: green; font-weight: bold;"><%=status%></td>
                                            <%}%>
                                        </tr>
                            <%
                                    }
                                } catch(Exception e) {
                                    out.println("<tr><td colspan='7'>Error: " + e.getMessage() + "</td></tr>");
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

<!-- User Details Modal Structure -->
<div id="userDetailsModal" class="modal-overlay">
    <div class="modal-content">
        <div class="modal-header">
            <h3 id="modalUserName">User Details</h3>
            <button class="close-button">&times;</button>
        </div>
        <div class="modal-body">
            <p><strong>Email:</strong> <span id="modalUserEmail"></span></p>
            <p><strong>Aadhar No:</strong> <span id="modalUserAadhar"></span></p>
            <p><strong>PAN No:</strong> <span id="modalUserPan"></span></p>
            <p><strong>Mobile:</strong> <span id="modalUserMobile"></span></p>
            <p><strong>Address:</strong> <span id="modalUserAddress"></span></p>
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
    function confirmAccept(event, username) {
        event.preventDefault(); // Prevent the default link behavior
        if (confirm("Are you sure you want to accept the user '" + username + "'?")) {
            window.location.href = "AcceptUser.jsp?username=" + username;
        }
    }

    $(document).ready( function () {
        $('#userTable').DataTable({
            dom: 'Bfrtip',
            buttons: [
                'csvHtml5'
            ]
        });

        // Modal functionality
        const modal = $('#userDetailsModal');
        const closeModalButton = modal.find('.close-button');

        // Open modal on row click
        $('#userTable tbody').on('click', 'tr', function () {
            const row = $(this);
            // Populate modal
            $('#modalUserName').text(row.data('name'));
            $('#modalUserEmail').text(row.data('email'));
            $('#modalUserAadhar').text(row.data('aadhar'));
            $('#modalUserPan').text(row.data('pan'));
            $('#modalUserMobile').text(row.data('mobile'));
            $('#modalUserAddress').text(row.data('address'));

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