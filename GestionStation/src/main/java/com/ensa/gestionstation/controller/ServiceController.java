package com.ensa.gestionstation.controller;

import com.ensa.gestionstation.model.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ensa.gestionstation.service.IServiceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/service")
public class ServiceController {

    private final IServiceService ServiceService;

    @Autowired
    public ServiceController(IServiceService serviceService) {
        this.ServiceService = serviceService;
    }

    @GetMapping
    public ResponseEntity<List<Service>>getAllServices() {
        List<Service> prices = ServiceService.getAllServices();
        return new ResponseEntity<>(prices, HttpStatus.OK);
    }

    @GetMapping("/{id}")
    public ResponseEntity<Service> getPriceById(@PathVariable int id) {
        Service sr = ServiceService.getServiceById(id);
        if (sr != null) {
            return new ResponseEntity<>(sr, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }
    @GetMapping("/station/{id}")
    public ResponseEntity<List<Service>> getServicesByStationId(@PathVariable int id) {
        List<Service> services = ServiceService.getServicesByStationId(id);
        return new ResponseEntity<>(services, HttpStatus.OK);
    }
    @PostMapping
    public ResponseEntity<Service> savePrice(@RequestBody Service sr) {
        ServiceService.addService(sr);
        return new ResponseEntity<>(sr, HttpStatus.CREATED);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Service> updateService(@PathVariable int id, @RequestBody Service sr) {
        Service updatedService = ServiceService.updateService(id, sr);
        if (updatedService != null) {
            return new ResponseEntity<>(updatedService, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteStationById(@PathVariable int id) {
        boolean deleted = ServiceService.deleteServiceById(id);
        if (deleted) {
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }
}
