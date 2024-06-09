package com.cargosys.app.ejb.impl;

import com.cargosys.app.ejb.entity.ShipmentCargo;
import com.cargosys.app.ejb.entity.ShipmentCargoNotes;
import com.cargosys.app.ejb.entity.User;
import com.cargosys.app.ejb.remote.ShipmentCargoNotesService;
import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;

import java.util.List;

@Stateless
public class ShipmentCargoNotesServiceBean implements ShipmentCargoNotesService {
    @PersistenceContext(unitName = "PersisUnit")
    private EntityManager em;


    @Override
    public ShipmentCargoNotes addShipmentCargoNote(ShipmentCargo shipment_cargo, String note, User user) {
        ShipmentCargoNotes shipmentCargoNotes = new ShipmentCargoNotes(shipment_cargo, note, user);
        em.persist(shipment_cargo);
        return shipmentCargoNotes;
    }

    @Override
    public List<ShipmentCargoNotes> getShipmentCargoNotes(ShipmentCargo shipmentCargo) {
        return em.createQuery("SELECT scn FROM ShipmentCargoNotes scn WHERE scn.shipment_cargo =: shipmentCargo", ShipmentCargoNotes.class)
                .setParameter("shipmentCargo", shipmentCargo)
                .getResultList();
    }

    @Override
    public List<ShipmentCargoNotes> getAllShipmentCargoNotes() {
        return em.createQuery("SELECT scn FROM ShipmentCargoNotes scn", ShipmentCargoNotes.class)
                .getResultList();
    }
}
