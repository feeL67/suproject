package com.tms.suproject.repositories;

import com.tms.suproject.entity.InnerIngredient;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface InnerIngredientRepository extends JpaRepository<InnerIngredient, Long> {
}