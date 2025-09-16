<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page  import="java.sql.*" import="databaseconnection.*"%>
<%
String pass=null,uid=null;

String username = request.getParameter("username");
String password = request.getParameter("password");

Connection con1 = null;
PreparedStatement ps1 = null;
ResultSet rs1 = null;
try
{
    con1 = databasecon.getconnection();
    String sql = "select * from stock where username = ? and password = ?";
    ps1 = con1.prepareStatement(sql);
    ps1.setString(1, username);
    ps1.setString(2, password);
    rs1 = ps1.executeQuery();
    if(rs1.next())
    {
        session.setAttribute("username", username);
%>
    <script type="text/javascript">
        window.alert("Stock Login Sucess");
        window.location="StockHome.jsp";
    </script>
<%
    }
    else
    {
        response.sendRedirect("Stock.jsp?message=fail");
    }
}
catch(Exception e1)
{
    out.println(e1.getMessage());
} finally {
    if (rs1 != null) try { rs1.close(); } catch (SQLException e) {}
    if (ps1 != null) try { ps1.close(); } catch (SQLException e) {}
    if (con1 != null) try { con1.close(); } catch (SQLException e) {}
}
%>
