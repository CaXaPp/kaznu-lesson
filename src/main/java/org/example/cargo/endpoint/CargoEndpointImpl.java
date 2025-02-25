package org.example.cargo.endpoint;

import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.example.cargo.dto.CargoDto;
import org.example.cargo.dto.request.CargoRequest;
import org.example.cargo.mapper.CargoMapper;
import org.example.cargo.model.Cargo;
import org.example.cargo.service.CargoService;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class CargoEndpointImpl implements CargoEndpoint {
    CargoService service;
    CargoMapper mapper;

    @Override
    public void create(CargoRequest request) {
        service.save(mapper.create(request));
    }

    @Override
    public void update(Long id, CargoRequest request) {
        Cargo cargoToUpdate = mapper.update(request, service.getById(id));
        service.save(cargoToUpdate);
    }

    @Override
    public CargoDto get(Long id) {
        Cargo cargo = service.getById(id);
        return mapper.toDto(cargo);
    }
}
