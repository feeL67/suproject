package com.tms.suproject.services;

import com.tms.suproject.entity.InnerIngredient;
import com.tms.suproject.interfaces.InnerService;
import com.tms.suproject.repositories.InnerIngredientRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class InnerServiceImpl implements InnerService {

    private final InnerIngredientRepository innerIngredientRepository;

    @Autowired
    public InnerServiceImpl(InnerIngredientRepository innerIngredientRepository) {
        this.innerIngredientRepository = innerIngredientRepository;
    }

    @Override
    public List<InnerIngredient> findAll() {
        return innerIngredientRepository.findAll();
    }
}