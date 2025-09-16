
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="databaseconnection.databasecon" %>
<%@page import="java.sql.*"%>
<%String fullname=request.getParameter("fullname"); 
String email=request.getParameter("email");
String aadhar=request.getParameter("aadhar");
String panno=request.getParameter("panno");
String mobile=request.getParameter("mobile");
String address=request.getParameter("address");
String username=request.getParameter("username");
String password=request.getParameter("password");

Connection con = null;
PreparedStatement psCheck = null;
PreparedStatement psInsert = null;
ResultSet rs = null;
try{
    con = databasecon.getconnection();
    String checkSql = "select count(*) from userreg where username = ? or emailid = ?";
    psCheck = con.prepareStatement(checkSql);
    psCheck.setString(1, username);
    psCheck.setString(2, email);
    rs = psCheck.executeQuery();
    
    if(rs.next()){
        int count = rs.getInt(1);
        if(count == 0){
            String insertSql = "insert into userreg values(?, ?, ?, ?, ?, ?, ?, ?, 'waiting')";
            psInsert = con.prepareStatement(insertSql);
            psInsert.setString(1, fullname);
            psInsert.setString(2, email);
            psInsert.setString(3, aadhar);
            psInsert.setString(4, panno);
            psInsert.setString(5, mobile);
            psInsert.setString(6, address);
            psInsert.setString(7, username);
            psInsert.setString(8, password);
            
            int i = psInsert.executeUpdate();
            if(i > 0){
%>
                <script type="text/javascript">
                    window.alert("You were successfully registered.");
                    window.location="UserLogin.jsp";
                </script>
<%          } else { %>
                <script type="text/javascript">
                    window.alert("Registration Failed");
                    window.location="UserRegister.jsp";
                </script>
<%          }
        } else { %>
            <script type="text/javascript">
                window.alert("Sorry, this username or email is already registered.");
                window.location="UserRegister.jsp";
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
