package org.example.cargo.dto;

import lombok.*;
import lombok.experimental.FieldDefaults;
import org.example.cargo.model.StatusCargo;

import java.time.LocalDate;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class CargoDto {
    Long id;
    String cargo;
    String title;
    String description;
    String location;
    String category;
    StatusCargo status;
    LocalDate date;
}
