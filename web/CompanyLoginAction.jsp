<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="databaseconnection.databasecon" %>
<%String companyname=request.getParameter("companyname");
String username=request.getParameter("username");
String password=request.getParameter("password");
Connection con = null;
PreparedStatement ps = null;
ResultSet rs = null;
try{
    con = databasecon.getconnection();
    String sql = "select * from comregister where companyname = ? and username = ? and password = ? and status = 'activated'";
    ps = con.prepareStatement(sql);
    ps.setString(1, companyname);
    ps.setString(2, username);
    ps.setString(3, password);
    rs = ps.executeQuery();
    if(rs.next()){
        session.setAttribute("companyname",companyname);
%>
        <script type="text/javascript">
            window.alert("Login Success");
            window.location="CompanyHome.jsp";
        </script>
<%  } else { %>
        <script type="text/javascript">
            window.alert("Login Failed");
            window.location="CompanyLogin.jsp";
        </script>
<%
    }
}catch(Exception e){
    out.println(e);
} finally {
    if (rs != null) try { rs.close(); } catch (SQLException e) {}
    if (ps != null) try { ps.close(); } catch (SQLException e) {}
    if (con != null) try { con.close(); } catch (SQLException e) {}
}
%>
