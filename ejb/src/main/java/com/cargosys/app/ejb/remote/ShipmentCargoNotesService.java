package com.cargosys.app.ejb.remote;

import com.cargosys.app.ejb.entity.ShipmentCargo;
import com.cargosys.app.ejb.entity.ShipmentCargoNotes;
import com.cargosys.app.ejb.entity.User;
import jakarta.ejb.Remote;

import java.util.List;

@Remote
public interface ShipmentCargoNotesService {
    public ShipmentCargoNotes addShipmentCargoNote(ShipmentCargo shipment_cargo, String note, User user);
    public List<ShipmentCargoNotes> getShipmentCargoNotes(ShipmentCargo shipmentCargo);
    public List<ShipmentCargoNotes> getAllShipmentCargoNotes();
}
