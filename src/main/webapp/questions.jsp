<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <title>Questions - GardenConnect</title>

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
        }

        h2 {
            color: white !important;
        }

        .form-card,
        .question {
            display: block;
            background: linear-gradient(145deg,#0d1724,#080d16) !important;
            border: 1px solid rgba(0,229,255,0.18);
            border-radius: 18px;
            padding: 28px;
            margin-bottom: 25px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.45);
        }

        .question {
            text-decoration: none !important;
            color: white !important;
            transition: 0.25s;
        }

        .question:hover {
            border-color: #00e5ff;
            transform: translateY(-4px);
            box-shadow: 0 0 25px rgba(0,229,255,0.12);
        }

        .question p {
            color: #aeb9c9 !important;
        }

        .muted {
            color: #718096 !important;
        }

        input,
        textarea {
            width: 100%;
            padding: 13px;
            margin: 10px 0 18px;
            background: #080e18 !important;
            color: white !important;
            border: 1px solid #26394f;
            border-radius: 9px;
            outline: none;
        }

        input:focus,
        textarea:focus {
            border-color: #00e5ff;
            box-shadow: 0 0 9px rgba(0,229,255,0.3);
        }

        button {
            padding: 12px 20px;
            background: #007fae !important;
            color: white !important;
            border: 1px solid #00e5ff;
            border-radius: 9px;
            font-weight: 700;
            cursor: pointer;
        }

        button:hover {
            background: #00d9ff !important;
            color: #001018 !important;
            box-shadow: 0 0 15px #00e5ff;
        }

        label {
            color: #dce7f5 !important;
            font-weight: 700;
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

        <a href="${pageContext.request.contextPath}/posts">
            Community
        </a>

        <a href="${pageContext.request.contextPath}/plants">
            Plants
        </a>

        <a href="${pageContext.request.contextPath}/notifications">
            🔔
        </a>

        <a href="${pageContext.request.contextPath}/logout">
            Logout
        </a>

    </nav>

</header>


<main>

    <h1>
        ❓ Gardening Questions
    </h1>


    <div class="form-card">

        <h2>
            Ask a Question
        </h2>

        <form
                action="${pageContext.request.contextPath}/questions/create"
                method="post">

            <label>
                Question Title
            </label>

            <input
                    name="title"
                    placeholder="Question title"
                    required>


            <label>
                Description
            </label>

            <textarea
                    name="description"
                    rows="4"
                    placeholder="Describe your problem..."
                    required></textarea>


            <button type="submit">
                Ask Community
            </button>

        </form>

    </div>


    <c:forEach var="q" items="${questions}">

        <a class="question"
           href="${pageContext.request.contextPath}/questions/view?id=${q.questionId}">

            <h2>
                    ${q.title}
            </h2>

            <p>
                    ${q.description}
            </p>

            <div class="muted">

                Asked by ${q.authorName}
                · 💬 ${q.answerCount} answers
                · ${q.createdAt}

            </div>

        </a>

    </c:forEach>

</main>

</body>

</html>