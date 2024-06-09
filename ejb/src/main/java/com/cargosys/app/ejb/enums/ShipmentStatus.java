package com.cargosys.app.ejb.enums;

import java.util.Arrays;
import java.util.List;

public enum ShipmentStatus {
    CREATED,ONGOING,PAUSED,COMPLETED;
    public static List<ShipmentStatus> getAllShipmentStatus(){
        return Arrays.asList(ShipmentStatus.values());
    }
}
