package com.cargosys.app.ejb.remote;

import com.cargosys.app.ejb.entity.*;
import jakarta.annotation.security.RolesAllowed;
import jakarta.ejb.Remote;

import java.util.Date;
import java.util.List;

@Remote
public interface ShipmentCargoService {
    public ShipmentCargo generateShipmentCargo(
            String shipment_name,
            double weight,
            int quantity,
            String cargo_type,
            String special_note,
            Date start_date,
            int requested_shipping_duration,
            String priority_level,
            CargoLocation start_location,
            CargoLocation end_location,
            User user
    );
    public ShipmentCargo saveShipmentCargo(ShipmentCargo shipment_cargo);
    public ShipmentCargo updateShipmentStatus(String shipmentTrackingId);
    public ShipmentCargo getShipmentCargo(String shipmentTrackingId);
    public List<ShipmentCargo> getAllShipmentCargo();
}
