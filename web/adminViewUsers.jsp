<%-- 
    Document   : adminViewUsers
    Created on : 21-Mar-2019, 12:54:00
    Author     : d00194995
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Daos.UserDao"%>
<%@page import="Daos.Dao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file = "header.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=dataBundle.getString("adminViewUsers_title")%></title>
    </head>
    <body>
        <%            if (loggedInUser != null && loggedInUser.getPrivileges() == 2) {
        %>


        <div class="row mt-3">
            <div class="col-0 col-md-4"></div>

            <div class="col-12 col-md-4">
                <table>
                    <tr class="text-center border-top border-bottom border-primary rounded">
                        <th><%=dataBundle.getString("adminViewUsers_email")%></th>
                        <th><%=dataBundle.getString("adminViewUsers_name")%></th>

                        <th><%=dataBundle.getString("adminViewUsers_userType")%></th>
                        <th><%=dataBundle.getString("adminViewUsers_suspended")%></th>
                        <th></th>
                    </tr>
                    <%
                        UserDao uDao = new UserDao(Dao.getDatabaseName());

                        ArrayList<User> users = uDao.getUsers();

                        if (users != null && !users.isEmpty()) {
                            for (User u : users) {
                                int id = u.getUserId();
                                String email = u.getEmail();
                                String firstName = u.getFirstName();
                                String lastName = u.getLastName();
                                int privileges = u.getPrivileges();
                                int suspended = u.getSuspended();
                    %>

                    <tr class="text-center border-top border-bottom border-primary rounded">
                        <td><i><%=email%></i></td>
                        <td><%=firstName%> <%=lastName%></td>
                        
                        <td>
                            <%
                                if (privileges == 2) {
                            %>
                            <i><%=dataBundle.getString("adminViewUsers_admin")%></i>
                            <%
                            } else if (privileges == 1) {
                            %>
                            <i><%=dataBundle.getString("adminViewUsers_normalUser")%></i>
                            <%
                            } else {
                            %>
                            <i><%=dataBundle.getString("adminViewUsers_none")%></i>
                            <%
                                }
                            %>
                        </td>

                            <%
                                if (suspended == 1) {
                            %>
                            <td>
                                <i><%=dataBundle.getString("adminViewUsers_yes")%></i>
                            </td>
                            <td>
                                <form action="Servlet" method="post">
                                    <input class="btn btn-success" type="Submit" value="<%=dataBundle.getString("adminViewUsers_enableUser")%>">
                                    <input type="hidden" name="id" value="<%=id%>" />
                                    <input type="hidden" name="action" value="adminUnsuspendUser" />
                                </form>
                            </td>
                            <%
                            } else {
                            %>
                            <td>
                                <i><%=dataBundle.getString("adminViewUsers_no")%></i>
                            </td>
                            <td>
                                <form action="Servlet" method="post">
                                    <input class="btn btn-danger" type="Submit" value="<%=dataBundle.getString("adminViewUsers_suspendUser")%>">
                                    <input type="hidden" name="id" value="<%=id%>" />
                                    <input type="hidden" name="action" value="adminSuspendUser" />
                                </form>
                            </td>
                            <%
                                }

                            %>
                    </tr>
                    
                <%
                    }
                %>
                    </table>
                <%
                } else {
                %>
                <div class="text-center">
                    <h3><%=dataBundle.getString("adminViewUsers_noUsersFound")%></h3>
                    <a href="adminIndex.jsp" class="btn btn-success"><%=dataBundle.getString("adminViewUsers_backToUserIndex")%></a>
                </div>

                <%
                    }
                } else {
                %>
                <div class="text-center">
                    <h3><%=dataBundle.getString("adminViewUsers_mustBeAdmin")%></h3>
                    <a href="index.jsp" class="btn btn-success"><%=dataBundle.getString("adminViewUsers_normalUserHomepage")%></a>
                </div>
                <%
                    }
                %>
            </div>
            <div class="col-0 col-md-4"></div>
        </div>

    </body>
</html>
