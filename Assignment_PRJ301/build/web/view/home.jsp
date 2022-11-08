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
            margin-left: 200px; /* Same as the width of the sidenav */
        }

        @media screen and (max-height: 450px) {
            .sidenav {
                padding-top: 15px;
            }
            .sidenav a {
                font-size: 18px;
            }
        }
    </style>
    <body>

        <div class="topnav">
            <h1>Hello ${sessionScope.account.displayname}</h1>
        </div>
        <div class="sidenav">
            <li><div class="timetable">
                    <a href="/Assignment_PRJ301/lecturer/timetable?lid=1">Time Table</a>
                </div>
            </li>
            <li><div class="checkatts">
                    <a href="/Assignment_PRJ301/lecturer/takeatt?id=1">Attandance</a>
                </div>
            </li>
            <li><div class="logout">
                    <a href="/Assignment_PRJ301/logout">Logout</a>
                </div>
            </li>
        </div>



    </body>
</html>
