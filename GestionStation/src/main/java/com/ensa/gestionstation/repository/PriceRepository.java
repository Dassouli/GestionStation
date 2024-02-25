package com.ensa.gestionstation.repository;
import com.ensa.gestionstation.model.Price;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;
public interface PriceRepository extends JpaRepository<Price,Integer>{
    List<Price> getPricesByStationId(int id);
}
