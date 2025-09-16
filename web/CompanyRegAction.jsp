<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="databaseconnection.databasecon" %>
<%@page import="java.sql.*"%>
<%String companyname=request.getParameter("companyname"); 
String companyid=request.getParameter("companyid");
String product=request.getParameter("product");
String companytype=request.getParameter("companytype");
String companyaddress=request.getParameter("companyaddress");
String employees=request.getParameter("employees");
String branches=request.getParameter("branches");
Double turnover=Double.parseDouble(request.getParameter("turnover"));
String username=request.getParameter("username");
String password=request.getParameter("password");

Connection con = null;
PreparedStatement psCheck = null;
PreparedStatement psInsert = null;
ResultSet rs = null;
try{
    con = databasecon.getconnection();
    String checkSql = "select count(*) from comregister where companyname = ? and companyid = ?";
    psCheck = con.prepareStatement(checkSql);
    psCheck.setString(1, companyname);
    psCheck.setString(2, companyid);
    rs = psCheck.executeQuery();
    
    if(rs.next()){
        int count = rs.getInt(1);
        if(count == 0){
            String insertSql = "insert into comregister (companyname, companyid, product, companytype, companyaddress, employees, branches, turnover, username, password, status, shares, sharevalue, availableshares) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 'waiting', '0', '0', '0')";
            psInsert = con.prepareStatement(insertSql);
            psInsert.setString(1, companyname);
            psInsert.setString(2, companyid);
            psInsert.setString(3, product);
            psInsert.setString(4, companytype);
            psInsert.setString(5, companyaddress);
            psInsert.setString(6, employees);
            psInsert.setString(7, branches);
            psInsert.setDouble(8, turnover);
            psInsert.setString(9, username);
            psInsert.setString(10, password);
            
            int i = psInsert.executeUpdate();
            if(i > 0){
%>
                <script type="text/javascript">
                    window.alert("Your Successfully Registered");
                    window.location="CompanyLogin.jsp";
                </script>
<%          } else { %>
                <script type="text/javascript">
                    window.alert("Registration Failed");
                    window.location="Company.jsp";
                </script>
<%          }
        } else { %>
            <script type="text/javascript">
                window.alert("Sorry, this Company Name & ID is already registered.");
                window.location="Company.jsp";
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
