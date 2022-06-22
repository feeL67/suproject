package com.tms.suproject.interfaces;

import com.tms.suproject.entity.Order;

import java.util.Optional;

public interface OrderService {
    Optional<Order> save(Order order);
}