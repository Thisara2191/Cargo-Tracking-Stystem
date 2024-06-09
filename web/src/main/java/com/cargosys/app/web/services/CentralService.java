package com.cargosys.app.web.services;

import com.cargosys.app.ejb.entity.CargoLocation;
import com.cargosys.app.ejb.entity.Route;
import com.cargosys.app.ejb.entity.ShipmentCargo;
import com.cargosys.app.ejb.enums.CargoType;
import com.cargosys.app.ejb.enums.PriorityLevel;
import com.cargosys.app.ejb.enums.ShipmentStatus;

import java.util.ArrayList;
import java.util.List;

public class CentralService {
    public List<CargoLocation> getAllStartCargoLocations(List<ShipmentCargo> shipmentCargo) {
        List<CargoLocation> allLocation = new ArrayList<>();
        if (!shipmentCargo.isEmpty()) {
            // Iterate List
            shipmentCargo.forEach(o -> {
                allLocation.add(o.getStart_location());
            });
        }
        return allLocation;
    }

    public List<CargoLocation> getAllEndCArgoLocations(List<ShipmentCargo> shipmentCargo) {
        List<CargoLocation> allLocation = new ArrayList<>();
        if (!shipmentCargo.isEmpty()) {
            // Iterate List
            shipmentCargo.forEach(o -> {
                allLocation.add(o.getEnd_location());
            });
        }
        return allLocation;
    }

    public List<Route> getAllRoutes(List<ShipmentCargo> shipmentCargo) {
        List<Route> allLocation = new ArrayList<>();
        if (!shipmentCargo.isEmpty()) {
            // Iterate List
            shipmentCargo.forEach(o -> {
                allLocation.add(o.getRoute());
            });
        }
        return allLocation;
    }

    public List<Integer> getAllEstimatedDays(List<ShipmentCargo> shipmentCargo) {
        List<Integer> allLocation = new ArrayList<>();
        if (!shipmentCargo.isEmpty()) {
            // Iterate List
            shipmentCargo.forEach(o -> {
                allLocation.add(o.getRequested_shipping_duration());
            });
        }
        return allLocation;
    }


    public List<PriorityLevel> getAllPriorityLevel() {
        return PriorityLevel.getAllPriorityLevel();
    }

    public List<ShipmentStatus> getAllShipmentStatus() {
        return ShipmentStatus.getAllShipmentStatus();
    }

    public List<CargoType> getAllCargoType() {
        return CargoType.getCargoTypes();
    }


}
