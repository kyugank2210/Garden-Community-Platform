<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <title>Create Post - GardenConnect</title>

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
            max-width: 850px;
            margin: auto;
            padding: 60px 25px;
        }

        .form-card {
            background: linear-gradient(145deg,#0d1724,#080d16) !important;
            border: 1px solid rgba(0,229,255,0.2);
            border-radius: 18px;
            padding: 35px;
            box-shadow: 0 10px 35px rgba(0,0,0,0.5);
        }

        h1 {
            color: white !important;
            font-size: 40px;
        }

        label {
            display: block;
            color: #dce7f5 !important;
            font-weight: 700;
            margin-top: 20px;
        }

        input,
        textarea {
            width: 100%;
            padding: 13px;
            margin-top: 8px;
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
            margin-top: 20px;
            padding: 12px 22px;
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

        .alert {
            padding: 14px;
            border-radius: 9px;
            margin-bottom: 20px;
        }

        .error {
            background: #32131a;
            color: #ff9cac;
            border: 1px solid #ff4d67;
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
            Plant Library
        </a>

        <a href="${pageContext.request.contextPath}/logout">
            Logout
        </a>

    </nav>

</header>


<main>

    <div class="form-card">

        <h1>
            🌿 Create a Community Post
        </h1>


        <% if(request.getParameter("error")!=null){ %>

        <div class="alert error">
            <%=request.getParameter("error")%>
        </div>

        <% } %>


        <form
                action="${pageContext.request.contextPath}/posts/create"
                method="post">

            <label>
                Title
            </label>

            <input
                    name="title"
                    maxlength="200"
                    required>


            <label>
                Content
            </label>

            <textarea
                    name="content"
                    rows="8"
                    required></textarea>


            <button type="submit">
                🚀 Publish Post
            </button>

        </form>

    </div>

</main>

</body>

</html>