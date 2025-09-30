package com.xworkz.cafe.service;

import com.xworkz.cafe.dto.CartItem;
import com.xworkz.cafe.dto.OrderDto;
import com.xworkz.cafe.entity.OrderEntity;
import com.xworkz.cafe.repository.OrderRepository;
import com.xworkz.cafe.repository.OrderRepositoryImpl;
import com.xworkz.cafe.service.EmailUtil;
import jakarta.mail.MessagingException;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class OrderServiceImpl implements OrderService {

    private OrderRepository orderRepo = new OrderRepositoryImpl();

    @Override
    public boolean placeOrder(List<CartItem> cart, String userEmail, String paymentMethod) {
        if (cart == null || cart.isEmpty()) return false;

        double totalAmount = 0;

        // Convert each CartItem → OrderEntity and save
        for (CartItem item : cart) {
            OrderEntity order = new OrderEntity();
            order.setUserEmail(userEmail);
            order.setProductName(item.getProductName());
            order.setQuantity(item.getQuantity());
            order.setPrice(item.getPrice());
            order.setImageUrl(item.getImageUrl());
            order.setPaymentMethod(paymentMethod);
            order.setOrderDate(LocalDateTime.now());

            orderRepo.saveOrder(order);

            totalAmount += item.getPrice() * item.getQuantity();
        }

        // Send confirmation email
        try {
            EmailUtil.sendOrderConfirmationEmail(userEmail, cart, totalAmount, paymentMethod);
        } catch (MessagingException e) {
            e.printStackTrace();
        }

        return true;
    }

    @Override
    public List<OrderDto> getOrdersByUser(String userEmail) {
        List<OrderEntity> entities = orderRepo.getOrdersByUser(userEmail);
        List<OrderDto> dtos = new ArrayList<>();

        for (OrderEntity o : entities) {
            OrderDto dto = new OrderDto(
                    o.getId(),
                    o.getUserEmail(),
                    o.getProductName(),
                    o.getQuantity(),
                    o.getPrice(),
                    o.getPaymentMethod(),
                    o.getImageUrl(),
                    o.getOrderDate()
            );
            dtos.add(dto);
        }

        return dtos;
    }
}
