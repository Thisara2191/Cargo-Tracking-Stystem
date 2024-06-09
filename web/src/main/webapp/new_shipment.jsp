<%@ page import="com.cargosys.app.ejb.entity.ShipmentCargo" %>
<%@ page import="com.cargosys.app.web.services.CentralService" %>
<%@ page import="com.cargosys.app.ejb.enums.CargoType" %>
<%@ page import="com.cargosys.app.ejb.entity.CargoLocation" %>
<%@ page import="com.cargosys.app.ejb.enums.PriorityLevel" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Praveen
  Date: 5/17/2024
  Time: 7:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    CentralService service = new CentralService();
    List<CargoLocation> cargoLocationList = (List<CargoLocation>) request.getAttribute("cargoLocationList");
    if (request.getAttribute("shipmentReport") == null) {
        request.setAttribute("shipmentReport", null);
    }
%>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <title>New Shipment</title>
</head>
<body>
<div class="container">
    <div class="row vh-100">
        <div class="col-12 mx-auto my-auto">
            <div class="row">
                <!-- Shipment Details Header -->
                <div class="col-12">
                    <div class="row">
                        <div class="col-6">
                            <a class="text-black-50 mb-1 text-decoration-none" href="${pageContext.request.contextPath}/admin_console" style="font-size: 12px">Back To Admin Console</a>
                            <p class="text-uppercase m-0 p-0 fs-3 fw-bold text-dark">New Shipment</p>
                            <p class="text-black-50 mt-1" style="font-size: 12px">
                                Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero blanditiis
                                maxime vero similique accusantium, amet ab tempora aliquam debitis quos
                                corporis voluptas quas minima nam deserunt nihil perferendis officiis
                                repellendus.
                            </p>
                        </div>
                    </div>
                </div>
                <!-- Shipment Details Header -->

                <!-- Generate New Shipment -->
                <div class="col-12" style="margin-top: 50px;">
                    <div class="row">
                        <div class="col-12">
                            <form action="${pageContext.request.contextPath}/admin_console/new_shipment" method="post">
                                <div class="row">
                                    <div class="col-5 d-grid">
                                        <input type="text" class="input-field" name="shipment_name"
                                               placeholder="Shipment Name">
                                    </div>
                                    <div class="col-2 d-grid">
                                        <input type="number" name="shipment_weight" class="input-field"
                                               placeholder="Apx Weight ( Tons )">
                                    </div>
                                    <div class="col-2 d-grid">
                                        <input type="number" class="input-field" name="shipment_qty"
                                               placeholder="Quantity"/>
                                    </div>
                                    <div class="col-3 d-grid">
                                        <select class="input-field custom-select" name="shipment_cargo_type">
                                            <option value="-1">Cargo Type</option>
                                            <% for (CargoType cargoType : service.getAllCargoType()) {%>
                                            <option value="<%= cargoType.name() %>"><%= cargoType.name() %>
                                            </option>
                                            <%}%>
                                        </select>
                                    </div>

                                    <div class="col-9 d-grid my-4">
                                        <input type="text" class="input-field" name="shipment_special_note"
                                               placeholder="Special Note">
                                    </div>
                                    <div class="col-3 d-grid my-4">
                                        <input type="date" class="input-field" name="shipment_start_date"
                                               placeholder="Start Date">
                                    </div>

                                    <div class="col-3 d-grid">
                                        <select class="input-field custom-select" name="shipment_start_location">
                                            <option value="-1">Start Location</option>
                                            <% for (CargoLocation cargoLocation : cargoLocationList) {%>
                                            <option value="<%= cargoLocation.getId() %>"><%= cargoLocation.getName() %>
                                            </option>
                                            <%}%>
                                        </select>
                                    </div>
                                    <div class="col-3 d-grid">
                                        <select class="input-field custom-select" name="shipment_end_location">
                                            <option value="-1">End Location</option>
                                            <% for (CargoLocation cargoLocation : cargoLocationList) {%>
                                            <option value="<%= cargoLocation.getId() %>"><%= cargoLocation.getName() %>
                                            </option>
                                            <%}%>
                                        </select>
                                    </div>
                                    <div class="col-2 d-grid">
                                        <input type="text" class="input-field" name="shipment_request_estimated_days"
                                               placeholder="ES Days">
                                    </div>
                                    <div class="col-2 d-grid">
                                        <select class="input-field custom-select" name="shipment_priority_level">
                                            <option value="-1">Priority Level</option>
                                            <% for (PriorityLevel priorityLevel : service.getAllPriorityLevel()) {%>
                                            <option value="<%= priorityLevel.name() %>"><%= priorityLevel.name() %>
                                            </option>
                                            <%}%>
                                        </select>
                                    </div>
                                    <div class="col-2 d-grid">
                                        <input type="submit" class="input-field" value="Generate">
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <!-- Generate New Shipment -->

                <!-- Message -->
                <div class="col-8 mt-5 g-0 px-3">
                    <p class="p-0 mt-1 text-danger" style="font-size: 12px">
                        All users are able to check the availability of shipments, yet only those designated as
                        SuperAdmins or admins hold the authority to settle a shipment. This distinction ensures
                        adherence to protocols, minimizes discrepancies, and reinforces accountability within the
                        system.
                    </p>
                </div>
                <!-- Message -->

            </div>
        </div>
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

    .input-field[type="date"] {
        color: gray;
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

    table tr td:nth-child(1) {
        width: 30%;
    }

    table tr td:nth-child(2) {
        width: 70%;
    }

    table tr td {
        border: 1px solid rgb(245, 245, 245);
        text-align: start;
        padding: 8px 16px;
        font-size: 13px;
    }


</style>
</html>
