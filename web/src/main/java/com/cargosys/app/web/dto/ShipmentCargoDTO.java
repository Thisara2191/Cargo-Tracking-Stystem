package com.cargosys.app.web.dto;

import com.cargosys.app.ejb.entity.CargoLocation;
import com.cargosys.app.ejb.entity.Route;
import com.cargosys.app.ejb.entity.User;
import jakarta.persistence.ManyToOne;

import java.util.Date;

public class ShipmentCargoDTO {
    private String shipmentCargo;
    public String getShipmentCargo() {
        return shipmentCargo;
    }

}
