package com.tms.suproject.services;

import com.tms.suproject.entity.Order;
import com.tms.suproject.interfaces.OrderService;
import com.tms.suproject.repositories.OrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class OrderServiceImpl implements OrderService {

    private final OrderRepository orderRepository;

    @Autowired
    public OrderServiceImpl(OrderRepository orderRepository) {
        this.orderRepository = orderRepository;
    }

    @Override
    public Optional<Order> save(Order order) {
        return Optional.of(orderRepository.save(order));
    }
}