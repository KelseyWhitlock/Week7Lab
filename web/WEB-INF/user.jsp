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
            <c:forEach items="${users}" var="user"> 
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
                                <c:url value="/User" var="edit">
                                    <c:param name="email" value="${user.email}"/>
                                    <c:param name="action" value="edit"/>
                                </c:url>
                                <a href="{edit}">Edit</a>
                            </td>
                            <td>
                                <c:url value="/User" var="delete">
                                     <c:param name="email" value="${user.email}"/>
                                    <c:param name="action" value="delete"/> 
                                </c:url>
                                <a href="{delete}">Delete</a>
                           </td>
                </tr>
            </c:forEach>
        </table>
        <c:if test="${userS eq null}">
            <h2>Add User</h2><br><br>
            <form action="user" method="post">
                <input type="hidden" name="email" value="${userS.email}">
                Email:${userS.email}<br>
                First Name: <input type="text" name="firstName" required value="${userS.firstName}"> <br>
                Last Name: <input type="text" name="lastName" required value="${userS.lastName}"> <br>
                Password: <input type="password" name="password" required value="${userS.password}"> <br>
                Role:<select name="role">
                    <option value="system admin"> System Admin</option>
                    <option value="regular user"> Regular User</option>  
                </select> <br>
                <input type="hidden" name="action" value="update">
                <input type="submit" value="Update">
                <a href="/user" class="button">Cancel</a>
            </form>
        </c:if>
            ${message}
    </body>
</html>
