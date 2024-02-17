package com.ensa.gestionstation.service;

import com.ensa.gestionstation.model.Price;

import java.util.List;

public interface IPriceService {
    void savePrice(Price price);

    List<Price> getAllPrices();

    // Adjust the parameter type to match the actual type used in your Station entity
    Price getPriceById(int id);

    // Adjust the parameter type to match the actual type used in your Station entity
    boolean  deletePriceById(int id);

    Price updatePrice(int id, Price price);
    List<Price> getPricesByStationId(int id);
}
