package com.tms.suproject.services;

import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;

import java.util.List;

@Service
public class ErrorService {

    public boolean getErrors(BindingResult bindingResult, ModelMap model) {
        List<FieldError> fieldErrors = bindingResult.getFieldErrors();
        for (FieldError fieldError : fieldErrors) {
            String field = fieldError.getField();
            String defaultMessage = fieldError.getDefaultMessage();
            model.addAttribute(field, defaultMessage);
        }
        return fieldErrors.size() < 1;
    }
}