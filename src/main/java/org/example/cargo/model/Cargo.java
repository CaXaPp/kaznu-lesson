package org.example.cargo.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.time.LocalDate;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "cargo")
public class Cargo {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Long id;

    @Column
    private String cargo;

    @Column
    private String title;

    @Column
    private String description;

    @Column
    private String location;

    @Column
    private String category;

    @Column
    @Enumerated(EnumType.STRING)
    private StatusCargo status;

    @Column
    private LocalDate date;
}
