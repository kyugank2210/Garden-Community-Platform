<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <title>My Garden - GardenConnect</title>

    <style>

        /* =========================================
           DARK + NEON BLUE
           ========================================= */

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;

            font-family: Arial, Helvetica, sans-serif;

            background: #05070d !important;

            color: #ffffff !important;

            min-height: 100vh;
        }


        /* =========================================
           NAVBAR
           ========================================= */

        header {
            min-height: 82px;

            padding: 0 7%;

            display: flex;

            align-items: center;

            justify-content: space-between;

            background: #03060c !important;

            border-bottom: 1px solid #00e5ff;

            box-shadow:
                    0 0 20px rgba(0, 229, 255, 0.15);
        }


        .brand {
            color: white !important;

            text-decoration: none !important;

            font-size: 28px;

            font-weight: 900;
        }


        .brand:hover {
            color: white !important;

            text-decoration: none !important;
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

            text-shadow:
                    0 0 8px #00e5ff;
        }


        /* =========================================
           MAIN
           ========================================= */

        main {
            max-width: 1270px;

            margin: auto;

            padding: 60px 25px;
        }


        /* =========================================
           PAGE TITLE
           ========================================= */

        .page-title {
            display: flex;

            justify-content: space-between;

            align-items: center;

            margin-bottom: 30px;
        }


        .page-title h1 {
            margin: 0;

            color: #ffffff !important;

            font-size: 45px;

            font-weight: 800;

            text-shadow:
                    0 0 15px rgba(0, 229, 255, 0.15);
        }


        /* =========================================
           ADD PLANTS BUTTON
           ========================================= */

        .button {
            display: inline-block;

            padding: 13px 22px;

            background: #007fae !important;

            color: white !important;

            border: 1px solid #00e5ff;

            border-radius: 10px;

            text-decoration: none !important;

            font-weight: 700;

            box-shadow:
                    0 0 10px rgba(0, 229, 255, 0.2);

            transition: 0.2s ease;
        }


        .button:hover {
            background: #00d9ff !important;

            color: #001018 !important;

            box-shadow:
                    0 0 10px #00e5ff,
                    0 0 25px rgba(0, 229, 255, 0.5);
        }


        /* =========================================
           EMPTY GARDEN PANEL
           ========================================= */

        .panel {
            background:
                    linear-gradient(
                            145deg,
                            #0d1724,
                            #080d16
                    ) !important;

            border: 1px solid rgba(0, 229, 255, 0.2);

            border-radius: 18px;

            padding: 38px;

            box-shadow:
                    0 10px 35px rgba(0, 0, 0, 0.5);
        }


        .panel h2 {
            color: #ffffff !important;

            font-size: 30px;

            margin-top: 0;
        }


        .panel p {
            color: #aeb9c9 !important;

            font-size: 17px;

            margin-bottom: 25px;
        }


        /* =========================================
           GARDEN GRID
           ========================================= */

        .grid {
            display: grid;

            grid-template-columns:
                repeat(auto-fit, minmax(270px, 1fr));

            gap: 25px;
        }


        /* =========================================
           PLANT CARD
           ========================================= */

        .card {
            background:
                    linear-gradient(
                            145deg,
                            #0d1724,
                            #080d16
                    ) !important;

            color: #ffffff !important;

            border: 1px solid rgba(0, 229, 255, 0.18);

            border-radius: 18px;

            padding: 28px;

            box-shadow:
                    0 10px 30px rgba(0, 0, 0, 0.45);

            transition: 0.25s ease;
        }


        .card:hover {
            transform: translateY(-6px);

            border-color: #00e5ff;

            box-shadow:
                    0 0 10px rgba(0, 229, 255, 0.35),
                    0 0 30px rgba(0, 229, 255, 0.12);
        }


        .card h2 {
            color: #ffffff !important;

            margin-top: 0;
        }


        .card p {
            color: #aeb9c9 !important;

            line-height: 1.6;
        }


        /* =========================================
           CARD BUTTON
           ========================================= */

        .card button {
            padding: 11px 17px;

            margin-top: 8px;

            background: #007fae !important;

            color: white !important;

            border: 1px solid #00e5ff;

            border-radius: 8px;

            font-weight: 700;

            cursor: pointer;

            transition: 0.2s ease;
        }


        .card button:hover {
            background: #00d9ff !important;

            color: #001018 !important;

            box-shadow:
                    0 0 12px #00e5ff;
        }


        .card button.danger {
            background: #45121a !important;

            border-color: #ff4d67;

            color: #ffb4bf !important;
        }


        .card button.danger:hover {
            background: #ff405c !important;

            color: white !important;

            box-shadow:
                    0 0 15px rgba(255, 64, 92, 0.5);
        }


        /* =========================================
           MOBILE
           ========================================= */

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


        @media (max-width: 600px) {

            main {
                padding: 40px 18px;
            }

            .page-title h1 {
                font-size: 35px;
            }

        }

    </style>

</head>


<body>


<!-- =========================================
     NAVBAR
     ========================================= -->

<header>

    <a class="brand"
       href="${pageContext.request.contextPath}/dashboard.jsp">

        🌱 GardenConnect

    </a>


    <nav>

        <a href="${pageContext.request.contextPath}/posts">
            Community
        </a>

        <a href="${pageContext.request.contextPath}/plants">
            Plant Library
        </a>

        <a href="${pageContext.request.contextPath}/plants/garden">
            My Garden
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


<!-- =========================================
     MAIN
     ========================================= -->

<main>


    <div class="page-title">

        <h1>
            🪴 My Garden
        </h1>


        <a class="button"
           href="${pageContext.request.contextPath}/plants">

            + Add Plants

        </a>

    </div>


    <!-- EMPTY GARDEN -->

    <c:if test="${empty garden}">

        <div class="panel">

            <h2>
                Your garden is empty
            </h2>

            <p>
                Add your first plant from the Plant Library.
            </p>

            <a class="button"
               href="${pageContext.request.contextPath}/plants">

                Browse Plants

            </a>

        </div>

    </c:if>


    <!-- PLANTS -->

    <div class="grid">

        <c:forEach var="p" items="${garden}">

            <div class="card">

                <h2>
                    🌱 ${p.name}
                </h2>


                <p>
                    <b>Description:</b>
                        ${p.description}
                </p>


                <p>
                    <b>Plant Type:</b>
                        ${p.type}
                </p>


                <p>
                    <b>Sunlight:</b>
                        ${p.sunlight}
                </p>


                <p>
                    <b>Planted:</b>
                        ${p.plantedDate}
                </p>


                <p>
                    <b>Last watered:</b>
                        ${p.lastWatered}
                </p>


                <p>
                    <b>Watering:</b>
                        ${p.wateringFrequency}
                </p>


                <form
                        action="${pageContext.request.contextPath}/plants/water"
                        method="post">

                    <input
                            type="hidden"
                            name="id"
                            value="${p.userPlantId}">

                    <button type="submit">

                        💧 Mark Watered Today

                    </button>

                </form>


                <form
                        action="${pageContext.request.contextPath}/plants/remove"
                        method="post">

                    <input
                            type="hidden"
                            name="id"
                            value="${p.userPlantId}">

                    <button
                            class="danger"
                            type="submit">

                        🗑️ Remove

                    </button>

                </form>

            </div>

        </c:forEach>

    </div>


</main>


</body>

</html>