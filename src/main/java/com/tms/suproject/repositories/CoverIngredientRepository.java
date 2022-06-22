package com.tms.suproject.repositories;

import com.tms.suproject.entity.CoverIngredient;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CoverIngredientRepository extends JpaRepository<CoverIngredient, Long> {
}