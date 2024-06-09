package com.cargosys.app.ejb.interceptor;

import com.cargosys.app.ejb.annotation.CargoLocationDataGenerator;
import com.cargosys.app.ejb.entity.CargoLocation;
import com.cargosys.app.ejb.entity.Country;
import com.cargosys.app.ejb.entity.Route;
import com.cargosys.app.ejb.entity.User;
import jakarta.interceptor.AroundInvoke;
import jakarta.interceptor.Interceptor;
import jakarta.interceptor.InvocationContext;

import java.util.Arrays;

@CargoLocationDataGenerator
@Interceptor
public class CargoLocationDataGeneratorInterceptor {

    @AroundInvoke
    public Object generate(InvocationContext ic) throws Exception {

        //Get the parameters
        Object[] cargoLocationParameters = ic.getParameters();

        String locationName = (String) cargoLocationParameters[0];
        String locationURL = (String) cargoLocationParameters[1];
        Country country = (Country) cargoLocationParameters[2];
        User user = (User) cargoLocationParameters[3];

        String[] countryNameIndexes = country.getName().toUpperCase().split("");

        // Get the CargoLocation Object
        CargoLocation cargoLocationObj = (CargoLocation) ic.proceed();

        // Set CargoLocation Name if it's empty
        if (locationName.equalsIgnoreCase("")) {
            locationName = country.getName()+"-"+countryNameIndexes[0]+countryNameIndexes[2]+"-AG";
        }
        cargoLocationObj.setName(locationName);

        // Generate route description
        String description = "A new cargo location has been created. Cargo Location Name: " + locationName
                + ". Country Name: " + country.getName()
                + ". Location URL: " + locationURL
                + ". Created by: " + user.getEmail()
                + " (" + user.getUser_type() + ")";

        // Set Cargo Location Description
        cargoLocationObj.setDescription(description);

        return cargoLocationObj;
    }
}
