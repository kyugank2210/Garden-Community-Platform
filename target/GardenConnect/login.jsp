<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta http-equiv="Content-Type"
          content="text/html; charset=UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>GardenConnect - Login</title>

    <style>

        * {
            box-sizing: border-box;
        }

        html,
        body {
            margin: 0;
            padding: 0;

            width: 100%;
            min-height: 100%;

            font-family: Arial, Helvetica, sans-serif;
        }

        body {
            background:
                    radial-gradient(
                            circle at center,
                            rgba(0, 229, 255, 0.12),
                            transparent 40%
                    ),
                    #05070d;

            color: #ffffff;
        }


        /* ==============================
           LOGIN CONTAINER
           ============================== */

        .auth {
            min-height: 100vh;

            display: flex;

            align-items: center;

            justify-content: center;

            padding: 30px;
        }


        /* ==============================
           LOGIN CARD
           ============================== */

        .auth-card {
            width: 540px;

            max-width: 95%;

            padding: 55px;

            background:
                    linear-gradient(
                            145deg,
                            #0d1724,
                            #080d16
                    );

            border: 1px solid rgba(0, 229, 255, 0.35);

            border-radius: 22px;

            box-shadow:
                    0 0 15px rgba(0, 229, 255, 0.12),
                    0 20px 60px rgba(0, 0, 0, 0.55);
        }


        /* ==============================
           LOGO
           ============================== */

        .logo {
            text-align: center;

            margin-bottom: 10px;

            color: #00e5ff;

            font-size: 38px;

            font-weight: 900;

            text-shadow:
                    0 0 8px #00e5ff,
                    0 0 20px rgba(0, 229, 255, 0.45);
        }


        .subtitle {
            text-align: center;

            color: #aeb9c9;

            font-size: 20px;

            margin-bottom: 35px;
        }


        /* ==============================
           LABELS
           ============================== */

        label {
            display: block;

            color: #f1f5f9;

            font-size: 18px;

            font-weight: 700;

            margin-bottom: 8px;
        }


        /* ==============================
           INPUTS
           ============================== */

        input {
            width: 100%;

            padding: 15px 16px;

            margin-bottom: 22px;

            background: #eaf2ff;

            color: #05070d;

            border: 1px solid #9bb7d9;

            border-radius: 10px;

            font-size: 16px;

            outline: none;

            transition: 0.2s ease;
        }


        input:focus {
            border-color: #00e5ff;

            box-shadow:
                    0 0 10px rgba(0, 229, 255, 0.45);
        }


        /* ==============================
           LOGIN BUTTON
           ============================== */

        button {
            width: 100%;

            padding: 15px;

            margin-top: 5px;

            background: #0088b8;

            color: white;

            border: 1px solid #00e5ff;

            border-radius: 10px;

            font-size: 16px;

            font-weight: 800;

            cursor: pointer;

            transition: 0.2s ease;

            box-shadow:
                    0 0 10px rgba(0, 229, 255, 0.18);
        }


        button:hover {
            background: #00d9ff;

            color: #001018;

            transform: translateY(-2px);

            box-shadow:
                    0 0 10px #00e5ff,
                    0 0 25px rgba(0, 229, 255, 0.5);
        }


        /* ==============================
           REGISTER LINK
           ============================== */

        .register-text {
            text-align: center;

            margin-top: 25px;

            color: #aeb9c9;

            font-size: 18px;
        }


        .register-text a {
            color: #00e5ff;

            text-decoration: none;

            font-weight: 700;
        }


        .register-text a:hover {
            color: #67edff;

            text-shadow:
                    0 0 8px #00e5ff;
        }


        /* ==============================
           ALERTS
           ============================== */

        .alert {
            padding: 13px 15px;

            margin-bottom: 20px;

            border-radius: 9px;

            font-size: 15px;
        }


        .error {
            background: #32131a;

            color: #ff9cac;

            border: 1px solid #ff4d67;
        }


        .success {
            background: #09252a;

            color: #67edff;

            border: 1px solid #00e5ff;
        }


        /* ==============================
           MOBILE
           ============================== */

        @media (max-width: 600px) {

            .auth {
                padding: 20px;
            }

            .auth-card {
                padding: 35px 25px;
            }

            .logo {
                font-size: 30px;
            }

            .subtitle {
                font-size: 17px;
            }

        }

    </style>

</head>


<body>


<div class="auth">


    <div class="auth-card">


        <!-- LOGO -->

        <div class="logo">
            🌱 GardenConnect
        </div>


        <div class="subtitle">
            Online Gardening Community
        </div>


        <!-- ERROR -->

        <% if(request.getParameter("error") != null) { %>

        <div class="alert error">

            <%= request.getParameter("error") %>

        </div>

        <% } %>


        <!-- REGISTERED -->

        <% if(request.getParameter("registered") != null) { %>

        <div class="alert success">

            Registration successful. Please login.

        </div>

        <% } %>


        <!-- LOGIN FORM -->

        <form
                action="${pageContext.request.contextPath}/login"
                method="post">


            <label for="email">
                Email
            </label>


            <input
                    id="email"
                    type="email"
                    name="email"
                    autocomplete="email"
                    required>


            <label for="password">
                Password
            </label>


            <input
                    id="password"
                    type="password"
                    name="password"
                    autocomplete="current-password"
                    required>


            <button type="submit">
                Login
            </button>


        </form>


        <!-- REGISTER -->

        <div class="register-text">

            New gardener?

            <a href="${pageContext.request.contextPath}/register.jsp">
                Create account
            </a>

        </div>


    </div>

</div>


</body>

</html>