<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page import="com.cargosys.app.ejb.entity.ShipmentCargo" %>
<%@ page import="com.cargosys.app.web.services.CentralService" %>
<%@ page import="com.cargosys.app.ejb.entity.CargoLocation" %>
<%@ page import="com.cargosys.app.ejb.entity.Route" %>
<%@ page import="com.cargosys.app.ejb.enums.ShipmentStatus" %>
<%@ page import="com.cargosys.app.ejb.entity.User" %><%--
  Created by IntelliJ IDEA.
  User: Praveen
  Date: 5/20/2024
  Time: 2:21 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // Get the Services Obj
    CentralService centralService = new CentralService();

    List<ShipmentCargo> allShipmentCargo = null;
    if (request.getAttribute("AllShipmentCargo") != null) {

        // Get All The ShipmentCargo
        allShipmentCargo = (List<ShipmentCargo>) request.getAttribute("AllShipmentCargo");
        User user = (User) request.getSession().getAttribute("loggedUser");

        pageContext.setAttribute("AllShipmentCargo", allShipmentCargo);
        pageContext.setAttribute("user", user);

    } else {
        response.sendRedirect(request.getContextPath() + "/admin_console.jsp");
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
            crossorigin="anonymous"
    />
    <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"
    ></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <title>Created Shipments</title>
</head>
<body>
<div class="container">
    <div class="row">
        <!-- Created Shipments -->
        <div class="col-12" style="margin-top: 100px">
            <div class="row">
                <div class="col-6">
                    <a class="text-black-50 mb-1 text-decoration-none" href="${pageContext.request.contextPath}/admin_console" style="font-size: 12px">Back To Admin Console</a>
                    <p class="text-uppercase m-0 p-0 fs-3 fw-bold text-dark">
                        All Shipments
                    </p>
                    <p class="text-black-50 mt-1" style="font-size: 12px">
                        Lorem ipsum dolor sit, amet consectetur adipisicing elit. Eaque
                        perspiciatis aliquid a vel, asperiores aspernatur mollitia
                        magnam culpa nihil laborum?
                    </p>
                    <p class="text-danger mt-1" style="font-size: 12px">
                        By double-clicking the row, only individuals with Admin or
                        SuperAdmin privileges are authorized to modify the shipment
                        status. This measure ensures that critical updates are performed
                        exclusively by authorized personnel, thereby maintaining the
                        integrity and accuracy of shipment records
                    </p>
                </div>
            </div>
            <div class="row" style="margin-top: 60px">
                <div class="col-12">
                    <div class="row">
                        <div class="col-2 d-grid">
                            <input
                                    type="text"
                                    name="created_shipment_tracking_number"
                                    placeholder="Shipment Tracking Id"
                                    class="input-field"
                            />
                        </div>
                        <div class="col-4 d-grid">
                            <input
                                    type="text"
                                    name="created_shipment_name"
                                    placeholder="Shipment Name"
                                    class="input-field"
                            />
                        </div>
                        <div class="col-3 d-grid">
                            <select
                                    name="created_shipment_start_location"
                                    class="input-field custom-select"
                            >
                                <option value="-1">Select Start Location</option>
                                <% for (CargoLocation location : centralService.getAllStartCargoLocations(allShipmentCargo)) {
                                %>
                                <option value="<%=location.getId()%>"><%=location.getName()%>
                                </option>
                                <%}%>
                            </select>
                        </div>
                        <div class="col-3 d-grid">
                            <select
                                    name="created_shipment_end_location"
                                    class="input-field custom-select"
                            >
                                <option value="-1">Select End Location</option>
                                <% for (CargoLocation location : centralService.getAllStartCargoLocations(allShipmentCargo)) {
                                %>
                                <option value="<%=location.getId()%>"><%=location.getName()%>
                                </option>
                                <%}%>
                            </select>
                        </div>
                    </div>
                    <div class="row mt-4">
                        <div class="col-3 d-grid">
                            <select
                                    name="created_shipment_route"
                                    class="input-field custom-select"
                            >
                                <option value="-1">Select Route</option>
                                <% for (Route route : centralService.getAllRoutes(allShipmentCargo)) {
                                %>
                                <option value="<%=route.getId()%>"><%=route.getName()%>
                                </option>
                                <%}%>
                            </select>
                        </div>
                        <div class="col-2 d-grid">
                            <select
                                    name="created_shipment_es_days"
                                    class="input-field custom-select"
                            >
                                <option value="-1">Es Days</option>
                                <% for (int es_days : centralService.getAllEstimatedDays(allShipmentCargo)) {
                                %>
                                <option value="<%=es_days%>"><%=es_days%>
                                </option>
                                <%}%>
                            </select>
                        </div>
                        <div class="col-2 d-grid">
                            <select
                                    name="created_shipment_status"
                                    class="input-field custom-select"
                            >
                                <option value="-1">Select Status</option>
                                <% for (ShipmentStatus shipmentStatus : centralService.getAllShipmentStatus()) {
                                %>
                                <option value="<%=shipmentStatus.name()%>"><%=shipmentStatus.name()%>
                                </option>
                                <%}%>
                            </select>
                        </div>
                        <div class="col-3 d-grid">
                            <input
                                    type="date"
                                    name="created_shipment_start_date"
                                    class="input-field"
                            />
                        </div>
                        <div class="col-2 d-grid">
                            <select
                                    name="created_shipment_all_or_logged_user"
                                    class="input-field custom-select"
                            >
                                <option value="0">All</option>
                                <option value="${user.email}">You</option>
                            </select>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row mt-5">
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
                            <tr ondblclick="openModal(`${shipmentCargo.shipment_tracking_id}`)">
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
        <!-- Created Shipments -->
    </div>
</div>


<%--Modal--%>

<div
        class="modal fade bd-example-modal-lg"
        id="detailedShipmentCargoModal"
        tabindex="-1"
        role="dialog"
        aria-labelledby="exampleModalCenterTitle"
        aria-hidden="true"
>
    <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content">
            <div class="modal-body">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-11 mx-auto my-4">
                            <div class="row">
                                <div class="col-12">
                                    <div class="row">
                                        <div class="col-8 g-0">
                                            <h4 class="fw-bold" tagName="shipment_header">Shipment Details -
                                                JYG51323131</h4>
                                            <p class="text-black-50" style="font-size: 12px">
                                                Lorem, ipsum dolor sit amet consectetur adipisicing
                                                elit. Recusandae voluptate, earum eaque sit
                                                repudiandae impedit, vitae ex maiores temporibus
                                                itaque voluptatum at molestiae ab aut totam in nemo
                                                dolores suscipit.
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12 d-grid g-0 mt-3">
                                    <table class="reportTable">
                                        <tr>
                                            <td>Shipment ID</td>
                                            <td tagName="shipment_tracking_id">TSFDE2345</td>
                                        </tr>
                                        <tr>
                                            <td>Shipment Name</td>
                                            <td tagName="shipment_name">Nurdle-Red-TSFDE2345</td>
                                        </tr>
                                        <tr>
                                            <td>Weight (Tons)</td>
                                            <td tagName="shipment_weight">125</td>
                                        </tr>
                                        <tr>
                                            <td>Quantity</td>
                                            <td tagName="shipment_qty">01</td>
                                        </tr>
                                        <tr>
                                            <td>Cargo Type</td>
                                            <td tagName="shipment_cargo_type">Special</td>
                                        </tr>
                                        <tr>
                                            <td>Special Note</td>
                                            <td tagName="shipment_special_note">-</td>
                                        </tr>
                                        <tr>
                                            <td>Start Date</td>
                                            <td tagName="shipment_start_date">12 / 02 / 2024</td>
                                        </tr>
                                        <tr>
                                            <td>Shipping Duration ( Requested )</td>
                                            <td tagName="shipment_shipping_duration">04</td>
                                        </tr>
                                        <tr>
                                            <td>Priority Level</td>
                                            <td tagName="shipment_priority">URGENT</td>
                                        </tr>
                                        <tr>
                                            <td>Shipment Status</td>
                                            <td tagName="shipment_status">CREATED</td>
                                        </tr>
                                        <tr>
                                            <td class="empty-cell" colspan="2"></td>
                                        </tr>

                                        <!-- Start Location -->
                                        <tr>
                                            <td>Start Location</td>
                                            <td class="p-0 m-0">
                                                <div style="width: 100%">
                                                    <table class="inner-table">
                                                        <tr>
                                                            <td>Name</td>
                                                            <td tagName="shipment_start_location_name">India-IN-01 -
                                                                India
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>Location</td>
                                                            <td tagName="shipment_start_location_url">
                                                                https://www.google.com/maps?q=20.5937,78.9629
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </div>
                                            </td>
                                        </tr>
                                        <!-- Start Location -->

                                        <tr>
                                            <td class="empty-cell" colspan="2"></td>
                                        </tr>

                                        <!-- End Location -->
                                        <tr>
                                            <td>End Location</td>
                                            <td class="p-0 m-0">
                                                <div style="width: 100%">
                                                    <table class="inner-table">
                                                        <tr>
                                                            <td>Name</td>
                                                            <td tagName="shipment_end_location_name">Pakistan-PK-02 -
                                                                Pakistan
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>Location</td>
                                                            <td tagName="shipment_end_location_url">
                                                                https://www.google.com/maps?q=30.3753,69.3451
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </div>
                                            </td>
                                        </tr>
                                        <!-- End Location -->

                                        <tr>
                                            <td class="empty-cell" colspan="2"></td>
                                        </tr>

                                        <!-- Route Details -->
                                        <tr>
                                            <td>Route</td>
                                            <td class="p-0 m-0">
                                                <div style="width: 100%">
                                                    <table class="inner-table">
                                                        <tr>
                                                            <td>Name</td>
                                                            <td tagName="shipment_route_name">US-NZ-URGENT-D7</td>
                                                        </tr>
                                                        <tr>
                                                            <td>Description</td>
                                                            <td tagName="shipment_route_description">
                                                                Starting from: United States-US-01 , USA.
                                                                Ending at: New Zealand -NZ-01, New Zealand.
                                                                Estimated Time - Duration: 7. Created by:
                                                                testadmin@gmail.com (admin)
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>Estimated Days</td>
                                                            <td tagName="shipment_route_estimated_time">03</td>
                                                        </tr>
                                                    </table>
                                                </div>
                                            </td>

                                        </tr>
                                        <!-- Route Details -->

                                        <tr>
                                            <td class="empty-cell" colspan="2"></td>
                                        </tr>

                                        <!-- Created User -->
                                        <tr>
                                            <td>Created By</td>
                                            <td tagName="shipment_user">testadmin@gmail.com ( SuperAdmin )</td>
                                        </tr>
                                        <!-- Created User -->
                                    </table>
                                </div>
                                <div class="col-12 mt-4">
                                    <div class="row">
                                        <div class="offset-5 col-3 d-grid">
                                            <button type="submit" onclick="$('#detailedShipmentCargoModal').modal('hide')" class="input-field">Close</button>
                                        </div>
                                        <div class="col-4 d-grid g-0">
                                            <button type="submit" onclick="changeStatus()"
                                                    class="input-field bg-dark text-white">Change Status
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%--Modal--%>

<script>
    function openModal(tracking_id) {
        const payLoad = {
            shipment_tracking_id: tracking_id,
            operation_name: "returnObject"
        }

        fetch('${pageContext.request.contextPath}/admin_console/created_shipments', {
            method: "POST",
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(payLoad)
        }).then(response => {
            const contentType = response.headers.get('content-type');
            if (contentType && contentType.includes('application/json')) {
                return response.json();
            } else if (contentType && contentType.includes('text/plain')) {
                return response.text();
            } else {
                throw new Error('Unexpected content type');
            }
        })
            .then(data => {
                if (typeof data === 'string') {
                    console.log("Text response:", data);
                } else {
                    document.querySelector('td[tagName="shipment_tracking_id"]').innerHTML = data.shipment_tracking_id;
                    document.querySelector('td[tagName="shipment_name"]').innerHTML = data.shipment_name;
                    document.querySelector('td[tagName="shipment_weight"]').innerHTML = data.weight;
                    document.querySelector('td[tagName="shipment_qty"]').innerHTML = data.quantity;
                    document.querySelector('td[tagName="shipment_cargo_type"]').innerHTML = data.cargo_type;
                    document.querySelector('td[tagName="shipment_special_note"]').innerHTML = data.special_note;
                    document.querySelector('td[tagName="shipment_start_date"]').innerHTML = data.start_date;
                    document.querySelector('td[tagName="shipment_shipping_duration"]').innerHTML = data.requested_shipping_duration;
                    document.querySelector('td[tagName="shipment_priority"]').innerHTML = data.priority_level;
                    document.querySelector('td[tagName="shipment_start_location_name"]').innerHTML = data.start_location.name;
                    document.querySelector('td[tagName="shipment_start_location_url"]').innerHTML = data.start_location.location;
                    document.querySelector('td[tagName="shipment_end_location_name"]').innerHTML = data.end_location.name;
                    document.querySelector('td[tagName="shipment_end_location_url"]').innerHTML = data.end_location.location;
                    document.querySelector('td[tagName="shipment_route_name"]').innerHTML = data.route.name;
                    document.querySelector('td[tagName="shipment_route_description"]').innerHTML = data.route.route_description;
                    document.querySelector('td[tagName="shipment_route_estimated_time"]').innerHTML = data.route.estimated_time;
                    document.querySelector('td[tagName="shipment_user"]').innerHTML = data.user.email + " ( " + data.user.user_type + " ) ";

                    const shipmentStatus = document.querySelector('td[tagName="shipment_status"]');
                    shipmentStatus.innerHTML = data.shipment_status;
                    shipmentStatus.classList.toggle(
                        data.shipment_status === 'CREATED' ? 'alert-primary' :
                            data.shipment_status === 'ONGOING' ? 'alert-warning' :
                                data.shipment_status === 'PAUSED' ? 'alert-danger' :
                                    data.shipment_status === 'COMPLETED' ? 'alert-primary' : ''
                    );


                    $("#detailedShipmentCargoModal").modal("show");
                }
            })
            .catch(error => {
                console.error('Error:', error);
            });
    }

    function changeStatus() {

        const tracking_id = document.querySelector('td[tagName="shipment_tracking_id"]').innerHTML;
        console.log("Change Status Working... " + tracking_id);

        const payLoad = {
            shipment_tracking_id: tracking_id,
            operation_name: "updateObject"
        }

        fetch('${pageContext.request.contextPath}/admin_console/created_shipments', {
            method: "POST",
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(payLoad)
        }).then(response => response.text())
            .then(data => {
                if (data === "Success") {
                    $('#detailedShipmentCargoModal').modal('hide')
                    alert("Shipment Status Changed...........");
                    window.location = "${pageContext.request.contextPath}/admin_console/created_shipments"
                } else if (data === "403") {
                    window.location.reload();
                } else {

                }
            }).catch(reason => console.log(reason));
    }

</script>
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
        width: 1800px;
        border-collapse: collapse;
    }

    table tr{
        cursor: pointer;
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

    .reportTable {
        width: 100%;
        border-collapse: collapse;
    }

    .reportTable tr td:nth-child(1) {
        width: 30%;
    }

    .reportTable tr td:nth-child(2) {
        width: 70%;
    }

    .reportTable tr td {
        border: 1px solid rgb(245, 245, 245);
        text-align: start;
        padding: 8px 16px;
        font-size: 13px;
    }

    /* Inner Table */

    .inner-table {
        width: 100%;
        border-collapse: collapse;
    }

    .inner-table tr td:nth-child(2) {
        width: 75%;
    }

    .inner-table tr td {
        text-align: start;
        padding: 8px 16px;
        font-size: 13px;
        border-top: 1px solid rgb(245, 245, 245) !important;
    }

    .inner-table tr:nth-child(1) td {
        border: none !important;
    }

    .inner-table tr td:nth-child(1) {
        width: 25%;
        border-right: 1px solid rgb(245, 245, 245) !important;
    }

    /* Inner Table */


    .empty-cell {
        height: 40px;
        border: none !important;
    }

    .light-red-bg {
        background-color: rgb(255, 215, 215);
        color: rgb(153, 15, 15);
        padding: 18px;
    }
</style>
</html>

