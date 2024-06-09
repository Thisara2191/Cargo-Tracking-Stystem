<%--
  Created by IntelliJ IDEA.
  User: Praveen
  Date: 5/10/2024
  Time: 11:15 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <title>Hello Cargo System</title>
</head>
<body>
<div class="container">
    <div class="row vh-100">
        <div class="col-11 mx-auto my-auto">
            <div class="row">
                <div class="col-7">
                    <h1 class="fw-bold text-uppercase">Logistics Management System</h1>
                    <p class="text-black-50 mt-3" style="font-size: 14px">
                        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quaerat placeat,
                        enim officia commodi, nisi soluta assumenda deserunt accusamus quae eligendi
                        voluptate dignissimos esse. Perspiciatis reprehenderit numquam enim accusamus
                        ex ratione provident at sequi placeat eius repudiandae iure debitis doloribus
                        reiciendis voluptatem deleniti, quod rem sed odit vel error sunt accusantium
                        quia! Dolorem quam rerum tempore blanditiis sapiente numquam minima aliquid.
                    </p>
                    <p class="text-black-50 mt-3" style="font-size: 14px">
                        Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero blanditiis
                        maxime vero similique accusantium, amet ab tempora aliquam debitis quos
                        corporis voluptas quas minima nam deserunt nihil perferendis officiis
                        repellendus.
                    </p>
                </div>
                <div class="col-5 my-auto">
                    <div class="offset-2 col-10">
                        <form method="post" action="${pageContext.request.contextPath}/login">
                            <div class="row">
                                <input type="text" name="username" placeholder="Enter the Username" class="input-field"/>
                            </div>
                            <div class="row my-3">
                                <input type="text" name="password" placeholder="Enter the Password" class="input-field" />
                            </div>
                            <div class="row">
                                <input type="submit" value="Login" class="input-field" />
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>

<style>

    body{
        background: url("${pageContext.request.contextPath}/assets/base-bg.png") no-repeat center center;
        background-size: cover;
    }

    .input-field {
        width: 100%;
        padding: 10px 15px;
        border: 1px solid #ccc;
        border-radius: 3px;
        font-size: 14px;
        box-sizing: border-box;
        transition: border-color 0.3s ease;
    }

    .input-field:focus {
        outline: none;
        border-color: darkgray;
    }
    .input-field::placeholder{
        font-size: 13px;
        color: darkgray;
    }

</style>

</html>
