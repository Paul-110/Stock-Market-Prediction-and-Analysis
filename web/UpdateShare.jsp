<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="databaseconnection.databasecon" %>
<%@page import="java.sql.*"%>
<%String companyname=request.getParameter("name");
    String companyid=request.getParameter("id");
double sharevalue=Double.parseDouble(request.getParameter("sharevalue"));
System.out.println(sharevalue);
double shares=Double.parseDouble(request.getParameter("shares"));
System.out.println(shares);%>
    <%
        try{                                                   
Connection con=databasecon.getconnection();
Statement st=con.createStatement();
int i=st.executeUpdate("update comregister set status='activated',shares='"+shares+"',sharevalue='"+sharevalue+"',availableshares='"+shares+"' where companyid='"+companyid+"'");
if(i>0){
  response.sendRedirect("CompanyDetails.jsp?msg=success");  
}
else{
  response.sendRedirect("CompanyDetails.jsp?msg=Failed");  
}
}catch(Exception e){
    out.println(e);
}%>