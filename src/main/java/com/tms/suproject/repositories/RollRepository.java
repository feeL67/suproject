package com.tms.suproject.repositories;

import com.tms.suproject.entity.Roll;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface RollRepository extends JpaRepository<Roll,Long> {
    List<Roll>findByName(String name);
}