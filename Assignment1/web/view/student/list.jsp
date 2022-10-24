<%-- 
    Document   : list
    Created on : Sep 30, 2022, 3:23:59 PM
    Author     : Ngo Tung Son
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
    </head>
    <body>
        <table>
            <tr>
                <td>Id</td>
                <td>Name</td>
                <td>Gender</td>
                <td>Dob</td>
                <td>Phone</td>
                <td>Email</td>
                <td>Address</td>
            </tr>
            <c:forEach items="${requestScope.students}" var="s">
                <tr>
                    <td>${s.id}</td>
                    <td>${s.name}</td>
                    <td>${s.gender}</td>
                    <td>${s.dob}</td>
                    <td>${s.phone}</td>
                    <td>${s.email}</td>
                    <td>${s.address}</td>
                    
                    
                </tr>
            </c:forEach>
        </table>
        <a href="insert">Save</a>
    </body>
</html>
