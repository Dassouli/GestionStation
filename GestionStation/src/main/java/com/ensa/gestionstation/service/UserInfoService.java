package com.ensa.gestionstation.service;

import com.ensa.gestionstation.model.UserInfo;
import com.ensa.gestionstation.repository.UserInfoRepository;
import io.jsonwebtoken.JwtException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class UserInfoService implements UserDetailsService {

    @Autowired
    private UserInfoRepository repository;

    @Autowired
    private PasswordEncoder passwordEncoder;
    @Autowired
    private JwtService jwtService;


    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Optional<UserInfo> userDetail = repository.findByEmail(username);

        return userDetail.map(userInfo -> {
            String roles = retrieveRolesByUsername(username);
            return new UserInfoDetails(userInfo, roles);
        }).orElseThrow(() -> new UsernameNotFoundException("User not found " + username));
    }

    public String retrieveRolesByUsername(String username) {
        Optional<UserInfo> userInfoOptional = repository.findByEmail(username);
        return userInfoOptional.map(UserInfo::getRoles).orElse("");
    }


    public String addUser(UserInfo userInfo) {
        try {
            // Check if the name or email already exists before adding a user
            if (repository.existsByName(userInfo.getName())) {
                return "Error adding user: Name already exists";
            }

            if (repository.existsByEmail(userInfo.getEmail())) {
                return "Error adding user: Email already exists";
            }

            userInfo.setPassword(passwordEncoder.encode(userInfo.getPassword()));
            repository.save(userInfo);
            return "User Added Successfully";
        } catch (DataIntegrityViolationException e) {
            // This exception will be thrown if the unique constraint is violated
            return "Error adding user: Name or email already exists";
        } catch (Exception e) {
            return "Error adding user: " + e.getMessage();
        }
    }

    public List<UserInfo> getAllUsers() {
        return repository.findAll();
    }
    // Get user by ID
    public Optional<UserInfo> getUserById(int userId) {
        return repository.findById(userId);
    }
    public void deleteUser(int userId) {
        repository.deleteById(userId);
    }
    public void validateToken(String token) {
        try {
            jwtService.validateToken(token);
        } catch (JwtException e) {
            // Gérez l'exception liée au JWT ici
            throw new IllegalArgumentException("Invalid token", e);
        }
    }

}