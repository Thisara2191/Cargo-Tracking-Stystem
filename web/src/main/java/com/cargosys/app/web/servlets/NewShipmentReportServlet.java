package com.cargosys.app.web.servlets;

import com.cargosys.app.ejb.entity.ShipmentCargo;
import com.cargosys.app.ejb.remote.ShipmentCargoService;
import com.cargosys.app.web.dto.ShipmentCargoDTO;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import jakarta.annotation.security.RolesAllowed;
import jakarta.ejb.EJB;
import jakarta.ejb.EJBAccessException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/admin_console/new_shipment_report")
public class NewShipmentReportServlet extends HttpServlet {

    @EJB(lookup = "java:global/ear-1.0/com.cargosys.app-ejb-1.0/ShipmentCargoServiceBean")
    private ShipmentCargoService shipmentCargoService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/shipment_report.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try{
            //Response type
            resp.setContentType("text/plain");
            resp.setStatus(HttpServletResponse.SC_OK);

            ObjectMapper objectMapper = new ObjectMapper();
            ShipmentCargoDTO shipmentCargoDTO = objectMapper.readValue(req.getReader(), ShipmentCargoDTO.class);

            String shipmentCargoString = shipmentCargoDTO.getShipmentCargo();
            ShipmentCargo shipmentCargo = new Gson().fromJson(shipmentCargoString, ShipmentCargo.class);

            if (shipmentCargo != null) {
                shipmentCargoService.saveShipmentCargo(shipmentCargo);
                resp.getWriter().write("Success");
            }else{
                resp.getWriter().write("ShipmentCargo Object is null");
            }
        }catch (EJBAccessException e){
            resp.getWriter().write("403");
        }

    }
}
