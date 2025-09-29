package com.xworkz.cafe.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrderDto {
    private int id;                 // Order ID
    private String userEmail;       // User email
    private String productName;     // Name of the product
    private int quantity;           // Quantity ordered
    private double price;           // Price per item
    private String paymentMethod;   // Payment method
    private String imageUrl;        // Product image URL
    private LocalDateTime orderDate;

}
