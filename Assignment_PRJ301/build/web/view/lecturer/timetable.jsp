<%-- 
    Document   : timetable
    Created on : Nov 3, 2022, 7:22:20 PM
    Author     : anhde
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="helper" class="util.DateTimeHelper"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Time Table</title>
    </head>
    <style>
        .topnav {
            background-color: #333;
            overflow: hidden;
            color: white;
            margin-top: -1%;
            margin-right: -1%;
        }
        h1{
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
            margin-left: 15%;
            margin-bottom: 2%;
        }
        table{
            margin-left: 15%;
            
        }
        th{
            color: black;
            background-color: #6B90DA;
        }
    </style>
    <body>
        <div class="topnav">
            <h1>Lecturer: ${requestScope.lecturer.name}</h1> 
        </div>
        
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
        <form action="timetable" method="GET">
            <input type="hidden" name="lid" value="${param.lid}">
            From: <input type="date" name="from" value="${requestScope.from}"/>
            To: <input type="date" name="to" value="${requestScope.to}"/>
            <input type="submit" value="view"/>
        </form>

        <table border="1px">
            <tr>
                <th></th>
                    <c:forEach items="${requestScope.dates}" var="d">
                    <th>${d}<br/>${helper.getDayNameofWeek(d)}</th>
                    </c:forEach>
            </tr>
            <c:forEach items="${requestScope.slots}" var="slot">
                <tr>
                    <td>${slot.description}</td>
                    <c:forEach items="${requestScope.dates}" var="d">
                        <td>
                            <c:forEach items="${requestScope.sessions}" var="ses">
                                <c:if test="${helper.compare(ses.date,d) eq 0 and (ses.slot.id eq slot.id)}">
                                    <a href="takeatt?id=${ses.id}">${ses.group.name}-${ses.group.subject.name}</a><br>
                                    ${ses.room.name}
                                </c:if>
                            </c:forEach>
                        </td>
                    </c:forEach>

                </tr>
            </c:forEach>
        </table>   

    </body>
</html>
