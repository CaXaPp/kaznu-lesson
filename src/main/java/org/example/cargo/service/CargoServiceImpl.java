package org.example.cargo.service;

import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.example.cargo.model.Cargo;
import org.example.cargo.repository.CargoRepository;
import org.springframework.stereotype.Service;

import javax.persistence.EntityNotFoundException;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class CargoServiceImpl implements CargoService {
    CargoRepository cargoRepository;

    @Override
    public Cargo save(Cargo cargo) {
        return cargoRepository.save(cargo);
    }

    @Override
    public Cargo getById(Long id) {
        return cargoRepository.findById(id)
                .orElseThrow(() -> new EntityNotFoundException("Cargo with id " + id + " not found"));
    }
}
