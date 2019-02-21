<%-- 
    Document   : login
    Created on : 25-Nov-2018, 19:18:24
    Author     : pauls
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file = "header.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=dataBundle.getString("login_title")%></title>
    </head>
    <body>
        <div class="row mt-3">
            <div class="col-3"></div>
            <div class="col-6">
                <div id="demo" class="carousel slide" data-ride="carousel">

                  <!-- Indicators -->
                  <ul class="carousel-indicators">
                    <li data-target="#demo" data-slide-to="0" class="active"></li>
                    <li data-target="#demo" data-slide-to="1"></li>
                    <li data-target="#demo" data-slide-to="2"></li>
                  </ul>

                  <!-- The slideshow -->
                  <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="images/books.jpg" alt="Books" width="1100">
                    </div>
                    <div class="carousel-item">
                      <img src="images/library.jpg" alt="Library" width="1100">
                    </div>
                    <div class="carousel-item">
                        <img src="images/library_heads.jpg" alt="Library Heads" width="1100">
                    </div>
                  </div>

                  <!-- Left and right controls -->
                  <a class="carousel-control-prev" href="#demo" data-slide="prev">
                    <span class="carousel-control-prev-icon"></span>
                  </a>
                  <a class="carousel-control-next" href="#demo" data-slide="next">
                    <span class="carousel-control-next-icon"></span>
                  </a>
                </div>
            </div>
            <div class="col-3"></div>
        </div>
        
        <div class="row mt-3">
            <div class="col-4"></div>
            <%
                // Check if they have landed here because their session expired
                String sessionExpired = (String) session.getAttribute("sessionExpired");
                // If so, then display the session expired message to the user
                if(sessionExpired != null){
                    // Display the error message to the user
                    out.println("<b>" + sessionExpired + "</b>");
                    // Remove the message from the session as it's no longer useful
                    session.removeAttribute("sessionExpired");
                }
            %>
            <div class="col-4 border border-primary text-center">
                <h1><%=dataBundle.getString("login_login")%></h1>
                <form action="Servlet" method="post">
                    <table>
                        <tr>
                            <td><%=dataBundle.getString("login_username")%></td><td> <input name="username" required size=40 type="text" /> </td> 
                        </tr>
                        <tr>
                            <td><%=dataBundle.getString("login_password")%></td><td> <input name="password" required size=40 type="password" /> </td> 
                        </tr>
                    </table>
                    <a href="register.jsp"><%=dataBundle.getString("login_dontHaveAnAccountRegisterHere")%></a></br>
                    <input type="submit" value="Login" />
                    <!-- Include a hidden field to identify what the user wants to do -->
                    <input type="hidden" name ="action" value="login" />
                </form>
            </div>
            <div class="col-4"></div>
        </div>
        
        <!-- Include a footer so that there is always a link back to the home page! -->
        <%@ include file = "footer.jsp" %>
    </body>
</html>
