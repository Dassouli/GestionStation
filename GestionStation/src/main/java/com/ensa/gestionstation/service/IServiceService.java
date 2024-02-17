package com.ensa.gestionstation.service;

import com.ensa.gestionstation.model.Service;

import java.util.List;

public interface IServiceService {
    void addService(Service service);

    List<Service> getAllServices();

    Service getServiceById(int id);

    boolean deleteServiceById(int id);

    Service updateService(int id, Service service);
    List<Service> getServicesByStationId(int id);
}
