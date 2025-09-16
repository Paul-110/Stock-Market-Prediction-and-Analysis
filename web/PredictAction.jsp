<%@page import="databaseconnection.databasecon" %>
<%@page import="java.sql.*"%>
<%
    String company = request.getParameter("companyname");
    Connection con = null;
    PreparedStatement ps1 = null;
    ResultSet rs1 = null;
    PreparedStatement ps2 = null;
    ResultSet rs2 = null;

    try {
        con = databasecon.getconnection();
        
        // First query to get share value
        String sql1 = "select * from comregister where companyname = ?";
        ps1 = con.prepareStatement(sql1);
        ps1.setString(1, company);
        rs1 = ps1.executeQuery();

        if (rs1.next()) {
            double sharevalue = rs1.getDouble("sharevalue");

            // Second query to get sentiment data
            String sql2 = "select * from publish where companyname = ?";
            ps2 = con.prepareStatement(sql2);
            ps2.setString(1, company);
            rs2 = ps2.executeQuery();

            if (rs2.next()) {
                double a1 = Double.parseDouble(rs2.getString("positive"));
                double a2 = Double.parseDouble(rs2.getString("negative"));
                double a3 = Double.parseDouble(rs2.getString("nutral"));
                String status = rs2.getString("status");
                double quality = Double.parseDouble(rs2.getString("quality"));
                double value = sharevalue / 100 * quality;

                if (a1 > a2 && a1 > a3) { // Positive is dominant
                    session.setAttribute("a1", a1);
                    session.setAttribute("value", value);
                    if (status.equals("positive")) {
                        response.sendRedirect("PredictAnsw.jsp");
                    } else {
                        response.sendRedirect("PredictAns.jsp");
                    }
                } else if (a2 > a1 && a2 > a3) { // Negative is dominant
                    session.setAttribute("a2", a2);
                    session.setAttribute("value", value);
                    if (status.equals("negative")) {
                        response.sendRedirect("PredictAnsw1.jsp");
                    } else {
                        response.sendRedirect("PredictAns1.jsp");
                    }
                } else { // Neutral is dominant or scores are equal
                    session.setAttribute("a3", a3);
                    session.setAttribute("value", value);
                    if (status.equals("neutral")) {
                        response.sendRedirect("PredictAnsw2.jsp");
                    } else {
                        response.sendRedirect("PredictAns2.jsp");
                    }
                }
            } else {
                // Handle case where no sentiment data is found
                response.sendRedirect("Predict.jsp?error=no_sentiment_data");
            }
        } else {
            // Handle case where no company data is found
            response.sendRedirect("Predict.jsp?error=no_company_data");
        }
    } catch (Exception e) {
        out.println(e);
    } finally {
        // Close all resources
        if (rs1 != null) try { rs1.close(); } catch (SQLException e) {}
        if (ps1 != null) try { ps1.close(); } catch (SQLException e) {}
        if (rs2 != null) try { rs2.close(); } catch (SQLException e) {}
        if (ps2 != null) try { ps2.close(); } catch (SQLException e) {}
        if (con != null) try { con.close(); } catch (SQLException e) {}
    }
%>
