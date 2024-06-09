package com.cargosys.app.web.servlets;

import com.cargosys.app.ejb.entity.CargoLocation;
import com.cargosys.app.ejb.entity.Country;
import com.cargosys.app.ejb.entity.User;
import com.cargosys.app.ejb.remote.CargoLocationService;
import com.cargosys.app.ejb.remote.CountryService;
import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/admin_console/cargo_location")
public class CargoLocationServlet extends HttpServlet {

    @EJB(lookup = "java:global/ear-1.0/com.cargosys.app-ejb-1.0/CountryServiceBean")
    private CountryService countryService;

    @EJB(lookup = "java:global/ear-1.0/com.cargosys.app-ejb-1.0/CargoLocationServiceBean")
    private CargoLocationService locationService;

    private List<Country> countryList;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (countryList == null){
            countryList = countryService.getAllCountries();
        }
        List<CargoLocation> cargoLocations = locationService.getAllLocations();
        req.setAttribute("countries",countryList);
        req.setAttribute("locations", cargoLocations);
        req.getRequestDispatcher("/cargo_location.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String locationName = req.getParameter("location_name");
        String countryName = req.getParameter("country_name");
        String locationURL = req.getParameter("location_url");
        Country country = countryList.get(Integer.parseInt(countryName)-1);
        User user =(User) req.getSession().getAttribute("loggedUser");
        locationService.addLocation(locationName,locationURL,country,user);
        doGet(req, resp);
    }
}
