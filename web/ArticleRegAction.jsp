<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="databaseconnection.databasecon" %>
<%@page import="java.sql.*"%>
<%String articlename=request.getParameter("companyname");
String password=request.getParameter("password");
String articleid=request.getParameter("id");
String articletype=request.getParameter("type");
String address=request.getParameter("address");
String employees=request.getParameter("employees");
String branches=request.getParameter("branches");

Connection con = null;
PreparedStatement psCheck = null;
PreparedStatement psInsert = null;
ResultSet rs = null;
try{
    con = databasecon.getconnection();
    String checkSql = "select count(*) from articlereg where articlename = ? and articleid = ?";
    psCheck = con.prepareStatement(checkSql);
    psCheck.setString(1, articlename);
    psCheck.setString(2, articleid);
    rs = psCheck.executeQuery();
    
    if(rs.next()){
        int count = rs.getInt(1);
        if(count == 0){
            String insertSql = "insert into articlereg values(?, ?, ?, ?, ?, ?, ?, 'waiting')";
            psInsert = con.prepareStatement(insertSql);
            psInsert.setString(1, articlename);
            psInsert.setString(2, password);
            psInsert.setString(3, articleid);
            psInsert.setString(4, articletype);
            psInsert.setString(5, address);
            psInsert.setString(6, employees);
            psInsert.setString(7, branches);
            
            int i = psInsert.executeUpdate();
            if(i > 0){
%>
                <script type="text/javascript">
                    window.alert("Your Successfully Registered");
                    window.location="ArticalsLogin.jsp";
                </script>
<%          } else { %>
                <script type="text/javascript">
                    window.alert("Registration Failed");
                    window.location="ArtcleRegister.jsp";
                </script>
<%          }
        } else { %>
            <script type="text/javascript">
                window.alert("Sorry, this Article Name & ID is already registered.");
                window.location="ArtcleRegister.jsp";
            </script>
<%      }
    }
}catch(Exception e){
    out.println(e);    
} finally {
    if (rs != null) try { rs.close(); } catch (SQLException e) {}
    if (psCheck != null) try { psCheck.close(); } catch (SQLException e) {}
    if (psInsert != null) try { psInsert.close(); } catch (SQLException e) {}
    if (con != null) try { con.close(); } catch (SQLException e) {}
}
%>
