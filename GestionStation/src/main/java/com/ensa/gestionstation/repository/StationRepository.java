package com.ensa.gestionstation.repository;

import com.ensa.gestionstation.model.Station;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface StationRepository extends JpaRepository<Station,Integer>{
    List<Station> findByVille(String ville);
}
