package com.ensa.gestionstation.service;

import com.ensa.gestionstation.model.Service;
import com.ensa.gestionstation.repository.ServiceRepository;

import java.util.List;
@org.springframework.stereotype.Service
public class ServiceserviceImp implements IServiceService {
    private final ServiceRepository serviceRepository;

    public ServiceserviceImp(ServiceRepository serviceRepository) {
        this.serviceRepository = serviceRepository;
    }

    @Override
    public void addService(Service service) {
        serviceRepository.save(service);
    }

    @Override
    public List<Service> getAllServices() {
        return serviceRepository.findAll();
    }

    @Override
    public Service getServiceById(int id) {
        return serviceRepository.findById(id).orElse(null);
    }

    @Override
    public boolean deleteServiceById(int id) {
        if (serviceRepository.existsById(id)) {
            // Delete the station from the repository
            serviceRepository.deleteById(id);
            return true;
        } else {
            // Return false if the station doesn't exist
            return false;
        }
    }

    @Override
    public Service updateService(int id, Service service) {
        return service;
    }
    @Override
    public List<Service> getServicesByStationId(int id) {
        return serviceRepository.getServicesByStationId(id);
    }
}
