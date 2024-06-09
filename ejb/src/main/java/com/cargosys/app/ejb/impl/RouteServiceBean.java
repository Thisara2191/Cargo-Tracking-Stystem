package com.cargosys.app.ejb.impl;

import com.cargosys.app.ejb.annotation.RouteDataGenerator;
import com.cargosys.app.ejb.entity.CargoLocation;
import com.cargosys.app.ejb.entity.Route;
import com.cargosys.app.ejb.entity.User;
import com.cargosys.app.ejb.remote.RouteService;
import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Objects;

@Stateless
public class RouteServiceBean implements RouteService {

    @PersistenceContext(unitName = "PersisUnit")
    private EntityManager em;

    public EntityManager getEntityManager(){
        return this.em;
    }

    @Override
    public List<Route> getRoutes(CargoLocation startLoc, CargoLocation endLoc, int estimatedTime) {
        return  em.createQuery("SELECT rt FROM Route rt WHERE rt.start_location =:startLoc AND rt.end_location=:endLoc AND rt.estimated_time =:esTime", Route.class)
                .setParameter("startLoc", startLoc)
                .setParameter("endLoc", endLoc)
                .setParameter("esTime", estimatedTime)
                .getResultList();

    }

    @Override
    public List<Route> getRoutes(CargoLocation startLoc, CargoLocation endLoc) {
        return em.createQuery("SELECT rt FROM Route rt WHERE rt.start_location =:startLoc AND rt.end_location=:endLoc", Route.class)
                .setParameter("startLoc", startLoc)
                .setParameter("endLoc", endLoc)
                .getResultList();
    }


    @Override
    @RouteDataGenerator
    public Route setRoute(String routeName, CargoLocation startLoc, CargoLocation endLoc, User user, int estimatedTime) {
        Route route = new Route(routeName, startLoc, endLoc, user, new Date(), estimatedTime);
        em.persist(route);
        return route;
    }

    @Override
    public List<Route> getAllRoutes() {
        return em.createQuery("SELECT rt FROM Route rt", Route.class).getResultList();
    }
}
