package com.cargosys.app.ejb.interceptor;

import com.cargosys.app.ejb.annotation.RouteDataGenerator;
import com.cargosys.app.ejb.entity.CargoLocation;
import com.cargosys.app.ejb.entity.Route;
import com.cargosys.app.ejb.entity.User;
import jakarta.interceptor.AroundInvoke;
import jakarta.interceptor.Interceptor;
import jakarta.interceptor.InvocationContext;

@RouteDataGenerator
@Interceptor
public class RouteDataGeneratorInterceptor {

    @AroundInvoke
    public Object generate(InvocationContext ic) throws Exception {

        //Get the parameters
        Object[] routeParameters = ic.getParameters();

        String routeName = (String) routeParameters[0];
        CargoLocation startLocation = (CargoLocation) routeParameters[1];
        CargoLocation endLocation = (CargoLocation) routeParameters[2];
        User user = (User) routeParameters[3];
        String EstimatedDays = String.valueOf(routeParameters[4]);


        // Get the Route Object
        Route routeObj = (Route) ic.proceed();


        // Set Route Name if it's empty
        if (routeName.equalsIgnoreCase("")) {
            routeName = startLocation.getName().split("-")[1]+"-"+endLocation.getName().split("-")[1]+"-D"+EstimatedDays;
            routeParameters[0] = routeName;
        }
        routeObj.setName(routeName);


        // Generate route description
        String description = "A new route has been created. Route Name: " + routeName
                + ". Starting from: " + startLocation.getName() + ", " + startLocation.getCountry().getName()
                + ". Ending at: " + endLocation.getName() + ", " + endLocation.getCountry().getName()
                + ". Estimated Time Duration: " + EstimatedDays + ". Created by: " + user.getEmail()
                + " (" + user.getUser_type() + ")";

        // Set Route Description
        routeObj.setRoute_description(description);

        //Set the Parameters again
        ic.setParameters(routeParameters);

        return routeObj;
    }
}
