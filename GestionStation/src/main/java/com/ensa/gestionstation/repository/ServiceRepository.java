package com.ensa.gestionstation.repository;
import com.ensa.gestionstation.model.Service;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;
public interface ServiceRepository extends JpaRepository<Service,Integer> {
    List<Service> getServicesByStationId(int id);
}
