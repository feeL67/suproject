package com.tms.suproject.services;

import com.tms.suproject.entity.Roll;
import com.tms.suproject.interfaces.RollService;
import com.tms.suproject.repositories.RollRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class RollServiceImpl implements RollService {

    private final RollRepository rollRepository;

    @Autowired
    public RollServiceImpl(RollRepository rollRepository) {
        this.rollRepository = rollRepository;
    }

    @Override
    public Optional<Roll> save(Roll roll) {
        return Optional.of(rollRepository.save(roll));
    }

    @Override
    public List<Roll> findAll() {
        return rollRepository.findAll();
    }
}