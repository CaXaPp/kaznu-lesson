package org.example.cargo.endpoint;

import org.example.cargo.dto.CargoDto;
import org.example.cargo.dto.request.CargoRequest;

public interface CargoEndpoint {
    void create(CargoRequest request);

    void update(Long id, CargoRequest request);

    CargoDto get(Long id);
}
