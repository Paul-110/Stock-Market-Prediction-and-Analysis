<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="databaseconnection.databasecon" %>
<%String articlename=request.getParameter("articlename");
    String companyname=request.getParameter("companyname");
String companyid=request.getParameter("companyid");
String opinion=request.getParameter("opinion");
String comment=request.getParameter("comment");

Connection con = null;
PreparedStatement psInsert = null;
PreparedStatement psSelect = null;
PreparedStatement psUpdate = null;
ResultSet rs = null;
%>
<%
try{
    con = databasecon.getconnection();
    String insertSql = "insert into comment values(?, ?, ?, ?, ?, now())";
    psInsert = con.prepareStatement(insertSql);
    psInsert.setString(1, articlename);
    psInsert.setString(2, companyname);
    psInsert.setString(3, companyid);
    psInsert.setString(4, opinion);
    psInsert.setString(5, comment);

    int i = psInsert.executeUpdate();
    if(i > 0){ 
        String updateColumn = "";
        if ("positive".equals(opinion)) {
            updateColumn = "positive = positive + 1";
        } else if ("negative".equals(opinion)) {
            updateColumn = "negative = negative + 1";
        } else if ("neutral".equals(opinion)) {
            updateColumn = "nutral = nutral + 1";
        }

        if (!updateColumn.isEmpty()) {
            String updateSql = "update publish set " + updateColumn + " where companyname = ? and publishedby = ?";
            psUpdate = con.prepareStatement(updateSql);
            psUpdate.setString(1, companyname);
            psUpdate.setString(2, articlename);
            psUpdate.executeUpdate();
        }

        session.setAttribute("companyname", companyname);
%>
        <script type="text/javascript">
            window.alert("Thank You for your comment!");
            window.location="ViewArticle.jsp?company=<%=companyname%>";
        </script>
<%  } else {
        session.setAttribute("companyname", companyname);
%>
        <script type="text/javascript">
            window.alert("Failed to submit comment.");
            window.location="ViewArticle.jsp?company=<%=companyname%>";
        </script>
<%
    }
}catch(Exception e){
    out.println(e);
} finally {
    if (rs != null) try { rs.close(); } catch (SQLException e) {}
    if (psInsert != null) try { psInsert.close(); } catch (SQLException e) {}
    if (psSelect != null) try { psSelect.close(); } catch (SQLException e) {}
    if (psUpdate != null) try { psUpdate.close(); } catch (SQLException e) {}
    if (con != null) try { con.close(); } catch (SQLException e) {}
}
%>