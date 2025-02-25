package org.example.cargo.mapper;

import org.example.cargo.dto.CargoDto;
import org.example.cargo.dto.request.CargoRequest;
import org.example.cargo.model.Cargo;

public interface CargoMapper {
    Cargo create(CargoRequest cargo);

    Cargo update(CargoRequest request, Cargo cargo);

    CargoDto toDto(Cargo cargo);
}
