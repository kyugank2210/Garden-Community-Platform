<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <title>Dashboard - GardenConnect</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/style.css">

    <style>

        /* ===== FORCE DARK DASHBOARD ===== */

        body {
            background: #05070d !important;
            color: #f5f7ff !important;
        }

        header {
            background: #03060c !important;
            border-bottom: 1px solid #00e5ff !important;
            box-shadow: 0 0 20px rgba(0, 229, 255, 0.15) !important;
        }

        /* ===== BRAND ===== */

        .brand-container {
            color: white !important;
            text-decoration: none !important;
        }

        .brand-container:hover {
            color: white !important;
            text-decoration: none !important;
        }

        .brand-name {
            color: white !important;
            font-size: 30px;
            font-weight: 900;
        }

        .team-name {
            color: #00e5ff !important;
            margin-left: 25px;
            font-size: 18px;
            font-weight: 900;
            letter-spacing: 2px;
            text-shadow:
                    0 0 8px #00e5ff,
                    0 0 20px rgba(0, 229, 255, 0.5);
        }

        /* ===== NAV ===== */

        nav a {
            color: #e8f1ff !important;
            text-decoration: none !important;
            font-weight: 600;
        }

        nav a:hover {
            color: #00e5ff !important;
            text-shadow: 0 0 8px #00e5ff;
        }

        /* ===== MAIN ===== */

        main {
            background: transparent !important;
        }

        main h1 {
            color: white !important;
            text-shadow: 0 0 15px rgba(0, 229, 255, 0.15);
        }

        main > p {
            color: #9eacbd !important;
        }

        /* ===== CARDS ===== */

        .grid .card {
            background:
                    linear-gradient(
                            145deg,
                            #0c1522,
                            #080d16
                    ) !important;

            border: 1px solid rgba(0, 229, 255, 0.2) !important;

            color: white !important;

            box-shadow:
                    0 10px 35px rgba(0, 0, 0, 0.5) !important;

            transition: 0.25s ease;
        }

        .grid .card:hover {
            transform: translateY(-7px);

            border-color: #00e5ff !important;

            box-shadow:
                    0 0 10px rgba(0, 229, 255, 0.4),
                    0 0 35px rgba(0, 229, 255, 0.12) !important;
        }

        .card h2 {
            color: white !important;
        }

        .card p {
            color: #aeb9c9 !important;
        }

        /* ===== BLUE LINE ===== */

        .card::before {
            background: #00e5ff !important;

            box-shadow:
                    0 0 10px #00e5ff !important;
        }

        /* ===== BUTTONS ===== */

        .card .button {
            background: #007fae !important;

            border: 1px solid #00e5ff !important;

            color: white !important;

            text-decoration: none !important;

            box-shadow:
                    0 0 10px rgba(0, 229, 255, 0.2) !important;
        }

        .card .button:hover {
            background: #00d9ff !important;

            color: #001018 !important;

            box-shadow:
                    0 0 10px #00e5ff,
                    0 0 25px rgba(0, 229, 255, 0.5) !important;
        }

    </style>

</head>


<body>


<!-- ================= NAVBAR ================= -->

<header>

    <a class="brand-container"
       href="${pageContext.request.contextPath}/dashboard.jsp">

        <span class="brand-name">
            🌱 GardenConnect
        </span>

        <span class="team-name">
            AURA UNDEFINED
        </span>

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


<!-- ================= MAIN ================= -->

<main>

    <h1>
        Welcome, ${user.name}!
    </h1>

    <p>
        Grow, share, learn and connect with fellow gardeners.
    </p>


    <div class="grid">


        <!-- PLANT LIBRARY -->

        <div class="card">

            <h2>
                🪴 Plant Library
            </h2>

            <p>
                Explore different plants and learn about
                sunlight and watering requirements.
            </p>

            <a class="button"
               href="${pageContext.request.contextPath}/plants">
                Explore Plants
            </a>

        </div>


        <!-- MY GARDEN -->

        <div class="card">

            <h2>
                🌱 My Garden
            </h2>

            <p>
                Manage your plants and keep track of
                your garden.
            </p>

            <a class="button"
               href="${pageContext.request.contextPath}/plants/garden">
                View My Garden
            </a>

        </div>


        <!-- COMMUNITY -->

        <div class="card">

            <h2>
                🌿 Community
            </h2>

            <p>
                Share gardening experiences and connect
                with other gardeners.
            </p>

            <a class="button"
               href="${pageContext.request.contextPath}/posts">
                Visit Community
            </a>

        </div>


        <!-- QUESTIONS -->

        <div class="card">

            <h2>
                ❓ Gardening Questions
            </h2>

            <p>
                Ask questions and help other gardeners
                with their problems.
            </p>

            <a class="button"
               href="${pageContext.request.contextPath}/questions">
                View Questions
            </a>

        </div>


    </div>

</main>


</body>

</html>