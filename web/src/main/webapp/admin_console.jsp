<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.cargosys.app.ejb.entity.User" %>
<%@ page import="com.cargosys.app.ejb.enums.UserType" %>
<%@ page import="com.cargosys.app.ejb.entity.ShipmentCargo" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Praveen
  Date: 5/12/2024
  Time: 3:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <title>Admin Console Page</title>
</head>
<body>
<%
    User currentUser = null;
    List<ShipmentCargo> allShipmentCargo = null;

    if (request.getSession().getAttribute("loggedUser") != null || request.getAttribute("AllShipmentCargo") !=null){
        currentUser = (User)request.getSession().getAttribute("loggedUser");
        String userType = currentUser.getUser_type();

        allShipmentCargo = (List<ShipmentCargo>) request.getAttribute("AllShipmentCargo");

        pageContext.setAttribute("AllShipmentCargo", allShipmentCargo);
        pageContext.setAttribute("userType",userType);

    }else{
        response.sendRedirect(request.getContextPath()+"/");
    }
%>
<div class="container">
    <div class="row" style="margin-block: 100px">

        <!-- Logged User Details -->
        <div class="col-12">
            <div class="row">
                <div class="col-5 d-grid">
                    <p class="text-uppercase m-0 p-0 fw-bold text-black-50" style="font-size: 14px;"><%= currentUser.getUser_type()%></p>
                    <a class="fw-bold text-uppercase m-0 p-0 text-decoration-none text-dark fs-2" href="${pageContext.request.contextPath}/logout">Hello <%= currentUser.getEmail()%>,</a>
                    <p class="text-black-50 mt-2" style="font-size: 14px">
                        Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero blanditiis
                        maxime vero similique accusantium, amet ab tempora aliquam debitis quos
                        corporis voluptas quas minima nam deserunt nihil perferendis officiis
                        repellendus.
                    </p>
                </div>
                <div class="col-7 my-auto">
                    <div class="row">
                        <div class="offset-2 col-10">
                            <div class="row">
                                <div class="col-4 ps-5">
                                    <div class="row bg-light p-4" style="border-radius: 10px;">
                                        <div class="col-12 text-end">
                                            <h6 class="text-black-50 p-0 m-0" style="font-size: 14px;">Locations</h6>
                                            <h2 class="fw-bold p-0 m-0">10</h2>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-4 ps-5">
                                    <div class="row bg-light p-4" style="border-radius: 10px;">
                                        <div class="col-12 text-end">
                                            <h6 class="text-black-50 p-0 m-0" style="font-size: 14px;">Users</h6>
                                            <h2 class="fw-bold p-0 m-0">05</h2>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-4 ps-5">
                                    <div class="row bg-light p-4" style="border-radius: 10px;">
                                        <div class="col-12 text-end">
                                            <h6 class="text-black-50 p-0 m-0" style="font-size: 14px;">Shipments</h6>
                                            <h2 class="fw-bold p-0 m-0">10</h2>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Logged User Details -->

        <!-- Button Group -->
        <div class="col-12" style="margin-top: 50px;">
            <div class="row">
                <div class="col-12">
                    <!-- All Of Them -->
                    <div class="row">
                        <div class="col-3 pe-5">
                            <div class="row py-3 bg-light px-3 card-background">
                                <a class="col-12 fw-bold text-center text-uppercase text-decoration-none text-dark" href="${pageContext.request.contextPath}/admin_console/cargo_location" style="font-size: 13px; ">New Location</a>
                            </div>
                        </div>
                        <div class="col-3 pe-5">
                            <div class="row py-3 bg-light px-3 card-background">
                                <a class="col-12 fw-bold text-center text-uppercase text-decoration-none text-dark" href="${pageContext.request.contextPath}/admin_console/new_shipment" style="font-size: 13px; ">New Shipment</a>
                            </div>
                        </div>
                        <div class="col-3 pe-5">
                            <div class="row py-3 bg-light px-3 card-background">
                                <a class="col-12 fw-bold text-center text-uppercase text-decoration-none text-dark" href="${pageContext.request.contextPath}/admin_console/created_shipments" style="font-size: 13px;">Created Shipments</a>
                            </div>
                        </div>
                        <div class="col-3">
                            <div class="row py-3 bg-light px-3 card-background">
                                <a class="col-12 fw-bold text-center text-uppercase text-decoration-none text-dark" href="${pageContext.request.contextPath}/admin_console/daily_report" style="font-size: 13px;">Daily Report</a>
                            </div>
                        </div>
                    </div>
                    <!-- All Of Them -->

                    <c:if test="${userType == 'superadmin' || userType == 'admin'}">
                        <!-- Super Admin Only  -->
                        <div class="row mt-4">
                            <div class="col-3 pe-5">
                                <div class="row py-3 bg-light px-3 card-background" style="border-radius: 10px;">
                                    <a href="${pageContext.request.contextPath}/admin_console/cargo_route" class="col-12 fw-bold text-center text-uppercase text-decoration-none text-dark" style="font-size: 13px;">New Route</a>
                                </div>
                            </div>
                            <div class="col-3 pe-5">
                                <div class="row py-3 bg-light px-3 card-background" style="border-radius: 10px;">
                                    <div class="col-12 fw-bold text-center text-uppercase" style="font-size: 13px;">Approve Locations</div>
                                </div>
                            </div>
                            <div class="col-3 pe-5">
                                <div class="row py-3 bg-light px-3 card-background" style="border-radius: 10px;">
                                    <div class="col-12 fw-bold text-center text-uppercase" style="font-size: 13px;">Approve Shipments</div>
                                </div>
                            </div>
                        </div>
                        <!-- Super Admin Only  -->
                    </c:if>

                </div>
            </div>
        </div>
        <!-- Button Group -->.

        <!-- Current Shipment -->
        <div class="col-12" style="margin-top: 100px;">
            <div class="row">
                <div class="col-6">
                    <p class="text-uppercase m-0 p-0 fs-4 fw-bold text-dark">Current Shipments</p>
                    <p class="text-black-50 mt-1" style="font-size: 12px">
                        Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero blanditiis
                        maxime vero similique accusantium, amet ab tempora aliquam debitis quos
                        corporis voluptas quas minima nam deserunt nihil perferendis officiis
                        repellendus.
                    </p>
                </div>
            </div>
            <div class="row mt-4">
                <div class="col-12 d-grid" style="overflow-x: scroll">
                    <table class="mb-4">
                        <tr>
                            <th>Id</th>
                            <th>Tracking Id</th>
                            <th>Name</th>
                            <th>Start</th>
                            <th>End</th>
                            <th>Start Date</th>
                            <th>ES Days</th>
                            <th>Priority</th>
                            <th>Route</th>
                            <th>Status</th>
                        </tr>
                        <c:forEach var="shipmentCargo" items="${AllShipmentCargo}">
                            <tr>
                                <td>${shipmentCargo.id}</td>
                                <td class="${shipmentCargo.shipment_status == 'CREATED' ? 'alert-primary' : shipmentCargo.shipment_status == 'ONGOING' ? 'alert-warning' : shipmentCargo.shipment_status == 'PAUSED' ? 'alert-danger' : shipmentCargo.shipment_status == 'COMPLETED' ? 'alert-success' : ''}">
                                        ${shipmentCargo.shipment_tracking_id}
                                </td>
                                <td>${shipmentCargo.shipment_name}</td>
                                <td>${shipmentCargo.start_location.name}</td>
                                <td>${shipmentCargo.end_location.name}</td>
                                <td>${shipmentCargo.start_date}</td>
                                <td>${shipmentCargo.requested_shipping_duration}</td>
                                <td>${shipmentCargo.priority_level}</td>
                                <td>${shipmentCargo.route.name}</td>
                                <td class="${shipmentCargo.shipment_status == 'CREATED' ? 'alert-primary' : shipmentCargo.shipment_status == 'ONGOING' ? 'alert-warning' : shipmentCargo.shipment_status == 'PAUSED' ? 'alert-danger' : shipmentCargo.shipment_status == 'COMPLETED' ? 'alert-success' : ''}">
                                        ${shipmentCargo.shipment_status}
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>
        </div>
        <!-- Current Shipment -->

    </div>
</div>
<style>
    .card-background{
        border-radius: 10px;
    }
    .card-background:hover{
        background-color: rgb(230, 230, 230) !important;
    }

    table{
        width: 1800px;
        border-collapse: collapse;
    }

    table tr th{
        border: 1px solid rgb(240, 240, 240);
        text-align: center;
        padding: 8px 16px;
        font-size: 13px;
    }
    table tr td{
        border: 1px solid rgb(240, 240, 240);
        text-align: center;
        padding: 8px 16px;
        font-size: 13px;
    }

</style>
</body>
</html>
