package com.xworkz.cafe.repository;

import com.xworkz.cafe.dto.OrderDto;
import com.xworkz.cafe.entity.OrderEntity;

import java.util.List;

public interface OrderRepository {
    boolean saveOrder(OrderEntity order);
    List<OrderEntity> getOrdersByUser(String email);
}
