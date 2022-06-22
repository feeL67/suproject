package com.tms.suproject.interfaces;

import com.tms.suproject.entity.Roll;

import java.util.List;
import java.util.Optional;

public interface RollService {
    Optional<Roll> save(Roll roll);

    List<Roll> findAll();
}