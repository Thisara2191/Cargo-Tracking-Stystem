package com.cargosys.app.ejb.entity;

import com.cargosys.app.ejb.enums.PriorityLevel;
import com.cargosys.app.ejb.enums.ShipmentStatus;
import jakarta.persistence.*;

import java.io.Serializable;
import java.util.Date;


@Entity
@Cacheable(value = false)
@Table(name = "shipment_cargo")
public class ShipmentCargo implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String shipment_tracking_id;
    private String shipment_name;
    private double weight;
    private int quantity;
    private String cargo_type;
    private String special_note;
    private Date start_date;
    private int requested_shipping_duration;
    private String priority_level;
    @ManyToOne
    private CargoLocation start_location;
    @ManyToOne
    private CargoLocation end_location;
    @ManyToOne
    private Route route;
    @ManyToOne
    private User user;
    private Date create_date;
    private String shipment_status;
    private String description;

    public ShipmentCargo(){
    }
    public ShipmentCargo(
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
            User user,
            String shipment_status
    ) {
        this.shipment_name = shipment_name;
        this.weight = weight;
        this.quantity = quantity;
        this.cargo_type = cargo_type;
        this.special_note = special_note;
        this.start_date = start_date;
        this.requested_shipping_duration = requested_shipping_duration;
        this.priority_level = priority_level;
        this.start_location = start_location;
        this.end_location = end_location;
        this.user = user;
        this.shipment_status = shipment_status;
        this.create_date = new Date();
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getShipment_tracking_id() {
        return shipment_tracking_id;
    }

    public void setShipment_tracking_id(String shipment_tracking_id) {
        this.shipment_tracking_id = shipment_tracking_id;
    }

    public String getShipment_name() {
        return shipment_name;
    }

    public void setShipment_name(String shipment_name) {
        this.shipment_name = shipment_name;
    }

    public double getWeight() {
        return weight;
    }

    public void setWeight(double weight) {
        this.weight = weight;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getCargo_type() {
        return cargo_type;
    }

    public void setCargo_type(String cargo_type) {
        this.cargo_type = cargo_type;
    }

    public String getSpecial_note() {
        return special_note;
    }

    public void setSpecial_note(String special_note) {
        this.special_note = special_note;
    }

    public Date getStart_date() {
        return start_date;
    }

    public void setStart_date(Date start_date) {
        this.start_date = start_date;
    }

    public int getRequested_shipping_duration() {
        return requested_shipping_duration;
    }

    public void setRequested_shipping_duration(int requested_shipping_duration) {
        this.requested_shipping_duration = requested_shipping_duration;
    }

    public String getPriority_level() {
        return priority_level;
    }

    public void setPriority_level(String priority_level) {
        this.priority_level = priority_level;
    }

    public CargoLocation getStart_location() {
        return start_location;
    }

    public void setStart_location(CargoLocation start_location) {
        this.start_location = start_location;
    }

    public CargoLocation getEnd_location() {
        return end_location;
    }

    public void setEnd_location(CargoLocation end_location) {
        this.end_location = end_location;
    }

    public Route getRoute() {
        return route;
    }

    public void setRoute(Route route) {
        this.route = route;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Date getCreate_date() {
        return create_date;
    }

    public void setCreate_date(Date create_date) {
        this.create_date = create_date;
    }

    public String getShipment_status() {
        return shipment_status;
    }

    public void setShipment_status(String shipment_status) {
        this.shipment_status = shipment_status;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }


    @Override
    public String toString() {
        return "ShipmentCargo{" +
                "id=" + id +
                ", shipment_tracking_id=" + shipment_tracking_id +
                ", shipment_name='" + shipment_name + '\'' +
                ", weight=" + weight +
                ", quantity=" + quantity +
                ", cargo_type='" + cargo_type + '\'' +
                ", special_note='" + special_note + '\'' +
                ", start_date=" + start_date +
                ", requested_shipping_duration=" + requested_shipping_duration +
                ", priority_level='" + priority_level + '\'' +
                ", start_location=" + start_location +
                ", end_location=" + end_location +
                ", route=" + route +
                ", user=" + user +
                ", create_date=" + create_date +
                ", shipment_status='" + shipment_status + '\'' +
                ", description='" + description + '\'' +
                '}';
    }
}
