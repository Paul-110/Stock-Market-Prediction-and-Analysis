<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="databaseconnection.databasecon" %>
<%String artclename=request.getParameter("artclename");
    String company=request.getParameter("company");
String description=request.getParameter("description");
String status=request.getParameter("status");
String quality=request.getParameter("quality");
String id=request.getParameter("id");%>
<%
    Connection con = null;
    PreparedStatement ps = null;
    try {
        con = databasecon.getconnection();
        String sql = "insert into publish values(?, ?, ?, ?, ?, '0', '0', '0', ?, now())";
        ps = con.prepareStatement(sql);
        ps.setString(1, artclename);
        ps.setString(2, company);
        ps.setString(3, description);
        ps.setString(4, status);
        ps.setString(5, quality);
        ps.setString(6, id);

        int i = ps.executeUpdate();
        if (i > 0) {
%>
      <script type="text/javascript">
          window.alert("Article Published");
          window.location="PublishArticle.jsp";
          </script>
   <%}else{
%>
      <script type="text/javascript">
          window.alert("Article Publish Failed");
          window.location="PublishArticle.jsp";
          </script>
   <%
        }
    } catch (Exception e) {
        out.println(e);
    } finally {
        if (ps != null) try { ps.close(); } catch (SQLException e) {}
        if (con != null) try { con.close(); } catch (SQLException e) {}
    }
%>