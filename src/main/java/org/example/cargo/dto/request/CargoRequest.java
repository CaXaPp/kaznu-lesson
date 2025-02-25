package org.example.cargo.dto.request;

import lombok.Data;
import org.example.cargo.model.StatusCargo;

import java.time.LocalDate;

@Data
public class CargoRequest {
    private String cargo;
    private String title;
    private String description;
    private String location;
    private String category;
    private StatusCargo status;
    private LocalDate date;
}
