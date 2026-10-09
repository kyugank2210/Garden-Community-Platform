<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <title>GardenConnect - Register</title>

    <style>

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            min-height: 100vh;
            font-family: Arial, Helvetica, sans-serif;
            background:
                    radial-gradient(
                            circle at center,
                            rgba(0,229,255,0.12),
                            transparent 40%
                    ),
                    #05070d !important;
            color: white !important;
        }

        .auth {
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .auth-card {
            width: 430px;
            max-width: 92%;
            padding: 40px;
            background: linear-gradient(145deg,#0d1724,#080d16);
            border: 1px solid rgba(0,229,255,0.3);
            border-radius: 20px;
            box-shadow:
                    0 0 15px rgba(0,229,255,0.15),
                    0 20px 50px rgba(0,0,0,0.5);
        }

        h1 {
            text-align: center;
            color: #00e5ff !important;
            font-size: 32px;
            text-shadow: 0 0 12px rgba(0,229,255,0.5);
        }

        p {
            color: #aeb9c9 !important;
            text-align: center;
        }

        label {
            display: block;
            color: #dce7f5 !important;
            font-weight: 700;
            margin-top: 18px;
        }

        input {
            width: 100%;
            padding: 13px;
            margin-top: 8px;
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

        button {
            width: 100%;
            padding: 13px;
            margin-top: 22px;
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
            box-shadow: 0 0 18px #00e5ff;
        }

        a {
            color: #00cfff !important;
            text-decoration: none;
        }

        a:hover {
            color: #67edff !important;
        }

        .alert {
            padding: 13px;
            border-radius: 9px;
            margin: 15px 0;
        }

        .error {
            background: #32131a;
            color: #ff9cac !important;
            border: 1px solid #ff4d67;
        }

    </style>

</head>

<body class="auth">

<div class="auth-card">

    <h1>
        🌱 Join GardenConnect
    </h1>


    <% if(request.getParameter("error")!=null){ %>

    <div class="alert error">
        <%=request.getParameter("error")%>
    </div>

    <% } %>


    <form
            action="${pageContext.request.contextPath}/register"
            method="post">

        <label>
            Name
        </label>

        <input
                name="name"
                required>


        <label>
            Email
        </label>

        <input
                type="email"
                name="email"
                required>


        <label>
            Password
        </label>

        <input
                type="password"
                name="password"
                minlength="6"
                required>


        <button type="submit">
            Create Account
        </button>

    </form>


    <p>
        Already registered?

        <a href="${pageContext.request.contextPath}/login.jsp">
            Login
        </a>
    </p>

</div>

</body>

</html>