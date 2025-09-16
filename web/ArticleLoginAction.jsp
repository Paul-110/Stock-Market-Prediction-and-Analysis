<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="databaseconnection.databasecon" %>
<%String articlename=request.getParameter("articlename");
String password=request.getParameter("password");
Connection con = null;
PreparedStatement ps = null;
ResultSet rs = null;
try{
    con = databasecon.getconnection();
    String sql = "select * from articlereg where articlename = ? and password = ?";
    ps = con.prepareStatement(sql);
    ps.setString(1, articlename);
    ps.setString(2, password);
    rs = ps.executeQuery();
    if(rs.next()){
        session.setAttribute("articlename",articlename);
%>
        <script type="text/javascript">
            window.alert("Login Success");
            window.location="ArticleHome.jsp";
        </script>
<%  } else { %>
        <script type="text/javascript">
            window.alert("Login Failed");
            window.location="ArticalsLogin.jsp";
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
