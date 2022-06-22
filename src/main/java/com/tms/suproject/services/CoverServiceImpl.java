package com.tms.suproject.services;

import com.tms.suproject.entity.CoverIngredient;
import com.tms.suproject.interfaces.CoverService;
import com.tms.suproject.repositories.CoverIngredientRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CoverServiceImpl implements CoverService {

    private final CoverIngredientRepository coverIngredientRepository;

    @Autowired
    public CoverServiceImpl(CoverIngredientRepository coverIngredientRepository) {
        this.coverIngredientRepository = coverIngredientRepository;
    }

    @Override
    public List<CoverIngredient> findAll() {
        return coverIngredientRepository.findAll();
    }
}