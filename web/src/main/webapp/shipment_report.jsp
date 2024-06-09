<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.cargosys.app.ejb.entity.ShipmentCargo" %>
<%@ page import="com.google.gson.Gson" %>

<%--
  Created by IntelliJ IDEA.
  User: Praveen
  Date: 5/18/2024
  Time: 11:36 PM
  To change this template use File | Settings | File Templates.
--%>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%


    if (request.getAttribute("ShipmentCargoObject") != null) {
        ShipmentCargo shipmentCargo = (ShipmentCargo) request.getAttribute("ShipmentCargoObject");
        pageContext.setAttribute("shipmentCargo", shipmentCargo);
        String json = new Gson().toJson(shipmentCargo);
        pageContext.setAttribute("shipmentCargoJSON", json);
    } else {
        response.sendRedirect(request.getContextPath() + "/admin_console.jsp");
    }


%>
<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js">
    </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js">
    </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js">
    </script>
    <title>Shipment Report - ${shipmentCargo.shipment_tracking_id} </title>
</head>
<body>
<div class="container">
    <div class="row" style="margin-block: 100px">

        <!-- Shipment Report & Add Button -->

        <div class="col-12 px-4">
            <div class="row">

                <!-- Shipment Report -->
                <div class="col-12">
                    <div class="row custom-background">
                        <div class="col-12" id="shipment_report_root">
                            <div class="row">
                                <div class="col-7 d-grid">
                                    <p class="text-uppercase m-0 p-0 fs-4 fw-bold text-dark">Shipment Report
                                        - ${shipmentCargo.shipment_tracking_id}</p>
                                    <p class="text-black-50 mt-1" style="font-size: 12px">
                                        Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero blanditiis
                                        maxime vero similique accusantium, amet ab tempora aliquam debitis quos
                                        corporis voluptas quas minima nam deserunt nihil perferendis officiis
                                        repellendus.
                                    </p>
                                </div>
                                <div class="col-5 d-grid"></div>
                            </div>
                            <div class="row mt-4">
                                <div class="col-12 d-grid">
                                    <table>
                                        <tr>
                                            <td>Shipment ID</td>
                                            <td>${shipmentCargo.shipment_tracking_id}</td>
                                        </tr>
                                        <tr>
                                            <td>Shipment Name</td>
                                            <td>${shipmentCargo.shipment_name}</td>
                                        </tr>
                                        <tr>
                                            <td>Weight (Tons)</td>
                                            <td>${shipmentCargo.weight}</td>
                                        </tr>
                                        <tr>
                                            <td>Quantity</td>
                                            <td>${shipmentCargo.quantity}</td>
                                        </tr>
                                        <tr>
                                            <td>Cargo Type</td>
                                            <td>${shipmentCargo.cargo_type}</td>
                                        </tr>
                                        <tr>
                                            <td>Special Note</td>
                                            <td>${shipmentCargo.special_note}</td>
                                        </tr>
                                        <tr>
                                            <td>Start Date</td>
                                            <td>${shipmentCargo.start_date}</td>
                                        </tr>
                                        <tr>
                                            <td>Shipping Duration ( Requested )</td>
                                            <td>${shipmentCargo.requested_shipping_duration}</td>
                                        </tr>
                                        <tr>
                                            <td>Priority Level</td>
                                            <td>${shipmentCargo.priority_level}</td>
                                        </tr>
                                        <tr>
                                            <td class="empty-cell" colspan="2"></td>
                                        </tr>

                                        <!-- Start Location -->
                                        <tr>
                                            <td>Start Location</td>
                                            <td class="p-0 m-0">
                                                <div style="width: 100%;">
                                                    <table class="inner-table">
                                                        <tr>
                                                            <td>Name</td>
                                                            <td>${shipmentCargo.start_location.name}
                                                                - ${shipmentCargo.start_location.country.name}</td>
                                                        </tr>
                                                        <tr>
                                                            <td>Location</td>
                                                            <td>${shipmentCargo.start_location.location}</td>
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
                                                <div style="width: 100%;">
                                                    <table class="inner-table">
                                                        <tr>
                                                            <td>Name</td>
                                                            <td>${shipmentCargo.end_location.name}
                                                                - ${shipmentCargo.end_location.country.name}</td>
                                                        </tr>
                                                        <tr>
                                                            <td>Location</td>
                                                            <td>${shipmentCargo.end_location.location}</td>
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
                                            <c:choose>
                                                <c:when test="${shipmentCargo.route != null}">
                                                    <!-- If there is a route -->
                                                    <td class="p-0 m-0">
                                                        <div style="width: 100%;">
                                                            <table class="inner-table">
                                                                <tr>
                                                                    <td>Name</td>
                                                                    <td>${shipmentCargo.route.name}</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>Description</td>
                                                                    <td>${shipmentCargo.route.route_description}
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>Estimated Days</td>
                                                                    <td>${shipmentCargo.route.estimated_time}</td>
                                                                </tr>
                                                            </table>
                                                        </div>
                                                    </td>
                                                    <!-- If there is a route -->
                                                </c:when>
                                                <c:otherwise>
                                                    <!-- No route found -->
                                                    <td class="light-red-bg">No route could be determined for the
                                                        shipment
                                                    </td>
                                                    <!-- No route found -->
                                                </c:otherwise>
                                            </c:choose>
                                        </tr>
                                        <!-- Route Details -->

                                        <tr>
                                            <td class="empty-cell" colspan="2"></td>
                                        </tr>

                                        <!-- Created User -->
                                        <tr>
                                            <td>Created By</td>
                                            <td>${shipmentCargo.user.email} - ( ${shipmentCargo.user.user_type} )</td>
                                        </tr>
                                        <!-- Created User -->

                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Shipment Report -->

                <c:if test="${shipmentCargo.route !=null}">
                    <!-- Create Shipment Button -->
                    <div class="col-12 mt-5">
                        <div class="row">
                            <div class="offset-10 col-2 d-grid g-0">
                                <button class="input-field" onclick="sendShipmentCargo()">Add New Shipment</button>
                            </div>
                        </div>
                    </div>
                    <!-- Create Shipment Button -->
                </c:if>

            </div>
        </div>

        <!-- Shipment Report & Add Button -->

    </div>
