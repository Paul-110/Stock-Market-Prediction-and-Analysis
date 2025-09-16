<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <%@page import="databaseconnection.databasecon" %>
                                 <%@page import="java.sql.*"%>
                                <%try{
                                    String companyname=request.getParameter("companyname");
                                    String vote=request.getParameter("vote");
                                    
                                    
                                  Connection con=databasecon.getconnection();
                                 Statement st=con.createStatement();
                                 ResultSet rs=st.executeQuery("select * from publish where companyname='"+companyname+"'");
                                 while(rs.next()){
                                  int vote1=Integer.parseInt(rs.getString("possitive"));   
                                 int total1=vote1+1;
                                  int vote2=Integer.parseInt(rs.getString("negative"));   
                                 int total2=vote2+1;
                                  int vote3=Integer.parseInt(rs.getString("nutral"));   
                                 int total3=vote3+1;
                                 if(vote.equals("positive")){
                                int i=st.executeUpdate("update publish set Possitive='"+total1+"'");
                                if(i>0){
                                session.setAttribute("companyname",companyname);%>
                                <script type="text/javascript">
                                    window.alert("Thank You..!!!");
                                    window.location="ViewArticle.jsp";
                                    </script>
                                <%}else{
session.setAttribute("companyname",companyname);
%>
                                <script type="text/javascript">
                                    window.alert("Failed..!!!");
                                    window.location="ViewArticle.jsp";
                                    </script>
                                <%

}
}if(vote.equals("negative")){
 Statement s=con.createStatement();
                                int ii=s.executeUpdate("update publish set negative='"+total2+"'");
                                if(ii>0){
                                session.setAttribute("companyname",companyname);%>
                                <script type="text/javascript">
                                    window.alert("Thank You..!!!");
                                    window.location="ViewArticle.jsp";
                                    </script>
                                <%}else{
session.setAttribute("companyname",companyname);
%>
                                <script type="text/javascript">
                                    window.alert("Failed..!!!");
                                    window.location="ViewArticle.jsp";
                                    </script>
                                <%

}
}if(vote.equals("neutral")){
 Statement ss=con.createStatement();
                                int y=ss.executeUpdate("update publish set nutral='"+total3+"'");
                                if(y>0){
                                session.setAttribute("companyname",companyname);%>
                                <script type="text/javascript">
                                    window.alert("Thank You..!!!");
                                    window.location="ViewArticle.jsp";
                                    </script>
                                <%}else{
session.setAttribute("companyname",companyname);
%>
                                <script type="text/javascript">
                                    window.alert("Failed..!!!");
                                    window.location="ViewArticle.jsp";
                                    </script>
                                <%

}
                               
                                     
                                     
                                 }  
                                 }                                                             
 }catch(Exception e){
   out.println(e);      
}%>