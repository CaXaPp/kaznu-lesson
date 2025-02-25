package org.example.cargo.mapper;

import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.example.cargo.dto.CargoDto;
import org.example.cargo.dto.request.CargoRequest;
import org.example.cargo.model.Cargo;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class CargoMapperImpl implements CargoMapper {

    @Override
    public Cargo create(CargoRequest cargo) {
        Cargo newCargo = new Cargo();

        setFields(cargo, newCargo);

        return newCargo;
    }

    @Override
    public Cargo update(CargoRequest request, Cargo cargo) {
        setFields(request, cargo);
        return cargo;
    }

    @Override
    public CargoDto toDto(Cargo cargo) {
        return CargoDto.builder()
                .id(cargo.getId())
                .cargo(cargo.getCargo())
                .title(cargo.getTitle())
                .description(cargo.getDescription())
                .location(cargo.getLocation())
                .category(cargo.getCategory())
                .status(cargo.getStatus())
                .date(cargo.getDate())
                .build();

    }

    private static void setFields(CargoRequest request, Cargo cargo) {
        cargo.setCargo(request.getCargo());
        cargo.setTitle(request.getTitle());
        cargo.setDescription(request.getDescription());
        cargo.setLocation(request.getLocation());
        cargo.setCategory(request.getCategory());
        cargo.setStatus(request.getStatus());
        cargo.setDate(request.getDate());
    }
}