</div>

<script>

    function sendShipmentCargo() {

        const shipmentCargoObj = `${shipmentCargoJSON}`;
        const payLoad = {
            shipmentCargo: shipmentCargoObj
        }
        fetch('${pageContext.request.contextPath}/admin_console/new_shipment_report', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(payLoad)  // Use the JSON string directly
        })
            .then(response => response.text())
            .then(data => {
                if (data === "Success") {
                    alert("Shipment Saved Successfully. Shipment report will be downloaded after the alert is closed");
                    generatePDF();
                    setTimeout(function () {
                        window.location = '${pageContext.request.contextPath}/admin_console/new_shipment';
                    }, 2000);
                } else if (data === "403"){
                    window.location = '${pageContext.request.contextPath}/error_pages/403.jsp';
                }

            })
            .catch((error) => {
                console.error('Error:', error);
            });
    }

    function generatePDF() {
        const {jsPDF} = window.jspdf;

        let doc = new jsPDF('l', 'mm', [1150, 1320]);
        let pdfjs = document.querySelector('#shipment_report_root');
        const contentWidth = pdfjs.offsetWidth;
        const contentHeight = pdfjs.offsetHeight;
        const horizontalCenter = (doc.internal.pageSize.width - contentWidth) / 2;
        const verticalCenter = (doc.internal.pageSize.height - contentHeight) / 2;

        doc.html(pdfjs, {
            callback: function (doc) {
                doc.save("Report-SC-${shipmentCargo.shipment_tracking_id}.pdf");
            },
            x: horizontalCenter,
            y: verticalCenter
        });
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

    .custom-background {
        border: 1px dashed rgb(173, 173, 173);
        background-color: rgb(253, 253, 253);
        padding: 60px 60px 70px 60px;
    }


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
