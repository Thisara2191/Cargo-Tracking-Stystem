package com.cargosys.app.web.services;

import com.cargosys.app.ejb.entity.CargoLocation;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class StringFormatServices {
    public String getFirstIndex(String name){
        return String.valueOf(name.charAt(0));
    }

    public Date getDateFromString(String staringDate){
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");

        Date date = null;

        try {
            date = formatter.parse(staringDate);
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
        return date;
    }
}
