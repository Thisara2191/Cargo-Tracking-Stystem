package com.cargosys.app.ejb.remote;

import com.cargosys.app.ejb.entity.CargoLocation;
import com.cargosys.app.ejb.entity.Country;
import com.cargosys.app.ejb.entity.Route;
import com.cargosys.app.ejb.entity.User;
import jakarta.ejb.Remote;

import java.util.List;

@Remote
public interface RouteService {
    public List<Route> getRoutes(CargoLocation startLoc, CargoLocation endLoc, int estimatedTime);
    public List<Route> getRoutes(CargoLocation startLoc,CargoLocation endLoc);
    public Route setRoute(String routeName, CargoLocation startLoc, CargoLocation endLoc, User user,int estimatedTime);
    public List<Route> getAllRoutes();
}
