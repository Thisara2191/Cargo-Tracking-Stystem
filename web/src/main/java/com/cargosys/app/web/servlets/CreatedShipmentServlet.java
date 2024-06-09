package com.cargosys.app.web.servlets;

import com.cargosys.app.ejb.entity.CargoLocation;
import com.cargosys.app.ejb.entity.Route;
import com.cargosys.app.ejb.entity.ShipmentCargo;
import com.cargosys.app.ejb.entity.User;
import com.cargosys.app.ejb.remote.ShipmentCargoService;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import jakarta.ejb.EJB;
import jakarta.ejb.EJBAccessException;
import jakarta.ejb.EJBException;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.NoResultException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/admin_console/created_shipments")
public class CreatedShipmentServlet extends HttpServlet {
    @EJB(lookup = "java:global/ear-1.0/com.cargosys.app-ejb-1.0/ShipmentCargoServiceBean")
    private ShipmentCargoService shipmentCargoService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<ShipmentCargo> allShipmentCargo = shipmentCargoService.getAllShipmentCargo();
        req.setAttribute("AllShipmentCargo", allShipmentCargo);
        req.getRequestDispatcher("/created_shipments.jsp").forward(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        List<ShipmentCargo> allShipmentCargo = shipmentCargoService.getAllShipmentCargo();
        ObjectMapper objectMapper = new ObjectMapper();
        ShipmentCargoDTOReceive shipmentCargoDTO = objectMapper.readValue(req.getReader(), ShipmentCargoDTOReceive.class);

        String shipmentTrackingId = shipmentCargoDTO.getShipment_tracking_id();
        String operation = shipmentCargoDTO.getOperation_name();

        if (operation.equalsIgnoreCase("returnObject")) {
            System.out.println("Return Object Method Working.....");
            ShipmentCargo matchedShipmentCargo = null;

            for (ShipmentCargo shipmentCargo : allShipmentCargo) {
                if (shipmentCargo.getShipment_tracking_id().equals(shipmentTrackingId)) {
                    matchedShipmentCargo = shipmentCargo;
                    break;
                }
            }
            if (matchedShipmentCargo != null) {
                resp.setContentType("application/json");
                resp.getWriter().write(new Gson().toJson(matchedShipmentCargo));
            } else {
                resp.setContentType("text/plain");

            }
        } else if (operation.equalsIgnoreCase("updateObject")) {
            System.out.println("Update Object Method Working.....");
            try {
                shipmentCargoService.updateShipmentStatus(shipmentTrackingId);
                resp.getWriter().write("Success");
            } catch (EJBAccessException e) {
                resp.getWriter().write("403");
            }
        } else {
            System.out.println("No Operations.....");
        }


    }

    static class ShipmentCargoDTOReceive {
        private String shipment_tracking_id;
        private String operation_name;

        public ShipmentCargoDTOReceive() {

        }

        public String getShipment_tracking_id() {
            return shipment_tracking_id;
        }

        public String getOperation_name() {
            return operation_name;
        }
    }


}
