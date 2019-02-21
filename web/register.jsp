<%-- 
    Document   : register
    Created on : 26-Nov-2018, 16:53:54
    Author     : pauls
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file = "header.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=dataBundle.getString("register_register")%></title>
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
            <div class="col-4 border border-primary text-center">
                <h1><%=dataBundle.getString("register_register")%></h1>
                <form action="Servlet" method="post">
                    <table>
                        <tr>
                            <td><%=dataBundle.getString("register_email")%></td><td> <input name="email" required size=40 type="email" /> </td> 
                        </tr>
                        <tr>
                            <td><%=dataBundle.getString("register_password")%></td><td> <input name="password" required size=40 type="password" /> </td> 
                        </tr>
                        <tr>
                            <td><%=dataBundle.getString("register_confirmPassword")%></td><td> <input name="confirmPassword" required size=40 type="password" /> </td> 
                        </tr>
                        <tr>
                            <td><%=dataBundle.getString("register_firstName")%></td><td> <input name="firstName" required size=40 type="text" /> </td> 
                        </tr>
                        <tr>
                            <td><%=dataBundle.getString("register_lastName")%></td><td> <input name="lastName" required size=40 type="text" /> </td> 
                        </tr>
                        <tr>
                            <td><%=dataBundle.getString("register_dateOfBirth")%></td><td> <input name="dateOfBirth" required size="40" type="date" /> </td> 
                        </tr>
                        <tr>
                            <td><%=dataBundle.getString("register_phone")%></td><td> <input name="phoneNumber" required size=40 type="text" /> </td> 
                        </tr>
                        <tr>
                            <td><%=dataBundle.getString("register_addressLine1")%></td><td> <input name="addressLine1" required size=40 type="text" /> </td> 
                        </tr>
                        <tr>
                            <td><%=dataBundle.getString("register_addressLine2")%></td><td> <input name="addressLine2" required size=40 type="text" /> </td> 
                        </tr>
                        <tr>
                            <td><%=dataBundle.getString("register_cityOrTown")%></td><td> <input name="cityOrTown" required size=40 type="text" /> </td> 
                        </tr>
                        <tr>
                            <td><%=dataBundle.getString("register_postalCode")%></td><td> <input name="postalCode" required size=40 type="text" /> </td> 
                        </tr>
                        <tr>
                            <td><%=dataBundle.getString("register_county")%></td><td> <input name="county" required size=40 type="text" /> </td> 
                        </tr>
                        <tr>
                            <td><%=dataBundle.getString("register_country")%></td><td> <input name="country" required size=40 type="text" /> </td> 
                        </tr>
                    </table></br>
                    <input type="submit" value="Register" />
                    <!-- Include a hidden field to identify what the user wants to do -->
                    <input type="hidden" name ="action" value="register" />
                </form>
            </div>
            <div class="col-4"></div>
        </div>
        
        <!-- Include a footer so that there is always a link back to the home page! -->
        <%@ include file = "footer.jsp" %>
    </body>
</html>
