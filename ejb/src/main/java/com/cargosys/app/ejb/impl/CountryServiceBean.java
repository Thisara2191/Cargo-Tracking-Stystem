package com.cargosys.app.ejb.impl;

import com.cargosys.app.ejb.entity.Country;
import com.cargosys.app.ejb.remote.CountryService;
import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;

import java.util.List;

@Stateless
public class CountryServiceBean implements CountryService {
    @PersistenceContext(unitName = "PersisUnit")
    private EntityManager em;

    @Override
    public boolean addCountry(String name) {
        Country country = new Country();
        country.setName(name);
        em.persist(country);
        return true;
    }

    @Override
    public Country getCountry(String name) {
        return em.createQuery("SELECT ct FROM Country ct WHERE ct.name =:ctname", Country.class).setParameter("ctname", name).getSingleResult();
    }

    @Override
    public List<Country> getAllCountries() {
        return em.createQuery("SELECT ct FROM Country ct", Country.class).getResultList();
    }
}
