package com.cargosys.app.ejb.entity;

import com.cargosys.app.ejb.enums.Status;
import jakarta.persistence.*;

import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = "cargo_location")
public class CargoLocation implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    private String location;
    @OneToOne
    private Country country;
    private Date create_date;
    @OneToOne
    private User user;
    private String status;
    private String description;

    public CargoLocation() {
    }
    public CargoLocation(String name, String location, Country country_id, Date create_date, User user_id) {
        this.name = name;
        this.location = location;
        this.country = country_id;
        this.create_date = create_date;
        this.user = user_id;
        if (user_id.getUser_type().equalsIgnoreCase("superadmin") || user_id.getUser_type().equalsIgnoreCase("admin")){
            this.status = Status.ACTIVE.toString();
        }else {
            this.status = Status.INACTIVE.toString();
        }
    }

    public Long getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public Country getCountry() {
        return country;
    }

    public void setCountry(Country country_id) {
        this.country = country_id;
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

    public void setUser(User user_id) {
        this.user = user_id;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return "CargoLocation{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", location='" + location + '\'' +
                ", country=" + country +
                ", create_date=" + create_date +
                ", user=" + user +
                ", status='" + status + '\'' +
                ", description='" + description + '\'' +
                '}';
    }
}
