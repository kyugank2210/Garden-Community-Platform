<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <title>Admin - GardenConnect</title>

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
            max-width: 1200px;
            margin: auto;
            padding: 60px 25px;
        }

        h1 {
            color: white !important;
            font-size: 45px;
        }

        .panel {
            background: linear-gradient(145deg,#0d1724,#080d16);
            border: 1px solid rgba(0,229,255,0.18);
            border-radius: 18px;
            padding: 25px;
            margin-bottom: 25px;
        }

        .panel p {
            color: #aeb9c9 !important;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background: #0b111c;
            border: 1px solid rgba(0,229,255,0.18);
        }

        th {
            background: #071421;
            color: #00e5ff;
            padding: 15px;
            text-align: left;
        }

        td {
            color: #dce7f5;
            padding: 14px;
            border-top: 1px solid rgba(0,229,255,0.1);
        }

        tr:hover td {
            background: rgba(0,229,255,0.04);
        }

        select {
            padding: 9px;
            background: #080e18 !important;
            color: white !important;
            border: 1px solid #26394f;
            border-radius: 7px;
        }

        button {
            padding: 9px 15px;
            background: #007fae !important;
            color: white !important;
            border: 1px solid #00e5ff;
            border-radius: 8px;
            font-weight: 700;
            cursor: pointer;
        }

        button:hover {
            background: #00d9ff !important;
            color: #001018 !important;
            box-shadow: 0 0 12px #00e5ff;
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

            main {
                overflow-x: auto;
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

        <a href="${pageContext.request.contextPath}/logout">
            Logout
        </a>

    </nav>

</header>


<main>

    <h1>
        🛠 Admin Panel
    </h1>


    <div class="panel">

        <p>
            Use this panel to manage user roles.
        </p>

    </div>


    <table>

        <tr>

            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Role</th>
            <th>Change</th>

        </tr>


        <c:forEach var="u" items="${users}">

            <tr>

                <td>
                        ${u.userId}
                </td>

                <td>
                        ${u.name}
                </td>

                <td>
                        ${u.email}
                </td>

                <td>
                        ${u.role}
                </td>

                <td>

                    <form
                            action="${pageContext.request.contextPath}/admin/role"
                            method="post">

                        <input
                                type="hidden"
                                name="userId"
                                value="${u.userId}">


                        <select name="role">

                            <option>
                                GARDENER
                            </option>

                            <option>
                                ADMIN
                            </option>

                        </select>


                        <button type="submit">
                            Update
                        </button>

                    </form>

                </td>

            </tr>

        </c:forEach>

    </table>

</main>

</body>

</html>