package com.cargosys.app.web.servlets;

import com.cargosys.app.ejb.entity.CargoLocation;
import com.cargosys.app.ejb.entity.ShipmentCargo;
import com.cargosys.app.ejb.entity.User;
import com.cargosys.app.ejb.remote.CargoLocationService;
import com.cargosys.app.ejb.remote.ShipmentCargoService;
import com.cargosys.app.web.services.StringFormatServices;
import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.Date;
import java.util.List;

@WebServlet("/admin_console/new_shipment")
public class NewShipmentServlet extends HttpServlet {

    @EJB(lookup = "java:global/ear-1.0/com.cargosys.app-ejb-1.0/ShipmentCargoServiceBean")
    private ShipmentCargoService shipmentCargoService;

    @EJB(lookup = "java:global/ear-1.0/com.cargosys.app-ejb-1.0/CargoLocationServiceBean")
    private CargoLocationService cargoLocationService;

    private List<CargoLocation> cargoLocationList;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        if (cargoLocationList == null) {
            cargoLocationList = cargoLocationService.getAllLocations();
        }
        req.setAttribute("cargoLocationList", cargoLocationList);
        req.getRequestDispatcher("/new_shipment.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        StringFormatServices stringFormatServices = new StringFormatServices();

        String shipmentName = req.getParameter("shipment_name");
        double shipmentWeight = Double.parseDouble(req.getParameter("shipment_weight"));
        int shipmentQty = Integer.parseInt(req.getParameter("shipment_qty"));
        String shipmentCargoType = req.getParameter("shipment_cargo_type");
        String shipmentSpecialNote = req.getParameter("shipment_special_note");
        String shipmentStartDate = req.getParameter("shipment_start_date");
        int shipmentStartLocation = Integer.parseInt(req.getParameter("shipment_start_location"));
        int shipmentEndLocation = Integer.parseInt(req.getParameter("shipment_end_location"));
        int shipmentRequestEstimatedDays = Integer.parseInt(req.getParameter("shipment_request_estimated_days"));
        String shipmentPriorityLevel = req.getParameter("shipment_priority_level");


        // Get the Cargo Locations
        List<CargoLocation> locations = cargoLocationService.getAllLocations();

        // Get the Cargo Location
        CargoLocation startLocation = locations.get(shipmentStartLocation - 1);
        CargoLocation endLocation = locations.get(shipmentEndLocation - 1);

        // Get the Date
        Date shipmentDate = stringFormatServices.getDateFromString(shipmentStartDate);

        //Get the User
        User user = (User) req.getSession().getAttribute("loggedUser");

        ShipmentCargo generateShipmentCargo = shipmentCargoService.generateShipmentCargo(shipmentName, shipmentWeight, shipmentQty, shipmentCargoType, shipmentSpecialNote, shipmentDate, shipmentRequestEstimatedDays, shipmentPriorityLevel, startLocation, endLocation, user);

        if (generateShipmentCargo != null) {
            req.setAttribute("ShipmentCargoObject", generateShipmentCargo);
            req.getRequestDispatcher("/shipment_report.jsp").forward(req, resp);
        }
    }

}
