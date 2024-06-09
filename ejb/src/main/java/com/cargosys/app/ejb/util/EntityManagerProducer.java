package com.cargosys.app.ejb.util;

import jakarta.enterprise.context.ApplicationScoped;
import jakarta.enterprise.inject.Produces;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;

@ApplicationScoped
public class EntityManagerProducer {

    @PersistenceContext(unitName = "PersisUnit")
    private EntityManager em;

    @Produces
    public EntityManager produceEntityManager() {
        return em;
    }
}
