package com.cargosys.app.ejb.impl;

import com.cargosys.app.ejb.entity.User;
import com.cargosys.app.ejb.remote.AuthService;
import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;

import java.util.List;

@Stateless
public class AuthServiceBean implements AuthService {

    @PersistenceContext(unitName = "PersisUnit")
    private EntityManager em;

    @Override
    public User authentication(String email, String password) {
        System.out.println("Authentication Service Method Working..........");

        List<User> users = em.createQuery("SELECT u FROM User u WHERE u.email =:email AND u.password =:password", User.class)
                .setParameter("email", email)
                .setParameter("password", password)
                .getResultList();

        System.out.println(users.size());

        if (users.size() == 1) {
            return users.get(0);
        } else {
            return null;
        }
    }
}
