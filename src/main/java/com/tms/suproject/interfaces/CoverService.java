package com.tms.suproject.interfaces;

import com.tms.suproject.entity.CoverIngredient;

import java.util.List;

public interface CoverService {
    List<CoverIngredient> findAll();
}