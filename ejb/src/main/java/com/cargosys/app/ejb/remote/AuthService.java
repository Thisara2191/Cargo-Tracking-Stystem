package com.cargosys.app.ejb.remote;

import com.cargosys.app.ejb.entity.User;
import jakarta.ejb.Remote;

@Remote
public interface AuthService {
    public User authentication(String email, String password);
}
