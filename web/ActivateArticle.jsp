
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="databaseconnection.databasecon" %>
<%@page import="java.sql.*"%>
<%
try{
    String articlename=request.getParameter("articlename");
    Connection con=databasecon.getconnection();
    Statement st=con.createStatement();
    int i=st.executeUpdate("update articlereg set status='activated' where articlename='"+articlename+"'");
    if(i>0){
        response.sendRedirect("ArticalsDetails.jsp");
    Connection con = null;
    PreparedStatement ps = null;
    try {
        String articlename = request.getParameter("articlename");
        con = databasecon.getconnection();
        String sql = "update articlereg set status='activated' where articlename = ?";
        ps = con.prepareStatement(sql);
        ps.setString(1, articlename);
        int i = ps.executeUpdate();
        if (i > 0) {
            response.sendRedirect("ArticalsDetails.jsp");
        } else {
%>
            <script>
                alert("Failed to activate article publisher.");
                window.location = "ArticalsDetails.jsp";
            </script>
<%
        }
    } catch (Exception e) {
        out.println(e);
    } finally {
        if (ps != null) try { ps.close(); } catch (SQLException e) {}
        if (con != null) try { con.close(); } catch (SQLException e) {}
    }
}catch(Exception e){
    out.println(e);
}
%>