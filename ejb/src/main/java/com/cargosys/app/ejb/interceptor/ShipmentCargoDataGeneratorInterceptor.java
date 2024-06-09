package com.cargosys.app.ejb.interceptor;

import com.cargosys.app.ejb.annotation.ShipmentCargoDataGenerator;
import com.cargosys.app.ejb.entity.CargoLocation;
import com.cargosys.app.ejb.entity.Route;
import com.cargosys.app.ejb.entity.ShipmentCargo;
import com.cargosys.app.ejb.entity.User;
import jakarta.interceptor.AroundInvoke;
import jakarta.interceptor.Interceptor;
import jakarta.interceptor.InvocationContext;

import java.util.UUID;

@ShipmentCargoDataGenerator
@Interceptor
public class ShipmentCargoDataGeneratorInterceptor {

    @AroundInvoke
    public Object generate(InvocationContext ic) throws Exception {

        System.out.println("ShipmentCargoDataGeneratorInterceptor : Generating Shipment Cargo Data ........");

        //Get the parameters
        Object[] shipmentCargoParameters = ic.getParameters();

        String shipmentCargoName = (String) shipmentCargoParameters[0];
        CargoLocation startLocation = (CargoLocation) shipmentCargoParameters[8];
        CargoLocation endLocation = (CargoLocation) shipmentCargoParameters[9];
        User user = (User) shipmentCargoParameters[10];


        // Generate Tracking ID
        String trackingId = generateTrackingId();

        // Check the CargoShipmentName
        if (shipmentCargoName.isEmpty()){
            shipmentCargoName = "BTG - "+trackingId;
        }

        // Get the ShipmentCargo Object
        ShipmentCargo shipmentCargoObj = (ShipmentCargo) ic.proceed();

        //Get the Route
        Route route = shipmentCargoObj.getRoute();
        String routeName = "";
        if (route != null){
            routeName = route.getName();
        }

        // Generate Description
        String description = "A new Shipment has been created. Shipment Name: " + shipmentCargoName
                + ". Tracking ID : " + trackingId+ ". Shipment Weight : " + shipmentCargoParameters[1]
                + ". Shipment QTY : " + shipmentCargoParameters[2]+ ". Cargo Type : " + shipmentCargoParameters[3]
                + ". Special Note : " + shipmentCargoParameters[4]
                + ". Start Date : " + shipmentCargoParameters[5]
                + ". Requested Time Duration : " + shipmentCargoParameters[6]+" Days"
                + ". Priority Level : " + shipmentCargoParameters[7]
                + ". Start Location : " + startLocation.getName()+" - "+startLocation.getCountry().getName()
                + ". End Location : " + endLocation.getName()+" - "+endLocation.getCountry().getName()
                + ". Route : " + routeName
                + ". Created by: " + user.getEmail()+ " (" + user.getUser_type() + ")";

        // Set the data to the ShipmentCargo Object
        shipmentCargoObj.setShipment_tracking_id(trackingId);
        shipmentCargoObj.setShipment_name(shipmentCargoName);
        shipmentCargoObj.setDescription(description);

        return shipmentCargoObj;
    }

    String generateTrackingId(){
        String[] split = UUID.randomUUID().toString().split("-");
        String trackingID = split[0] + split[1];
        return trackingID.toUpperCase();
    }
}
