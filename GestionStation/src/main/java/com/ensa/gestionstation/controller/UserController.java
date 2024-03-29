package com.ensa.gestionstation.controller;

import com.ensa.gestionstation.model.AuthRequest;
import com.ensa.gestionstation.model.UserInfo;
import com.ensa.gestionstation.service.JwtService;
import com.ensa.gestionstation.service.UserInfoDetails;
import com.ensa.gestionstation.service.UserInfoService;
import io.jsonwebtoken.JwtException;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.MailException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.AuthenticationServiceException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;
import java.util.Optional;

@RestController
@RequiredArgsConstructor
@CrossOrigin(origins = "http://localhost:*")
@RequestMapping("/v1/auth")
public class UserController {

    @Autowired
    private UserInfoService userInfoService;

    @Autowired
    private JwtService jwtService;

    @Autowired
    private AuthenticationManager authenticationManager;
    @Autowired
    private JavaMailSender emailSender;
    @PostMapping("/forgot-password")
    public ResponseEntity<String> forgotPassword(@RequestParam("email") String email) {
        // Check if the email exists in the database
        Optional<UserInfo> userOptional = userInfoService.findByEmail(email);
        if (userOptional.isPresent()) {
            UserInfo user = userOptional.get();

            // Generate a new password
            String newPassword = generateNewPassword();

            // Update the user's password in the database
            user.setPassword(newPassword);
            userInfoService.updateUser(user);

            // Send the new password to the user via email
            try {
                sendPasswordResetEmail(user.getEmail(), newPassword);
                return new ResponseEntity<>("Password reset instructions sent to your email.", HttpStatus.OK);
            } catch (MailException e) {
                return new ResponseEntity<>("Failed to send password reset email: " + e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
            }
        } else {
            return new ResponseEntity<>("Email address not found.", HttpStatus.NOT_FOUND);
        }
    }

    private String generateNewPassword() {
        // Generate a new password (you can implement your own logic here)
        return "newPassword123";
    }

    private void sendPasswordResetEmail(String to, String newPassword) throws MailException {
        // Create a SimpleMailMessage
        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(to);
        message.setSubject("Password Reset");
        message.setText("Your new password is: " + newPassword);

        // Send the email
        emailSender.send(message);
    }
    @GetMapping("/generateToken/validate")
    public String validateToken(@RequestParam("token") String token) {
        try {
            userInfoService.validateToken(token );
            return "Token is valid";
        } catch (JwtException e) {
            // Log the details of the exception
            e.printStackTrace();
            // You can also log specific information like e.getMessage() or e.getCause()
            return "Invalid token";
        }
    }
    @GetMapping("/validation")
    public String validationT(@RequestParam("token") String token)
    {try {
        jwtService.extractUsername(token);
        return "true";
    }catch (Exception e){
        return "false";
    }
    }
    // Get all users
    @GetMapping
    public ResponseEntity<?> getAllUsers() {
        try {
            List<UserInfo> users = userInfoService.getAllUsers();
            return new ResponseEntity<>(users, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>("Failed to retrieve users: " + e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
    // Get user by ID
    @GetMapping("/{userId}")
    public ResponseEntity<UserInfo> getUserById(@PathVariable int userId) {
        return userInfoService.getUserById(userId)
                .map(user -> new ResponseEntity<>(user, HttpStatus.OK))
                .orElseGet(() -> new ResponseEntity<>(HttpStatus.NOT_FOUND));
    }


    @PostMapping()
    public ResponseEntity<String> createUser(@RequestBody UserInfo userInfo) {
        try {
            String result = userInfoService.addUser(userInfo);
            if (result.equals("User Added Successfully")) {
                return new ResponseEntity<>(result, HttpStatus.CREATED);
            } else {
                return new ResponseEntity<>(result, HttpStatus.BAD_REQUEST);
            }
        } catch (Exception e) {
            return new ResponseEntity<>("Error creating user: " + e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
    // Delete user
    @DeleteMapping("/{userId}")
    public ResponseEntity<Void> deleteUser(@PathVariable int userId) {
        userInfoService.deleteUser(userId);
        return new ResponseEntity<>(HttpStatus.NO_CONTENT);
    }

    @PostMapping("/token")
    public ResponseEntity<Map<String, String>> authenticateAndGetToken(@RequestBody AuthRequest authRequest) {
        try {
            // Authenticate the user using the provided credentials
            Authentication authentication = authenticationManager.authenticate(
                    new UsernamePasswordAuthenticationToken(authRequest.getUsername(), authRequest.getPassword())
            );

            if (authentication.isAuthenticated()) {
                UserInfoDetails userDetails = (UserInfoDetails) authentication.getPrincipal();
                String roles = userDetails.getRole();

                // Utilisez le JwtService pour générer un token avec le rôle
                Map<String, String> tokenAndMessage = jwtService.generateTokenAndMessage(authRequest.getUsername(), roles);

                // Return the generated token and message
                return ResponseEntity.ok(tokenAndMessage);
            } else {
                // If authentication fails, return a 401 Unauthorized response
                return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(null);
            }
        } catch (AuthenticationServiceException e) {
            // Handle authentication exceptions, such as bad credentials
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(null);
        }
    }

    //statistic

}