package com.cargosys.app.ejb.entity;

import com.cargosys.app.ejb.enums.Status;
import jakarta.persistence.*;

import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = "route")
public class Route implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    @OneToOne
    private CargoLocation start_location;
    @OneToOne
    private CargoLocation end_location;
    @OneToOne
    private User user;
    private Date create_date;
    private String status;
    private int estimated_time;
    private String route_description;

    public Route() {
    }

    public Route(String name, CargoLocation start_location, CargoLocation end_location, User user, Date create_date, int estimated_time) {
        this.name = name;
        this.start_location = start_location;
        this.end_location = end_location;
        this.user = user;
        this.create_date = create_date;
        if (user.getUser_type().equalsIgnoreCase("superadmin") || user.getUser_type().equalsIgnoreCase("admin")){
            this.status = Status.ACTIVE.name();
        }else {
            this.status = Status.INACTIVE.name();
        }
        this.estimated_time = estimated_time;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getEstimated_time() {
        return estimated_time;
    }

    public void setEstimated_time(int estimated_time) {
        this.estimated_time = estimated_time;
    }

    public String getRoute_description() {
        return route_description;
    }

    public void setRoute_description(String route_description) {
        this.route_description = route_description;
    }

    @Override
    public String toString() {
        return "Route{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", start_location=" + start_location +
                ", end_location=" + end_location +
                ", user=" + user +
                ", create_date=" + create_date +
                ", status='" + status + '\'' +
                ", estimated_time=" + estimated_time +
                '}';
    }
}
