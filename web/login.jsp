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
        <%
            String booking = request.getParameter("booking");
            
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
        
        <%
            if (session.getAttribute("errorMessage") != null) {
        %>
        <h3 class="text-center text-danger"><%=session.getAttribute("errorMessage")%></h3>
        <%
            }
        %>
        
        <div class="row mt-3">
            <div class="col-0 col-md-3"></div>
            <div class="col-12 col-md-6">
                <div class="border border-primary">
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

                      <%
                          if (booking != null) {
                      %>
                      <input type="hidden" name ="booking" value="<%=booking%>" />
                      <%
                          }
                      %>
                      <input type="hidden" name ="action" value="login" />
                    </form>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="register.jsp">New around here? Register</a>
                    <a class="dropdown-item" href="#">Forgot password?</a>
                </div>
            </div>
            <div class="col-0 col-md-3"></div>
        </div>
    </body>
</html>
