package com.ensa.gestionstation.controller;

import com.ensa.gestionstation.model.Price;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ensa.gestionstation.service.IPriceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/price")
public class PriceController {

    private final IPriceService PriceService;

    @Autowired
    public PriceController(IPriceService priceService) {
        this.PriceService = priceService;
    }

    @GetMapping
    public ResponseEntity<List<Price>>getAllPrices() {
        List<Price> prices = PriceService.getAllPrices();
        return new ResponseEntity<>(prices, HttpStatus.OK);
    }

    @GetMapping("/{id}")
    public ResponseEntity<Price> getPriceById(@PathVariable int id) {
        Price price = PriceService.getPriceById(id);
        if (price != null) {
            return new ResponseEntity<>(price, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @PostMapping
    public ResponseEntity<Price> savePrice(@RequestBody Price price) {
        PriceService.savePrice(price);
        return new ResponseEntity<>(price, HttpStatus.CREATED);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Price> updatePrice(@PathVariable int id, @RequestBody Price price) {
        Price updatedPrice = PriceService.updatePrice(id, price);
        if (updatedPrice != null) {
            return new ResponseEntity<>(updatedPrice, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteStationById(@PathVariable int id) {
        boolean deleted = PriceService.deletePriceById(id);
        if (deleted) {
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }
}
