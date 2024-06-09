<%@ page import="java.util.List" %>
<%@ page import="com.cargosys.app.ejb.entity.CargoLocation" %>
<%@ page import="com.cargosys.app.web.services.StringFormatServices" %>
<%@ page import="com.cargosys.app.ejb.entity.Route" %>

<%--
  Created by IntelliJ IDEA.
  User: Praveen
  Date: 5/14/2024
  Time: 7:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    StringFormatServices stringFormatServices = new StringFormatServices();
    List<CargoLocation> cargoLocationList = (List<CargoLocation>) request.getAttribute("cargoLocationList");
    List<Route> routeList = (List<Route>) request.getAttribute("routeList");
%>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <title>Our Locations</title>
</head>
<body>
<div class="container">
    <div class="row" style="margin-block: 100px">

        <!-- Cargo Location Details Header -->
        <div class="col-12">
            <div class="row">
                <div class="col-6">
                    <a class="text-black-50 mb-1 text-decoration-none" href="${pageContext.request.contextPath}/admin_console" style="font-size: 12px">Back To Admin Console</a>
                    <p class="text-uppercase m-0 p-0 fs-3 fw-bold text-dark">Our Routes</p>
                    <p class="text-black-50 mt-1" style="font-size: 12px">
                        Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero blanditiis
                        maxime vero similique accusantium, amet ab tempora aliquam debitis quos
                        corporis voluptas quas minima nam deserunt nihil perferendis officiis
                        repellendus.
                    </p>
                    <p class="text-danger mt-1 alert alert-danger d-none" style="font-size: 11px">
                        Only SuperAdmins and Admins can activate a Location.
                        Users have no authority; the Location remains INACTIVE until acted upon by a SuperAdmin or
                        Admin.
                    </p>
                </div>
            </div>
        </div>
        <!-- Cargo Location Details Header -->

        <!-- Add New Route -->
        <div class="col-12" style="margin-top: 50px;">
            <div class="row">
                <div class="col-12">
                    <form action="${pageContext.request.contextPath}/admin_console/cargo_route" method="post">
                        <div class="row">
                            <div class="col-2 d-grid">
                                <input type="text" class="input-field" name="route_name" placeholder="Route Name">
                            </div>
                            <div class="col-3 d-grid">
                                <select class="input-field custom-select" name="start_country_name">
                                    <option value="0">Start Location</option>
                                    <% for (CargoLocation location : cargoLocationList) {%>
                                    <option value="<%= location.getId() %>"><%= location.getName() %>
                                    </option>
                                    <%}%>
                                </select>
                            </div>
                            <div class="col-3 d-grid">
                                <select class="input-field custom-select" name="end_country_name">
                                    <option value="0">End Location</option>
                                    <% for (CargoLocation location : cargoLocationList) {%>
                                    <option value="<%= location.getId() %>"><%= location.getName() %>
                                    </option>
                                    <%}%>
                                </select>
                            </div>
                            <div class="col-2 d-grid">
                                <input type="text" class="input-field" name="estimated_time" placeholder="Estimated Days">
                            </div>
                            <div class="col-2 d-grid">
                                <input type="submit" class="input-field" value="Save">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- Add New Cargo Location -->

        <!-- Created Cargo Locations -->
        <div class="col-12" style="margin-top: 50px;">
            <div class="row">
                <div class="col-12 d-grid">
                    <table>
                        <tr>
                            <th>Id</th>
                            <th>Name</th>
                            <th>Start Location</th>
                            <th>End Location</th>
                            <th>ES Days</th>
                            <th>A / I</th>
                        </tr>

                        <% for (Route route : routeList) {%>
                        <tr>
                            <td><%= route.getId() %>
                            </td>
                            <td><%= route.getName() %>
                            </td>
                            <td><%= route.getStart_location().getName() %>
                            </td>
                            <td><%= route.getEnd_location().getName() %>
                            </td>
                            <td><%= route.getEstimated_time()%>
                            </td>
                            <td><%= stringFormatServices.getFirstIndex(route.getStatus()) %>
                            </td>
                        </tr>

                        <%}%>
                    </table>
                </div>
            </div>
        </div>
        <!-- Created Cargo Locations -->

    </div>
</div>
</body>

<style>
    .input-field {
        width: 100%;
        padding: 8px 14px;
        border: 1px solid rgb(240, 240, 240);
        border-radius: 3px;
        font-size: 14px;
        box-sizing: border-box;
        transition: border-color 0.3s ease;
    }

    .input-field:focus {
        outline: none;
        border-color: darkgray;
    }

    .input-field::placeholder {
        font-size: 13px;
        color: rgb(107, 107, 107);
    }

    .custom-select {
        background-position: right 20px center !important;
        padding-right: 10px;
        cursor: pointer;
        color: darkgray;
        font-size: 13px;
        background-color: white;
    }

    table {
        width: 100%;
        border-collapse: collapse;
    }

    table tr th {
        border: 1px solid rgb(240, 240, 240);
        text-align: center;
        padding: 8px 16px;
        font-size: 13px;
    }

    table tr td {
        border: 1px solid rgb(240, 240, 240);
        text-align: center;
        padding: 8px 16px;
        font-size: 13px;
    }


</style>
</html>
