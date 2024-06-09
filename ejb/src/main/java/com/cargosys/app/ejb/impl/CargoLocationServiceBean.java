package com.cargosys.app.ejb.impl;

import com.cargosys.app.ejb.annotation.CargoLocationDataGenerator;
import com.cargosys.app.ejb.entity.CargoLocation;
import com.cargosys.app.ejb.entity.Country;
import com.cargosys.app.ejb.entity.User;
import com.cargosys.app.ejb.remote.CargoLocationService;
import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;

import java.util.Date;
import java.util.List;

@Stateless
public class CargoLocationServiceBean implements CargoLocationService {
    @PersistenceContext(unitName = "PersisUnit")
    private EntityManager em;


    @Override
    @CargoLocationDataGenerator
    public CargoLocation addLocation(String name, String Location, Country country, User user) {
        CargoLocation cargoLocation = new CargoLocation(name, Location, country, new Date(), user);
        em.persist(cargoLocation);
        return cargoLocation;
    }

    @Override
    public CargoLocation getLocation(String name, Country country) {
        return null;
    }

    @Override
    public List<CargoLocation> getAllLocations() {
        return em.createQuery("SELECT cgl FROM CargoLocation cgl", CargoLocation.class).getResultList();
    }
}
