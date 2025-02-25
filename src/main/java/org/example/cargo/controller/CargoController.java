package org.example.cargo.controller;

import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.example.cargo.dto.CargoDto;
import org.example.cargo.dto.request.CargoRequest;
import org.example.cargo.endpoint.CargoEndpoint;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@RestController
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
@RequestMapping("/cargo")
public class CargoController {
    CargoEndpoint endpoint;

    @PostMapping("/create")
    public void createCargo(@Valid @RequestBody CargoRequest request) {
        endpoint.create(request);
    }

    @PutMapping("/{id}/update")
    public void updateCargo(@PathVariable Long id, @Valid @RequestBody CargoRequest request) {
        endpoint.update(id, request);
    }

    @GetMapping("/{id}")
    public CargoDto getCargo(@PathVariable Long id) {
        return endpoint.get(id);
    }
}
