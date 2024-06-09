package com.cargosys.app.web.servlets;

import com.cargosys.app.ejb.entity.ShipmentCargo;
import com.cargosys.app.ejb.remote.ShipmentCargoService;
import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/admin_console")
public class AdminConsoleServlet extends HttpServlet {
    @EJB(lookup = "java:global/ear-1.0/com.cargosys.app-ejb-1.0/ShipmentCargoServiceBean")
    private ShipmentCargoService shipmentCargoService;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<ShipmentCargo> allShipmentCargo = shipmentCargoService.getAllShipmentCargo();
        req.setAttribute("AllShipmentCargo", allShipmentCargo);
        req.getRequestDispatcher("/admin_console.jsp").forward(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("doPost is Working");
    }
}
