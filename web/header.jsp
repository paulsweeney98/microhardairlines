<%-- 
    Document   : header
    Created on : 25-Nov-2018, 19:09:48
    Author     : pauls
--%>

<%@page import="java.text.DateFormat"%>

<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%@page import="java.util.ResourceBundle"%>
<%@page import="Dtos.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    // Retrieve the appropriate Locale - check if it's already been set within the site
    Locale clientLocale = (Locale) session.getAttribute("currentLocale");

    // If there was no locale already set -- it's their first time here or their session timed out
    if(clientLocale == null){
        // Get the locale for the client's browser (that is what's stored in the request)
        clientLocale = request.getLocale();
        // Save it as the currently selected locale
        session.setAttribute("currentLocale", clientLocale);
    }
%>
<!-- Create the resource bundle we're going to be using in all pages.
    Putting it in here means we don't need to repeat it in every page
--> 
<%
    // Retrieve the resource bundle from the session
    ResourceBundle dataBundle = (ResourceBundle) session.getAttribute("dataBundle");
    // If there is no bundle stored (i.e. if this is the first time you're coming to the site)
    if(dataBundle == null){
        // Create a resource bundle based on the client's current locale settings
        dataBundle = ResourceBundle.getBundle("properties.textInfo", clientLocale);

        // Store this resource bundle for future use
        session.setAttribute("dataBundle", dataBundle);
    }

%>

<%
    NumberFormat currencyFormatter = NumberFormat.getCurrencyInstance(clientLocale);
    DateFormat dateFormatter = DateFormat.getDateInstance(DateFormat.MEDIUM, clientLocale);
%>

<html lang="en">
<head>
  <title><%=dataBundle.getString("header_title")%></title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!--Favicon-->
  <link rel="shortcut icon" href="images/favicon/favicon.ico" type="image/x-icon" />
  
  <!--  Bootstrap cdn-->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

<!--  Bootstrap installed files-->
<!--  <link rel="stylesheet" href="css/bootstrap-4.3.1-dist/css/bootstrap.min.css">
  <script src="css/bootstrap-4.3.1-dist/js/bootstrap.min.js"></script>-->
  
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
  <link rel="stylesheet" type="text/css" href="css/styles.css">
  <script
    src="https://www.paypal.com/sdk/js?client-id=AUbTIIy7BJyjJvhmzCt5l8Iw-ZWXeDEca2U4TztwwOw4n_R84m5Ro7a1oQSP11hAMCwwh8NoVpPekmSn&currency=EUR">
  </script>
  <style>
  /* Make the image fully responsive */
  .carousel-inner img {
      width: 100%;
      height: 100%;
  }
  </style>
</head>

<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-primary">
        <%
            User loggedInUser = (User)session.getAttribute("loggedInUser");
            
            if (loggedInUser != null && loggedInUser.getPrivileges() == 2) {
        %>
        <a class="navbar-brand" href="adminIndex.jsp">
            <h1 class="text-center text-light"><img src="images/logo1.png" alt="Microhard Airlines" width="35">&nbsp;&nbsp;<%=dataBundle.getString("header_microhardAirlines")%></h1>
        </a>
        <%
            } else {
        %>
        <a class="navbar-brand" href="index.jsp">
            <h1 class="text-center text-light"><img src="images/logo1.png" alt="Microhard Airlines" width="35">&nbsp;&nbsp;<%=dataBundle.getString("header_microhardAirlines")%></h1>
        </a>
        <%
            }
        %>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
          <div class="navbar-nav">
            <a class="nav-item nav-link active text-light" href="index.jsp"><%=dataBundle.getString("header_searchFlights")%></a>
            <% if (loggedInUser != null) { %>
            <a class="nav-item nav-link text-light" href="upcomingTrips.jsp"><%=dataBundle.getString("header_manageTrips")%></a>
            <% } %>
            <%
                if(loggedInUser != null){
            %>
            <button class="btn btn-light dropdown-toggle" type="button" data-toggle="dropdown"><%=loggedInUser.getFirstName()%> <%=loggedInUser.getLastName()%>
            <span class="caret"></span></button>
            <ul class="dropdown-menu text-center">
              <li><a href="editAccountDetails.jsp"><%=dataBundle.getString("editUserProfile_profile")%></a></li>
              <li><a href="changePassword.jsp"><%=dataBundle.getString("header_changePassword")%></a></li>
              <li><a href="Servlet?action=logout"><%=dataBundle.getString("header_logout")%></a></li>
            </ul>
            <%
                } else {
            %>
            
            <%
                String emailCookie = "";
                String passwordCookie = "";
                
                Cookie[] cookies = request.getCookies();
                if (cookies != null && cookies.length != 0) {
                    for (Cookie cookie : cookies) {
                        if (cookie.getName().equals("emailStored")) {
                            emailCookie = cookie.getValue();
                        }
                    }
                }
            %>

            <button class="btn btn-light dropdown-toggle" type="button" data-toggle="dropdown"><%=dataBundle.getString("header_login")%>
            <span class="caret"></span></button>
            
            <div class="dropdown-menu border border-primary">
                <form action="Servlet" method="post" class="px-4 py-3">
                  <div class="form-group">
                    <label for="exampleDropdownFormEmail1">Email address</label>
                    <input name="email" type="email" class="form-control" id="exampleDropdownFormEmail1" value="<%=emailCookie%>">
                  </div>
                  <div class="form-group">
                    <label for="exampleDropdownFormPassword1">Password</label>
                    <input name="password" type="password" class="form-control" id="exampleDropdownFormPassword1" value="<%=passwordCookie%>">
                  </div>
                  <div class="form-check">
                    <input name="rememberMe" type="checkbox" class="form-check-input" id="dropdownCheck">
                    <label class="form-check-label" for="dropdownCheck">
                      Remember me
                    </label>
                  </div></br>
                  <button type="submit" class="btn btn-primary">Login</button>
                  
                  <input type="hidden" name ="action" value="login" />
                </form>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="register.jsp">New around here? Register</a>
                <a class="dropdown-item" href="answerSecurityQuestion.jsp">Forgot password?</a>
            </div>
            <%
                }
            %>
          </div>
        </div>
    </nav>
          
    <form action="Servlet" method="post">
        <!-- When the value of the drop down changes, 
        submit the form and send the value to the controller -->
        <select name ="language" onchange="this.form.submit()">
            <%
                String language = (String) session.getAttribute("language");
                if(language == null || language.equals("en")){

            %>
                <option value="en" selected>English</option>
                <option value="fr">Français</option>
            <%
                }else{
            %>
                <option value="en">English</option>
                <option value="fr" selected>Français</option>
            <%        
                }
            %>
        </select>
        <input type="hidden" name="action" value="changeLanguage"/>
    </form>
</body>
    