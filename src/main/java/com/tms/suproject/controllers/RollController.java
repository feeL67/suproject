package com.tms.suproject.controllers;

import com.tms.suproject.entity.*;
import com.tms.suproject.enums.ROLLTYPE;
import com.tms.suproject.interfaces.CoverService;
import com.tms.suproject.interfaces.InnerService;
import com.tms.suproject.interfaces.OrderService;
import com.tms.suproject.interfaces.RollService;
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
import java.util.stream.Collectors;

@Controller
@SessionAttributes({"rollInner", "rollCover", "roll", "order"})
@RequestMapping("/")
public class RollController {

    private final InnerService innerService;
    private final CoverService coverService;
    private final RollService rollService;
    private final OrderService orderService;
    private final ErrorService errorService;
    private final IngredientValidator ingredientValidator;

    @Autowired
    public RollController(InnerService innerService, CoverService coverService, RollService rollService, OrderService orderService, ErrorService errorService, IngredientValidator ingredientValidator) {
        this.innerService = innerService;
        this.coverService = coverService;
        this.rollService = rollService;
        this.orderService = orderService;
        this.errorService = errorService;
        this.ingredientValidator = ingredientValidator;
    }

    @GetMapping()
    public String getHelloPage() {
        return "main";
    }

    @GetMapping("create")
    public String getCreatePage(Model model) {
        List<InnerIngredient> innerIngredients = innerService.findAll();
        model.addAttribute("ingredients", innerIngredients).
                addAttribute("rollInner", new RollInner());
        return "create";
    }

    @PostMapping("create")
    public String createInner(@Valid RollInner rollInner, BindingResult bindingResult, ModelMap model) {
        boolean noErrors = errorService.getErrors(bindingResult, model);
        if (noErrors) {
            return "redirect:create/2";
        } else {
            return "create2";
        }
    }

    @GetMapping("create/2")
    public String getCreate2Page(Model model) {
        List<CoverIngredient> covers = coverService.findAll();
        model.addAttribute("covers", covers).
                addAttribute("rollCover", new RollCover());
        return "create2";
    }

    @PostMapping("create/2")
    public String createCover(@Valid RollCover rollCover, BindingResult bindingResult, ModelMap model) {
        boolean noErrors = errorService.getErrors(bindingResult, model);
        if (noErrors) {
            return "redirect:/create/3";
        } else {
            return "/create3";
        }
    }

    @GetMapping("create/3")
    public String getCreate3Page(ModelMap model) {
        RollInner rollInner = (RollInner) model.get("rollInner");
        RollCover rollCover = (RollCover) model.get("rollCover");
        if (rollInner == null || rollCover == null) {
            return "redirect:/create";
        } else {
            model.addAttribute("roll", new Roll(ROLLTYPE.UROMAKI, rollInner, rollCover));
            return "create3";
        }
    }

    @PostMapping("create/3")
    public String createRoll(@Valid Roll roll, BindingResult bindingResult, ModelMap model) {
        boolean valid = ingredientValidator.checkIngredients(roll);
        if (!valid) {
            return "redirect:/create";
        }
        boolean noErrors = errorService.getErrors(bindingResult, model);
        if (noErrors) {
            roll.setPrice(roll.getPrice());
            roll.setWeight(roll.getWeight());
            rollService.save(roll);
            model.addAttribute("roll", roll);
            return "redirect:/create/4";
        } else {
            return "/create4";
        }
    }

    @GetMapping("create/4")
    public String getCreate4Page(ModelMap model) {
        Roll roll = (Roll) model.get("roll");
        boolean valid = ingredientValidator.checkIngredients(roll);
        if (valid) {
            return "create4";
        }
        return "redirect:/create";
    }

    @GetMapping("collection")
    public String getCollectionPage(ModelMap model) {
        List<Roll> createdRolls = rollService.findAll().stream().filter(roll -> roll.getImgSource() == null).collect(Collectors.toList());
        model.addAttribute("rolls", createdRolls);
        return "collection";
    }

    @GetMapping("menu")
    public String getMenuPage(ModelMap model) {
        List<Roll> menuRolls = rollService.findAll().stream().filter(roll -> roll.getImgSource() != null).collect(Collectors.toList());
        List<Roll> createdRolls = rollService.findAll().stream().filter(roll -> roll.getImgSource() == null).collect(Collectors.toList());
        model.addAttribute("menuRolls", menuRolls)
                .addAttribute("createdRolls", createdRolls)
                .addAttribute("order", new Order());
        return "menu";
    }

    @PostMapping("menu")
    public String takeOrder(Order order) {
        if (order.getOrderedRolls().size() == 0) {
            return "redirect:/menu";
        } else {
            return "order";
        }
    }

    @GetMapping("order")
    public String getOrderPage() {
        return "order";
    }

    @PostMapping("order")
    public String createOrder(@Valid Order order, BindingResult bindingResult, ModelMap model) {
        boolean noErrors = errorService.getErrors(bindingResult, model);
        if (noErrors) {
            orderService.save(order);
            return "order2";
        }
        return "order";
    }
}