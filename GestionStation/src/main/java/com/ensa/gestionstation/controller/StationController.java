package com.ensa.gestionstation.controller;

import com.ensa.gestionstation.model.Station;
import com.ensa.gestionstation.service.IStationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/stations")
public class StationController {

    private final IStationService stationService;

    @Autowired
    public StationController(IStationService stationService) {
        this.stationService = stationService;
    }

    @GetMapping
    public ResponseEntity<List<Station>> getAllStations() {
        List<Station> stations = stationService.getAllStations();
        return new ResponseEntity<>(stations, HttpStatus.OK);
    }

    @GetMapping("/{id}")
    public ResponseEntity<Station> getStationById(@PathVariable int id) {
        Station station = stationService.getStationById(id);
        if (station != null) {
            return new ResponseEntity<>(station, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @PostMapping
    public ResponseEntity<Station> saveStation(@RequestBody Station station) {
        stationService.saveStation(station);
        return new ResponseEntity<>(station, HttpStatus.CREATED);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Station> updateStation(@PathVariable int id, @RequestBody Station station) {
        Station updatedStation = stationService.updateStation(id, station);
        if (updatedStation != null) {
            return new ResponseEntity<>(updatedStation, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteStationById(@PathVariable int id) {
        boolean deleted = stationService.deleteStationById(id);
        if (deleted) {
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }
}
