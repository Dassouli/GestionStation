package com.ensa.gestionstation.repository;

import com.ensa.gestionstation.model.UserInfo;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface UserInfoRepository extends JpaRepository<UserInfo,Integer> {
    boolean existsByName(String name);
    boolean existsByEmail(String email);
    Optional<UserInfo> findByEmail(String email);


}

