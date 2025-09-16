<% String articlename=(String)session.getAttribute("articlename");%>
<%
                         Connection con=null;
            Statement st= null;
            ResultSet rs=null;
             
            int n=0;     

             try
                  {
                      Class.forName("com.mysql.jdbc.Driver");
             con = DriverManager.getConnection("jdbc:mysql://localhost:3306/stock_predection","root","root");
             st = con.createStatement();
             rs=st.executeQuery("select max(id) from publish");
             if(rs.next())
             {
                 if(rs.getInt(1)==0)
            {
            n=1; 
          
            }
            else
            {
                
                n=rs.getInt(1)+1;
                
                //out.println(id3);
               session.setAttribute("id",n);
            }
             }
                  }
             catch(Exception e)
                     {
                     out.println(e);
                     }

                         %>     
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Publish Article</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" type="image/png" href="images/favicon.png">
<link rel="stylesheet" href="style.css">
</head>
<body id="page1">
<div class="main">
<!-- header -->
	<header class="header">
		<div class="container">
			<div class="header-content">
                <div class="logo">
                    <h1><a href="index.html">Stock Market Prediction And Analysis</a></h1>
                </div>
                <nav class="navigation">
                    <ul class="nav-menu">
                        <li class="nav-item"><a href="ArticleHome.jsp" class="nav-link"><img src="images/home.png" alt="Home" class="nav-icon-img"/><span>Home</span></a></li>
                        <li class="nav-item active"><a href="PublishArticle.jsp" class="nav-link"><img src="images/publish.png" alt="Publish" class="nav-icon-img"/><span>Publish Article</span></a></li>
                        <li class="nav-item"><a href="ViewCompanyDetails.jsp" class="nav-link"><img src="images/company.png" alt="Company" class="nav-icon-img"/><span>Company Details</span></a></li>
                        <li class="nav-item"><a href="PublishedArticles.jsp" class="nav-link"><img src="images/published.png" alt="Published" class="nav-icon-img"/><span>Published</span></a></li>
                    </ul>
                </nav>
                <div class="logout-link">
                     <a href="ArticalsLogin.jsp" class="btn btn--secondary">Logout</a>
                </div>
                 <div class="mobile-menu-toggle">
                    <span></span>
                    <span></span>
                    <span></span>
                </div>
            </div>
		</div>
	</header>
<!-- / header -->
<!-- content -->
	<section id="content">
            <div class="page-header">
                <div class="container">
                    <h2>Publish New Article</h2>
                </div>
            </div>
            <div class="container">
                <div class="form-container">
                    <form action="PublishAction.jsp" name="publish" method="post">
                        <div class="form-group">
                            <label>Publishing By</label>
                            <input type="text" name="artclename" value="<%=articlename%>" readonly>
                        </div>
                        <div class="form-group">
                            <label for="company">Select Company</label>
                            <select name="company" id="company">
                                <option>-- Select --</option>
                                <%@page import="java.sql.*" %>
                                <%@page import="databaseconnection.databasecon" %>
                                <%
                                    Connection con1 = null;
                                    Statement st1 = null;
                                    ResultSet rs1 = null;
                                    try {
                                        con1 = databasecon.getconnection();
                                        st1 = con1.createStatement();
                                        rs1 = st1.executeQuery("select * from comregister where status='activated'");
                                        while (rs1.next()) {
                                %>
                                <option value="<%=rs1.getString("companyname")%>"><%=rs1.getString("companyname")%></option>
                                <%
                                        }
                                    } catch (Exception e) {
                                        out.println(e);
                                    } finally {
                                        if(rs1 != null) rs1.close();
                                        if(st1 != null) st1.close();
                                        if(con1 != null) con1.close();
                                    }
                                %>
                            </select>
                        </div>
                        <div class="form-group">
                            <label>Article ID</label>
                            <input type="text" name="id" value="<%=n%>" readonly>
                        </div>
                        <div class="form-group">
                            <label for="description">Company Description</label>
                            <textarea id="description" cols="20" rows="5" name="description" required></textarea>
                        </div>
                        <div class="form-group">
                            <label for="status">Select Feedback</label>
                            <select id="status" name="status">
                                <option>-- Select --</option>
                                <option value="possitive">Positive</option>
                                <option value="negative">Negative</option>
                                <option value="neutral">Neutral</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="quality">Article Quality</label>
                            <select id="quality" name="quality">
                                <option>-- Select --</option>
                                <% for(int i = 5; i <= 100; i+=5) { %>
                                <option value="<%=i%>"><%=i%>%</option>
                                <% } %>
                            </select>
                        </div>
                        <div class="form-actions">
                            <button type="submit" class="btn btn--primary">Publish</button>
                            <input type="reset" class="btn btn--secondary" value="Reset">
                        </div>
                    </form>
                </div>
            </div>
	</section>
<!-- / content -->
<!-- footer -->
	<footer class="footer">
		<div class="container">
			<div class="footer-content">
				<p>&copy; 2024 Stock Market Prediction And Analysis. All rights reserved.</p>
				<p>Designed with modern web technologies for financial excellence</p>
			</div>
		</div>
	</footer>
<!-- / footer -->
</div>
<script src="app.js"></script>
</body>
</html>