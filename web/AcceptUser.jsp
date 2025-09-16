
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="databaseconnection.databasecon" %>
<%@page import="java.sql.*"%>
<%
try{
    String username=request.getParameter("username");
    Connection con=databasecon.getconnection();
    Statement st=con.createStatement();
    int i=st.executeUpdate("update userreg set status='activated' where username='"+username+"'");
    if(i>0){
        response.sendRedirect("UserDetails.jsp");
    Connection con = null;
    PreparedStatement ps = null;
    try {
        String username = request.getParameter("username");
        con = databasecon.getconnection();
        String sql = "update userreg set status='activated' where username = ?";
        ps = con.prepareStatement(sql);
        ps.setString(1, username);
        int i = ps.executeUpdate();
        if (i > 0) {
            response.sendRedirect("UserDetails.jsp");
        } else {
%>
            <script>
                alert("Failed to activate user.");
                window.location = "UserDetails.jsp";
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