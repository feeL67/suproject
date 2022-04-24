package com.tms.suproject.controllers;

import com.tms.suproject.entity.*;
import com.tms.suproject.repositories.*;
import com.tms.suproject.services.ErrorService;
import com.tms.suproject.services.IngredientValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

@Controller
@SessionAttributes({"rollInner", "rollCover", "roll"})
@RequestMapping("/")
public class RollController {

    @Autowired
    InnerIngredientRepository innerIngredientRepository;
    @Autowired
    CoverIngredientRepository coverIngredientRepository;
    @Autowired
    RollRepository rollRepository;
    @Autowired
    ErrorService errorService;
    @Autowired
    IngredientValidator ingredientValidator;

    @GetMapping()
    public String getHelloPage() {
        return "main";
    }

    @GetMapping("create")
    public String getCreatePage(Model model) {
        List<InnerIngredient> innerIngredients = innerIngredientRepository.findAll();
        model.addAttribute("ingredients", innerIngredients).
                addAttribute("rollInner", new RollInner());
        return "create";
    }

    @PostMapping("create")
    public String createInner(@Valid RollInner rollInner, BindingResult bindingResult, ModelMap model) {
        boolean noErrors = errorService.getErrors(bindingResult, model);
        if (noErrors) {
            return "redirect:" + "create/2";
        } else return "create2";
    }

    @GetMapping("create/2")
    public String getCreate2Page(Model model) {
        List<CoverIngredient> covers = coverIngredientRepository.findAll();
        model.addAttribute("covers", covers).
                addAttribute("rollCover", new RollCover());
        return "create2";
    }

    @PostMapping("create/2")
    public String createCover(@Valid RollCover rollCover, BindingResult bindingResult, ModelMap model) {
        boolean noErrors = errorService.getErrors(bindingResult, model);
        if (noErrors) {
            return "redirect:" + "/create/3";
        } else return "/create3";
    }

    @GetMapping("create/3")
    public String getCreate3Page(ModelMap model) {
        RollInner rollInner = (RollInner) model.get("rollInner");
        RollCover rollCover = (RollCover) model.get("rollCover");
        if (rollInner == null || rollCover == null) {
            return "redirect:" + "/create";
        } else {
            model.addAttribute("roll", new Roll(rollInner, rollCover));
            return "create3";
        }
    }

    @PostMapping("create/3")
    public String createRoll(@Valid Roll roll, BindingResult bindingResult, ModelMap model) {
        boolean valid = ingredientValidator.checkIngredients(roll);
        if (!valid) {
            return "redirect:" + "/create";
        }
        boolean noErrors = errorService.getErrors(bindingResult, model);
        if (noErrors) {
            roll.setPrice(roll.getPrice());
            roll.setWeight(roll.getWeight());
            rollRepository.save(roll);
            return "redirect:" + "/create/4";
        } else return "/create4";
    }

    @GetMapping("create/4")
    public String getCreate4Page(ModelMap model) {
        Roll roll = (Roll) model.get("roll");
        boolean valid = ingredientValidator.checkIngredients(roll);
        if (valid) {
            return "create4";
        }
        return "redirect:" + "/create";
    }
}