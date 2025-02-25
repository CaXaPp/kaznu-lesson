package org.example.cargo.service;

import org.example.cargo.model.Cargo;

public interface CargoService {
    Cargo save(Cargo cargo);
    Cargo getById(Long id);
}
