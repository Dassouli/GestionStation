package com.ensa.gestionstation.service;

import com.ensa.gestionstation.model.Price;
import com.ensa.gestionstation.repository.PriceRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
@Service
public class PriceServiceImp implements IPriceService{
    @Autowired
    PriceRepository priceRepository;

    @Override
    public void savePrice(Price price) {
        priceRepository.save(price);
    }

    @Override
    public List<Price> getAllPrices() {
        return priceRepository.findAll();
    }

    @Override
    public Price getPriceById(int id) {
        return priceRepository.findById(id).orElse(null);
    }

    @Override
    public boolean deletePriceById(int id) {
        // Check if the station with the given id exists
        if (priceRepository.existsById(id)) {
            // Delete the station from the repository
            priceRepository.deleteById(id);
            return true;
        } else {
            // Return false if the station doesn't exist
            return false;
        }
    }

    @Override
    public Price updatePrice(int id, Price price) {

        return price;
    }
    @Override
    public List<Price> getPricesByStationId(int id) {
        return priceRepository.getPricesByStationId(id);
    }
}
