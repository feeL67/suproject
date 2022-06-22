package com.tms.suproject.services;

import com.tms.suproject.entity.Roll;
import org.springframework.stereotype.Service;

@Service
public class IngredientValidator {

    public boolean checkIngredients(Roll roll) {
        if (roll == null || roll.getInner().getInnerIngredients().size() == 0 || roll.getCover().getCoverIngredients().size() == 0) {
            return false;
        } else {
            return true;
        }
    }
}