package com.ensa.gestionstation.service;

import com.ensa.gestionstation.model.Station;
import com.ensa.gestionstation.repository.StationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
@Service
public class StationServiceImp implements IStationService {

    @Autowired
    StationRepository stationRepository;

    @Override
    public void saveStation(Station station) {
        stationRepository.save(station);
    }

    @Override
    public List<Station> getAllStations() {
        return stationRepository.findAll();
    }

    @Override
    public Station getStationById(int id) {
        return stationRepository.findById(id).orElse(null);
    }

    @Override
    public boolean deleteStationById(int id) {
        // Check if the station with the given id exists
        if (stationRepository.existsById(id)) {
            // Delete the station from the repository
            stationRepository.deleteById(id);
            return true;
        } else {
            // Return false if the station doesn't exist
            return false;
        }
    }


    @Override
    public Station updateStation(int id, Station station) {

        return station;
    }
}