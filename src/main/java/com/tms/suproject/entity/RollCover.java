package com.tms.suproject.entity;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;
import java.util.ArrayList;
import java.util.List;

@NoArgsConstructor
@Getter
@Setter
@Entity
@Table(name = "rollCovers")
public class RollCover {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Long id;
    private int price;
    private int weight;
    @Size(max = 1, message = "label.oneIngredient")
    @NotEmpty(message = "label.noIngredient")
    @ManyToMany
    @JoinTable(
            name = "rollCoverIngredients",
            joinColumns = {@JoinColumn(name = "rollCoverId")},
            inverseJoinColumns = {@JoinColumn(name = "coverIngredientId")}
    )
    private List<CoverIngredient> coverIngredients = new ArrayList<>();
    @OneToOne(mappedBy = "cover")
    private Roll roll;

    public int getPrice() {
        price = 0;
        coverIngredients.forEach(coverIngredient -> price += coverIngredient.getPrice());
        return price;
    }

    public int getWeight() {
        weight = 0;
        coverIngredients.forEach(coverIngredient -> weight += coverIngredient.getWeight());
        return weight;
    }
}