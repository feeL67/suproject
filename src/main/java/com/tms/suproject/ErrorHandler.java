package com.tms.suproject;

import org.hibernate.PersistentObjectException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;


@ControllerAdvice
public class ErrorHandler {

    @ExceptionHandler
    public ModelAndView catchException(PersistentObjectException exc) {
        ModelAndView modelAndView = new ModelAndView("create4");
        modelAndView.addObject("exc", exc.getMessage());
        return modelAndView;
    }
}