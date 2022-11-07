<%-- 
    Document   : Home
    Created on : Nov 7, 2022, 4:42:58 PM
    Author     : anhde
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
    </head>
    <style>
        body, html {
            height: 100%;
        }
        body{
            background-image: url("img/background.jpg");
            background-size: 100%;
            height: 80%;
            background-position: center;
            background-repeat: no-repeat;
        }
    </style>
    <body>
        <h1>Hello ${requestScope.account.displayname}</h1>
    <li><div class="timetable">
            <a href="/Assignment_PRJ301/lecturer/timetable?lid=1">Time Table</a>
        </div>
    </li>
    <li><div class="checkatts">
            <a href="/Assignment_PRJ301/lecturer/att?id=1">Attandance</a>
        </div>
    </li>
    <li><div class="logout">
            <a href="/Assignment_PRJ301/logout">Logout</a>
        </div>
    </li>



</body>
</html>
