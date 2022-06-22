package com.tms.suproject.entity;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import javax.validation.constraints.*;
import java.util.ArrayList;
import java.util.List;

@NoArgsConstructor
@Getter
@Setter
@Entity
@Table(name = "rollInners")
public class RollInner {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private int price;
    private int weight;
    @Size(max = 4, message = "label.maxIngredients")
    @NotEmpty(message = "label.noIngredients")
    @ManyToMany
    @JoinTable(
            name = "rollInnerIngredients",
            joinColumns = {@JoinColumn(name = "rollInnerId")},
            inverseJoinColumns = {@JoinColumn(name = "innerIngredientId")}
    )
    private List<InnerIngredient> innerIngredients = new ArrayList<>();
    @OneToOne(mappedBy = "inner")
    private Roll roll;

    public int getPrice() {
        price = 0;
        innerIngredients.forEach(innerIngredient -> price += innerIngredient.getPrice());
        return price;
    }

    public int getWeight() {
        weight = 0;
        innerIngredients.forEach(innerIngredient -> weight += innerIngredient.getWeight());
        return weight;
    }
}