<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <title>Plant Library - GardenConnect</title>

    <style>

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            min-height: 100vh;
            font-family: Arial, Helvetica, sans-serif;
            background: #05070d !important;
            color: #f5f7ff !important;
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
            align-items: center;
            gap: 25px;
        }

        nav a {
            color: #e8f1ff !important;
            text-decoration: none !important;
            font-size: 16px;
            font-weight: 600;
        }

        nav a:hover {
            color: #00e5ff !important;
            text-shadow: 0 0 8px #00e5ff;
        }

        main {
            max-width: 1270px;
            margin: auto;
            padding: 60px 25px;
        }

        .page-title {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
        }

        h1 {
            color: white !important;
            font-size: 45px;
            margin: 0;
        }

        .button,
        button {
            padding: 12px 20px;
            background: #007fae !important;
            color: white !important;
            border: 1px solid #00e5ff;
            border-radius: 9px;
            font-weight: 700;
            text-decoration: none !important;
            cursor: pointer;
            box-shadow: 0 0 10px rgba(0,229,255,0.2);
        }

        .button:hover,
        button:hover {
            background: #00d9ff !important;
            color: #001018 !important;
            box-shadow:
                    0 0 10px #00e5ff,
                    0 0 25px rgba(0,229,255,0.5);
        }

        .search {
            display: flex;
            gap: 12px;
            margin-bottom: 30px;
        }

        .search input {
            flex: 1;
        }

        input {
            width: 100%;
            padding: 13px;
            background: #080e18 !important;
            color: white !important;
            border: 1px solid #26394f;
            border-radius: 9px;
            outline: none;
        }

        input:focus {
            border-color: #00e5ff;
            box-shadow: 0 0 9px rgba(0,229,255,0.3);
        }

        .grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(270px, 1fr));
            gap: 25px;
        }

        .card {
            background: linear-gradient(145deg,#0d1724,#080d16) !important;
            color: white !important;
            border: 1px solid rgba(0,229,255,0.18);
            border-radius: 18px;
            padding: 28px;
            min-height: 330px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.45);
            transition: 0.25s ease;
        }

        .card:hover {
            transform: translateY(-6px);
            border-color: #00e5ff;
            box-shadow:
                    0 0 10px rgba(0,229,255,0.35),
                    0 0 30px rgba(0,229,255,0.12);
        }

        .card h2 {
            color: white !important;
        }

        .card p {
            color: #aeb9c9 !important;
            line-height: 1.6;
        }

        .badge {
            display: inline-block;
            padding: 7px 12px;
            border-radius: 20px;
            color: #00e5ff !important;
            border: 1px solid #00e5ff;
            background: rgba(0,229,255,0.08);
            font-weight: 700;
        }

        @media (max-width: 900px) {

            header {
                flex-direction: column;
                padding: 20px;
                gap: 18px;
            }

            nav {
                flex-wrap: wrap;
                justify-content: center;
            }

            .page-title {
                flex-direction: column;
                align-items: flex-start;
                gap: 20px;
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

        <a href="${pageContext.request.contextPath}/plants/garden">
            My Garden
        </a>

        <a href="${pageContext.request.contextPath}/posts">
            Community
        </a>

        <a href="${pageContext.request.contextPath}/questions">
            Questions
        </a>

        <a href="${pageContext.request.contextPath}/notifications">
            🔔 Notifications
        </a>

        <a href="${pageContext.request.contextPath}/logout">
            Logout
        </a>

    </nav>

</header>


<main>

    <div class="page-title">

        <h1>🌿 Plant Library</h1>

        <a class="button"
           href="${pageContext.request.contextPath}/plants/garden">
            🪴 My Garden
        </a>

    </div>


    <form class="search"
          action="${pageContext.request.contextPath}/plants"
          method="get">

        <input
                name="q"
                value="${param.q}"
                placeholder="Search by plant name or type">

        <button type="submit">
            🔍 Search
        </button>

    </form>


    <div class="grid">

        <c:forEach var="p" items="${plants}">

            <div class="card">

                <h2>
                    🪴 ${p.name}
                </h2>

                <p>
                    <b>Type:</b> ${p.type}
                </p>

                <p>
                    <b>Sunlight:</b> ${p.sunlight}
                </p>

                <p>
                    <b>Water:</b> ${p.wateringFrequency}
                </p>

                <p>
                        ${p.description}
                </p>


                <c:choose>

                    <c:when test="${p.inMyGarden}">

                        <span class="badge">
                            ✓ In My Garden
                        </span>

                    </c:when>


                    <c:otherwise>

                        <form
                                action="${pageContext.request.contextPath}/plants/add"
                                method="post">

                            <input
                                    type="hidden"
                                    name="plantId"
                                    value="${p.plantId}">

                            <button type="submit">
                                + Add to My Garden
                            </button>

                        </form>

                    </c:otherwise>

                </c:choose>

            </div>

        </c:forEach>

    </div>

</main>

</body>

</html>