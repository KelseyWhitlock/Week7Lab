<%-- 
    Document   : user
    Created on : 21-Feb-2023, 10:29:23 AM
    Author     : Kelsey
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User</title>
    </head>
    <body>
        <h1>Manager Users</h1>
        ${message}
        <table border="1">
            <tr>
                <td>Email</td>
                <td>First Name</td>
                <td>Last Name</td>
                <td>Role</td>
            </tr>
            <c:forEach items="${users}" var="users"> 
                <tr>
                    <td>${user.email}</td>
                    <td>${user.firstName}</td>
                    <td>${user.lastName}</td>
                    <c:choose>
                        <c:when test="${user.getRole.getRoleID() == 2}">
                            <td>Regular User</td>  
                        </c:when>
                        <c:otherwise>
                            <td>System Admin</td>
                        </c:otherwise>
                    </c:choose>
                            <td>
                               
                
                            </td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
