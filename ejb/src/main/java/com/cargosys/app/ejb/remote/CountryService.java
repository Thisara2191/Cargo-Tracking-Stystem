package com.cargosys.app.ejb.remote;

import com.cargosys.app.ejb.entity.Country;

import java.util.List;

public interface CountryService {
    public boolean addCountry(String name);
    public Country getCountry(String name);
    public List<Country> getAllCountries();
}
