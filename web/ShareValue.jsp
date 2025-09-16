<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="databaseconnection.databasecon" %>
<%@page import="java.sql.*"%>
<%
    Connection con = null;
    PreparedStatement ps = null;
    try {
        String companyname = request.getParameter("companyname");
        String id = request.getParameter("id");
        String shares = request.getParameter("shares");
        String sharevalue = request.getParameter("sharevalue");
        
        con = databasecon.getconnection();
        String sql = "update comregister set status='activated', shares=?, sharevalue=?, availableshares=? where companyname=? and companyid=?";
        ps = con.prepareStatement(sql);
        ps.setString(1, shares);
        ps.setString(2, sharevalue);
        ps.setString(3, shares); // Initially, all shares are available
        ps.setString(4, companyname);
        ps.setString(5, id);
        
        int i = ps.executeUpdate();
        if (i > 0) {
            response.sendRedirect("CompanyDetails.jsp");
        } else {
            response.sendRedirect("CompanyDetails.jsp?error=update_failed");
        }
    } catch (Exception e) {
        out.println(e);
    } finally {
        if (ps != null) try { ps.close(); } catch (SQLException e) {}
        if (con != null) try { con.close(); } catch (SQLException e) {}
    }
}
%>