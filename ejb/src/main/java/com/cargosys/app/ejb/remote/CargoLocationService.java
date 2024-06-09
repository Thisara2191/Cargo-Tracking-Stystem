package com.cargosys.app.ejb.remote;

import com.cargosys.app.ejb.entity.CargoLocation;
import com.cargosys.app.ejb.entity.Country;
import com.cargosys.app.ejb.entity.User;

import java.util.List;

public interface CargoLocationService {
    public CargoLocation addLocation(String name, String Location, Country country, User user);
    public CargoLocation getLocation(String name,Country country);
    public List<CargoLocation> getAllLocations();
}
