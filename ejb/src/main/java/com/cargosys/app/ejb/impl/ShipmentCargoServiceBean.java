package com.cargosys.app.ejb.impl;

import com.cargosys.app.ejb.annotation.FindRoute;
import com.cargosys.app.ejb.annotation.ShipmentCargoDataGenerator;
import com.cargosys.app.ejb.entity.*;
import com.cargosys.app.ejb.enums.ShipmentStatus;
import com.cargosys.app.ejb.remote.ShipmentCargoService;
import jakarta.annotation.security.RolesAllowed;
import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Objects;

@Stateless
public class ShipmentCargoServiceBean implements ShipmentCargoService {
    @PersistenceContext(unitName = "PersisUnit")
    private EntityManager em;

    @Override
    @FindRoute
    @ShipmentCargoDataGenerator
    @RolesAllowed({"superadmin","admin","user"})
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
    ) {

        String shipment_status = ShipmentStatus.CREATED.name();
        return new ShipmentCargo(shipment_name, weight, quantity, cargo_type, special_note, start_date, requested_shipping_duration, priority_level, start_location, end_location, user, shipment_status);
    }

    @Override
    @RolesAllowed({"superadmin","admin"})
    public ShipmentCargo saveShipmentCargo(ShipmentCargo shipment_cargo) {
        em.persist(shipment_cargo);
        return shipment_cargo;
    }

    @Override
    @RolesAllowed({"superadmin","admin"})
    public ShipmentCargo updateShipmentStatus(String shipmentTrackingId) {
        ShipmentCargo shipmentCargo = getShipmentCargo(shipmentTrackingId);
        String shipmentStatus = "";
        if (shipmentCargo.getShipment_status().equalsIgnoreCase(ShipmentStatus.CREATED.name())){
            shipmentStatus = ShipmentStatus.ONGOING.name();
        } else if (shipmentCargo.getShipment_status().equalsIgnoreCase(ShipmentStatus.ONGOING.name())) {
            shipmentStatus = ShipmentStatus.COMPLETED.name();
        } else if (shipmentCargo.getShipment_status().equalsIgnoreCase(ShipmentStatus.PAUSED.name())) {
            shipmentStatus = ShipmentStatus.ONGOING.name();
        } else {
            shipmentStatus = ShipmentStatus.COMPLETED.name();
        }
        shipmentCargo.setShipment_status(shipmentStatus);
        return em.merge(shipmentCargo);
    }

    @Override
    public ShipmentCargo getShipmentCargo(String shipmentTrackingId) {
        return em.createQuery("SELECT sc FROM ShipmentCargo sc WHERE sc.shipment_tracking_id =:shipmentTrackingId", ShipmentCargo.class)
                .setParameter("shipmentTrackingId", shipmentTrackingId)
                .getSingleResult();
    }

    @Override
    @RolesAllowed({"superadmin","admin","user"})
    public List<ShipmentCargo> getAllShipmentCargo() {
        List<ShipmentCargo> resultList = em.createQuery("SELECT sc FROM ShipmentCargo sc", ShipmentCargo.class).getResultList();
        return Objects.requireNonNullElseGet(resultList, ArrayList::new);
    }

}
