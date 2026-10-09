<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <title>Notifications - GardenConnect</title>

    <style>

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            min-height: 100vh;
            font-family: Arial, Helvetica, sans-serif;
            background: #05070d !important;
            color: white !important;
        }

        header {
            min-height: 82px;
            padding: 0 7%;
            display: flex;
            align-items: center;
            justify-content: space-between;
            background: #03060c !important;
            border-bottom: 1px solid #00e5ff;
            box-shadow: 0 0 20px rgba(0,229,255,0.15);
        }

        .brand {
            color: white !important;
            text-decoration: none !important;
            font-size: 28px;
            font-weight: 900;
        }

        nav {
            display: flex;
            gap: 25px;
        }

        nav a {
            color: #e8f1ff !important;
            text-decoration: none !important;
            font-weight: 600;
        }

        nav a:hover {
            color: #00e5ff !important;
        }

        main {
            max-width: 1000px;
            margin: auto;
            padding: 60px 25px;
        }

        h1 {
            color: white !important;
            font-size: 45px;
            margin-bottom: 35px;
        }

        .panel,
        .notification {
            background: linear-gradient(145deg,#0d1724,#080d16) !important;
            border: 1px solid rgba(0,229,255,0.18);
            border-radius: 18px;
            padding: 25px;
            margin-bottom: 18px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.45);
        }

        .notification {
            color: #dce7f5 !important;
            transition: 0.2s;
        }

        .notification:hover {
            border-color: #00e5ff;
            box-shadow: 0 0 20px rgba(0,229,255,0.12);
            transform: translateY(-2px);
        }

        @media (max-width: 800px) {

            header {
                flex-direction: column;
                padding: 20px;
                gap: 18px;
            }

            nav {
                flex-wrap: wrap;
                justify-content: center;
            }

        }

    </style>

</head>

<body>

<header>

    <a class="brand"
       href="${pageContext.request.contextPath}/dashboard.jsp">
        🌱 GardenConnect
    </a>

    <nav>

        <a href="${pageContext.request.contextPath}/dashboard.jsp">
            Dashboard
        </a>

        <a href="${pageContext.request.contextPath}/posts">
            Community
        </a>

        <a href="${pageContext.request.contextPath}/plants">
            Plants
        </a>

        <a href="${pageContext.request.contextPath}/questions">
            Questions
        </a>

        <a href="${pageContext.request.contextPath}/logout">
            Logout
        </a>

    </nav>

</header>


<main>

    <h1>
        🔔 Notifications
    </h1>


    <c:if test="${empty notifications}">

        <div class="panel">

            No notifications yet.

        </div>

    </c:if>


    <c:forEach var="n" items="${notifications}">

        <div class="notification">

            🔔

                ${n.message}

        </div>

    </c:forEach>

</main>

</body>

</html>