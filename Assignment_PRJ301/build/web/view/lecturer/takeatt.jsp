<%-- 
    Document   : takeatt
    Created on : Oct 16, 2022, 9:36:57 AM
    Author     : sonnt
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Attandance</title>
    </head>
    <style>
        .topnav {
            background-color: #333;
            overflow: hidden;
            color: white;
            margin-top: -1%;
            margin-right: -1%;
        }
        h2,h3{
            margin-left: 15%;
        }

        .sidenav {
            height: 100%;
            width: 200px;
            position: fixed;
            z-index: 1;
            top: 0;
            left: 0;
            background-color: #111;
            overflow-x: hidden;
            padding-top: 20px;
        }

        .sidenav a {
            padding: 6px 6px 6px 32px;
            text-decoration: none;
            font-size: 25px;
            color: #818181;
            display: block;
        }

        .sidenav a:hover {
            color: #f1f1f1;
        }

        .main {
            margin-left: 200px; 
        }

        @media screen and (max-height: 450px) {
            .sidenav {
                padding-top: 15px;
            }
            .sidenav a {
                font-size: 18px;
            }
        }

        form{
            margin-top: 2%;
            margin-left: 16%;
            margin-bottom: 2%;
        }
        table{
            width: 100%;
            
        }
        th{
            color: black;
            background-color: #6B90DA;
        }
        
    </style>
    <body>
        <div class="sidenav">
            <li><div class="home">
                    <a href="/Assignment_PRJ301/home">Home</a>
                </div>
            </li>
            
            <li><div class="logout">
                    <a href="/Assignment_PRJ301/logout">Logout</a>
                </div>
            </li>
        </div>
        <div class="topnav">
        <h2>Take Attandance for class: ${requestScope.ses.group.name} </h2>
        <h3>Subject: ${requestScope.ses.group.subject.name}<br>
        Room: ${requestScope.ses.room.name}, Time: ${requestScope.ses.date} ${requestScope.ses.slot.description}
        <br/>
        Attended: ${requestScope.ses.attanded?"Yes":"No"}</h3>
        </div>
        
        <form action="takeatt" method="POST">
            <input type="hidden" name="sesid" value="${param.id}"/>
            <table border="1px">
                <tr>
                    <th>Student Id</th>
                    <th>Student Name</th>
                    <th>Present</th>
                    <th>Absent</th>
                    <th>Description</th>

                </tr>
                <c:forEach items="${requestScope.atts}" var="a">
                    <tr>
                        <td>${a.student.id}
                            <input type="hidden" value="${a.student.id}" name="stdid"/>
                        </td>
                        <td>${a.student.name}</td>
                        <td><input type="radio" 
                                   <c:if test="${a.present}">
                                       checked="checked" 
                                   </c:if>
                                   name="present${a.student.id}" value="present" /></td>
                        <td><input type="radio"
                                   <c:if test="${!a.present}">
                                       checked="checked" 
                                   </c:if>
                                   name="present${a.student.id}" value="absent" /></td>
                        <td><input type="" value="${a.description}" name="description${a.student.id}"></td>

                    </tr>  
                </c:forEach>
            </table>
            <input type="submit" value="Save"/>
        </form>
    </body>
</html>
