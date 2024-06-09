package com.cargosys.app.ejb.entity;

import jakarta.persistence.*;

import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = "shipment_cargo_notes")
public class ShipmentCargoNotes implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @ManyToOne
    private ShipmentCargo shipment_cargo;
    private String note;
    private Date create_date;
    @ManyToOne
    private User user;

    public ShipmentCargoNotes() {

    }
    public ShipmentCargoNotes(ShipmentCargo shipment_cargo, String note, User user) {
        this.shipment_cargo = shipment_cargo;
        this.note = note;
        this.user = user;
        this.create_date = new Date();
    }


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public ShipmentCargo getShipment_cargo() {
        return shipment_cargo;
    }

    public void setShipment_cargo(ShipmentCargo shipment_cargo) {
        this.shipment_cargo = shipment_cargo;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public Date getCreate_date() {
        return create_date;
    }

    public void setCreate_date(Date create_date) {
        this.create_date = create_date;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
