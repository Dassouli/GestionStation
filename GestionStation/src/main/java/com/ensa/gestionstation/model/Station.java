package com.ensa.gestionstation.model;

import lombok.*;

import javax.persistence.*;
@Entity
@Data
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Station {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String nom;
    private String logoUrl;
    private String adresse;
    private String ville;
    private float latitude;
    private float longitude;


}
