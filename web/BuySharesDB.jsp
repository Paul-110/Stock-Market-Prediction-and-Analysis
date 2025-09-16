<%String username=(String)session.getAttribute("username");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="databaseconnection.databasecon" %>
<%@page import="java.sql.*"%>
<%
    String companyname = request.getParameter("company");
    String id = request.getParameter("id");
    Double usershares = Double.parseDouble(request.getParameter("usershare"));
    Double totalCompanyShares = Double.parseDouble(request.getParameter("shares"));

    Connection con = null;
    PreparedStatement psSelect = null;
    PreparedStatement psUpdate = null;
    PreparedStatement psInsert = null;
    ResultSet rs = null;

    String message = "";
    String messageType = "error"; // can be 'success' or 'error'

    try {
        con = databasecon.getconnection();
        con.setAutoCommit(false); // Start transaction

        // 1. Get current available shares from the database
        String selectSql = "SELECT availableshares FROM comregister WHERE companyname = ? AND companyid = ?";
        psSelect = con.prepareStatement(selectSql);
        psSelect.setString(1, companyname);
        psSelect.setString(2, id);
        rs = psSelect.executeQuery();

        if (rs.next()) {
            double currentAvailableShares = rs.getDouble("availableshares");

            // 2. Check if enough shares are available
            if (currentAvailableShares >= usershares) {
                double newAvailableShares = currentAvailableShares - usershares;

                // 3. Update the company's available shares
                String updateSql = "UPDATE comregister SET availableshares = ? WHERE companyname = ? AND companyid = ?";
                psUpdate = con.prepareStatement(updateSql);
                psUpdate.setDouble(1, newAvailableShares);
                psUpdate.setString(2, companyname);
                psUpdate.setString(3, id);
                int i = psUpdate.executeUpdate();

                // 4. Record the user's purchase
                String insertSql = "INSERT INTO purchaseshare VALUES(?, ?, ?, ?, ?)";
                psInsert = con.prepareStatement(insertSql);
                psInsert.setString(1, username);
                psInsert.setString(2, companyname);
                psInsert.setString(3, id);
                psInsert.setDouble(4, totalCompanyShares);
                psInsert.setDouble(5, usershares);
                int ii = psInsert.executeUpdate();

                if (i > 0 && ii > 0) {
                    con.commit(); // Finalize the transaction
                    message = "You have successfully purchased " + String.format("%.2f", usershares) + " shares of " + companyname + ".";
                    messageType = "success";
                } else {
                    con.rollback(); // Revert changes if any part failed
                    message = "Transaction failed. Please try again.";
                }
            } else {
                // Not enough shares available
                con.rollback();
                message = "Purchase failed. Only " + String.format("%.0f", currentAvailableShares) + " shares are available.";
            }
        } else {
            // Company not found
            con.rollback();
            message = "Could not find the specified company.";
        }
    } catch (Exception e) {
        if (con != null) {
            try { con.rollback(); } catch (SQLException ex) {}
        }
        message = "An error occurred during the transaction. Please try again.";
        // For debugging: out.println(e);
    } finally {
        // Close all resources
        if (rs != null) try { rs.close(); } catch (SQLException e) {}
        if (psSelect != null) try { psSelect.close(); } catch (SQLException e) {}
        if (psUpdate != null) try { psUpdate.close(); } catch (SQLException e) {}
        if (psInsert != null) try { psInsert.close(); } catch (SQLException e) {}
        if (con != null) try { con.close(); } catch (SQLException e) {}
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Purchase Status</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/png" href="images/favicon.png">
    <link rel="stylesheet" href="style.css">
</head>
<body id="page1">
    <div class="main">
        <header class="header">
            <div class="container">
                <div class="header-content">
                    <div class="logo">
                        <h1><a href="index.html">Stock Market Prediction And Analysis</a></h1>
                    </div>
                </div>
            </div>
        </header>
        <section id="content">
            <div class="page-header">
                <div class="container">
                    <h2>Purchase Status</h2>
                </div>
            </div>
            <div class="container">
                <div class="content-card" style="max-width: 600px; margin: 2rem auto; text-align: center;">
                    <% if ("success".equals(messageType)) { %>
                        <div class="card-icon"><img src="images/positive.png" alt="Success" class="card-icon-img"/></div>
                        <h3 style="color: #28a745;">Success!</h3>
                    <% } else { %>
                        <div class="card-icon"><img src="images/negative.png" alt="Error" class="card-icon-img"/></div>
                        <h3 style="color: #dc3545;">Error</h3>
                    <% } %>
                    <p style="font-size: 1.2rem; margin: 1rem 0;"><%= message %></p>
                    <a href="ViewCompanies.jsp" class="btn btn--primary" style="margin-top: 1rem;">Back to Companies</a>
                </div>
            </div>
        </section>
        <footer class="footer">
            <div class="container">
                <div class="footer-content">
                    <p>&copy; 2024 Stock Market Prediction And Analysis. All rights reserved.</p>
                    <p>Designed with modern web technologies for financial excellence</p>
                </div>
            </div>
        </footer>
    </div>
    <script src="app.js"></script>
</body>
</html>