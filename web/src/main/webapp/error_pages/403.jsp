<%--
  Created by IntelliJ IDEA.
  User: Praveen
  Date: 5/20/2024
  Time: 1:29 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
            crossorigin="anonymous"
    />
    <title>Access Denied</title>
</head>
<body>
    <div class="container">
        <div class="row vh-100">
            <div class="col-8 m-auto text-center d-grid g-0">
                <h1 class="p-0 m-0 fw-bold text-danger">Access Denied</h1>
                <p class="p-0 mt-1 text-black-50" style="font-size: 14px">
                    Certain roles within organizations are subject to restrictions,
                    preventing them from carrying out certain operations. This is crucial
                    for maintaining integrity, preventing conflicts of interest, and
                    upholding transparency. These measures bolster trust among
                    stakeholders and safeguard the organization's reputation.
                </p>
                <a class="text-decoration-none text-dark mt-3 text-decoration-underline" style="font-size: 13px;" href="${pageContext.request.contextPath}/admin_console.jsp">Back To Admin Console</a>
            </div>
        </div>
    </div>
</body>
</html>
