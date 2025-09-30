package com.xworkz.cafe.service;

import com.xworkz.cafe.dto.CartItem;
import com.xworkz.cafe.dto.OrderDto;
import com.xworkz.cafe.entity.OrderEntity;

import java.util.List;

public interface OrderService {
    boolean placeOrder(List<CartItem> cart, String userEmail, String paymentMethod);
    List<OrderDto> getOrdersByUser(String userEmail);
}
