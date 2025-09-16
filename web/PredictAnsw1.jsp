<%String username=(String)session.getAttribute("username");%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Predict</title>
<meta charset="utf-8">

<link rel="stylesheet" href="css/style.css" type="text/css" media="all">
<script type="text/javascript" src="js/jquery-1.4.2.js" ></script>
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/cufon-replace.js"></script>
<script type="text/javascript" src="js/Myriad_Pro_400.font.js"></script>
<script type="text/javascript" src="js/Myriad_Pro_700.font.js"></script>
<script type="text/javascript" src="js/Myriad_Pro_600.font.js"></script>
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/cufon-replace.js"></script>
<script type="text/javascript" src="js/Myriad_Pro_400.font.js"></script>
<script type="text/javascript" src="js/Myriad_Pro_700.font.js"></script>
	<header>
		<div class="wrapper">
			<h1><a href="index.html" id="logo">Stock Market Prediction And Analysis</a></h1>
			
				<div class="bg">
					
				</div>
			<a href="UserLogin.jsp" style="margin-left:800px;"><span><span>LogOut</span></span></a>
		
		<nav>
			<ul id="menu">
				<li class="alpha" id="menu_active" style="list-style-type:none;"><a href="UserHome.jsp"><span><span>Home</span></span></a></li>
				<li style="list-style-type:none;"><a href="ViewCompanies.jsp"><span><span>ViewCompanies</span></span> </a></li>
				<li style="list-style-type:none;"><a href="AllBoughtShares.jsp"><span><span>AllBoughtShares</span></span></a></li>
				<li style="list-style-type:none;"><a href="Predict.jsp" style="border-bottom-right-radius:15px;border-top-right-radius:15px;"><span><span>Predict</span></span></a></li>
				
			</ul>
		</nav>
		
	</header><div class="ic">More Website Templates at TemplateMonster.com!</div>
<!-- / header -->
<!-- content -->
	<section id="content">
		<div class="wrapper">
			<div class="wrapper">
                            <center><h2>Welcome:: <%=username%> </h2></center>
                            <%double value=(Double)session.getAttribute("value");
                            double a2=(Double)session.getAttribute("a2");
                             double value2=value*a2/100;
                             double value3=value+value2;
                            %>
                            <table>
                                <tr><td><font size="5">Hello&nbsp;&nbsp;<%=username%> your purchased company share value <br/>
                                        may be <font color="red">decrease</font> by &nbsp;&nbsp;<%=value3%>Rs/-</font></td></tr>
                            </table>
			</div>
			<div class="wrapper">
				<div class="box bot pad_bot2">
					<div class="pad">
						<article class="col1">
					
                                                        
                                                        
							</div>
							<div class="wrapper line1">
                                                            
                                                            </div>
						
						
					</div>
				</div>
			</div>
		</div>
						
						
					</div>
	<footer>
		<a href="#" target="_blank">Designed By</a> Something
		<a href="#" target="_blank">Designed By</a> Something
	</footer>
<!-- / footer -->
<script type="text/javascript"> Cufon.now(); </script>
<script type="text/javascript"> Cufon.now(); </script>
</body>
</html>
