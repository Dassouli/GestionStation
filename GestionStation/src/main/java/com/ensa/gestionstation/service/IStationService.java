package com.ensa.gestionstation.service;
import com.ensa.gestionstation.model.Station;

import java.util.List;

public interface IStationService {
    void saveStation(Station station);

    List<Station> getAllStations();

    List<Station> getStationsByVille(String ville);

    // Adjust the parameter type to match the actual type used in your Station entity
    Station getStationById(int id);

    // Adjust the parameter type to match the actual type used in your Station entity
    boolean  deleteStationById(int id);

    Station updateStation(int id, Station station);
}
