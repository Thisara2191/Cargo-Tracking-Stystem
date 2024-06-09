package com.cargosys.app.web.servlets;

import com.cargosys.app.ejb.entity.CargoLocation;
import com.cargosys.app.ejb.entity.Route;
import com.cargosys.app.ejb.entity.User;
import com.cargosys.app.ejb.remote.CargoLocationService;
import com.cargosys.app.ejb.remote.RouteService;
import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/admin_console/cargo_route")
public class CargoRouteServlet extends HttpServlet {
    @EJB(lookup = "java:global/ear-1.0/com.cargosys.app-ejb-1.0/CargoLocationServiceBean")
    private CargoLocationService locationService;

    @EJB(lookup = "java:global/ear-1.0/com.cargosys.app-ejb-1.0/RouteServiceBean")
    private RouteService routeService;

    private List<CargoLocation> cargoLocationList;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        if (cargoLocationList == null){
            cargoLocationList = locationService.getAllLocations();
        }

        List<Route> routeList = routeService.getAllRoutes();
        req.setAttribute("cargoLocationList",cargoLocationList);
        req.setAttribute("routeList",routeList);
        req.getRequestDispatcher("/cargo_route.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String routeName = req.getParameter("route_name");
        String startLocation = req.getParameter("start_country_name");
        String endLocation = req.getParameter("end_country_name");
        String estimatedTime = req.getParameter("estimated_time");

        CargoLocation startLoc = cargoLocationList.get(Integer.parseInt(startLocation) - 1);
        CargoLocation endLoc = cargoLocationList.get(Integer.parseInt(endLocation) - 1);
        User user = (User) req.getSession().getAttribute("loggedUser");
        routeService.setRoute(routeName,startLoc,endLoc,user, Integer.parseInt(estimatedTime));

        doGet(req,resp);

    }
}
