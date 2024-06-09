package com.cargosys.app.ejb.interceptor;

import com.cargosys.app.ejb.annotation.FindRoute;
import com.cargosys.app.ejb.entity.CargoLocation;
import com.cargosys.app.ejb.entity.Route;
import com.cargosys.app.ejb.entity.ShipmentCargo;
import jakarta.inject.Inject;
import jakarta.interceptor.AroundInvoke;
import jakarta.interceptor.Interceptor;
import jakarta.interceptor.InvocationContext;
import jakarta.persistence.EntityManager;
import java.util.List;
import java.util.Random;

@FindRoute
@Interceptor
public class RouteFindInterceptor {

    @Inject
    private EntityManager em;

    @AroundInvoke
    public Object findRoute(InvocationContext ic) throws Exception{

        System.out.println("RouteFindInterceptor : Finding the best route ......");

        // Get the Parameters
        Object[] shipmentCargoParameters = ic.getParameters();
        int estimatedTime = Integer.parseInt(shipmentCargoParameters[6].toString());

        CargoLocation startLocation = (CargoLocation) shipmentCargoParameters[8];
        CargoLocation endLocation = (CargoLocation) shipmentCargoParameters[9];

        // Get the Shipment Cargo Object
        ShipmentCargo cargo = (ShipmentCargo) ic.proceed();

        // Get teh Best Route
        Route bestRoute = null;

        if (em != null) {
            List<Route> routeList = em.createQuery(
                            "SELECT r FROM Route r WHERE r.start_location = :startLocation AND r.end_location = :endLocation AND r.estimated_time <= :estimatedTime",
                            Route.class)
                    .setParameter("startLocation", startLocation)
                    .setParameter("endLocation", endLocation)
                    .setParameter("estimatedTime", estimatedTime)
                    .getResultList();

            System.out.println("RouteFindInterceptor: Total Routes Found: " + routeList.size());

            if (!routeList.isEmpty()) {
                bestRoute = routeList.size() == 1 ? routeList.get(0) : getRandomRoute(routeList);
            }
        }
        // Set the Route
        cargo.setRoute(bestRoute);

        String routeName = "";
        if (bestRoute !=null){
            routeName = bestRoute.getName();
        }

        System.out.println("RouteFindInterceptor : Found Route ...... : "+routeName);

        return cargo;
    }

    Route getRandomRoute(List<Route> routes){
        Random random = new Random();
        int randomIndex = random.nextInt(routes.size());
        return routes.get(randomIndex);
    }


}
