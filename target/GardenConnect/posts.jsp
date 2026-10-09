<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <title>Community - GardenConnect</title>

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
            gap: 25px;
        }

        nav a {
            color: #e8f1ff !important;
            text-decoration: none !important;
            font-weight: 600;
        }

        nav a:hover {
            color: #00e5ff !important;
            text-shadow: 0 0 8px #00e5ff;
        }

        main {
            max-width: 1000px;
            margin: auto;
            padding: 60px 25px;
        }

        .page-title {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 35px;
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
        }

        .button:hover,
        button:hover {
            background: #00d9ff !important;
            color: #001018 !important;
            box-shadow: 0 0 15px #00e5ff;
        }

        .panel,
        .post {
            background: linear-gradient(145deg,#0d1724,#080d16) !important;
            border: 1px solid rgba(0,229,255,0.18);
            border-radius: 18px;
            padding: 28px;
            margin-bottom: 25px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.45);
        }

        .post:hover {
            border-color: #00e5ff;
            box-shadow: 0 0 25px rgba(0,229,255,0.12);
        }

        .post h2 {
            color: white !important;
            margin-top: 0;
        }

        .post p {
            color: #aeb9c9 !important;
            line-height: 1.7;
        }

        .muted {
            color: #718096 !important;
            margin-bottom: 15px;
        }

        .actions {
            display: flex;
            align-items: center;
            gap: 15px;
            margin-top: 20px;
        }

        .inline-form {
            display: flex;
            gap: 10px;
            margin-top: 20px;
        }

        .inline-form input {
            flex: 1;
            padding: 12px;
            background: #080e18 !important;
            color: white !important;
            border: 1px solid #26394f;
            border-radius: 9px;
        }

        .secondary {
            background: #101b2a !important;
            color: #00e5ff !important;
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

            .page-title,
            .inline-form {
                flex-direction: column;
                align-items: flex-start;
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

        <a href="${pageContext.request.contextPath}/plants">
            Plants
        </a>

        <a href="${pageContext.request.contextPath}/questions">
            Questions
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

    <div class="page-title">

        <h1>🌻 Community</h1>

        <a class="button"
           href="${pageContext.request.contextPath}/create-post.jsp">
            + Create Post
        </a>

    </div>


    <c:if test="${empty posts}">

        <div class="panel">

            <h2>No posts yet</h2>

            <p>
                Be the first gardener to share something!
            </p>

        </div>

    </c:if>


    <c:forEach var="p" items="${posts}">

        <div class="post">

            <h2>
                    ${p.title}
            </h2>

            <div class="muted">
                By ${p.authorName} · ${p.createdAt}
            </div>

            <p>
                    ${p.content}
            </p>


            <div class="actions">

                <form
                        action="${pageContext.request.contextPath}/posts/like"
                        method="post">

                    <input
                            type="hidden"
                            name="postId"
                            value="${p.postId}">

                    <button class="secondary">

                            ${p.likedByCurrentUser ? '💔 Unlike' : '❤️ Like'}
                        (${p.likeCount})

                    </button>

                </form>


                <span>
                    💬 ${p.commentCount} comments
                </span>

            </div>


            <form
                    class="inline-form"
                    action="${pageContext.request.contextPath}/posts/comment"
                    method="post">

                <input
                        type="hidden"
                        name="postId"
                        value="${p.postId}">

                <input
                        name="comment"
                        placeholder="Write a comment..."
                        required>

                <button type="submit">
                    Comment
                </button>

            </form>

        </div>

    </c:forEach>

</main>

</body>

</html>