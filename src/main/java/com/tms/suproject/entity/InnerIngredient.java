package com.tms.suproject.entity;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import java.util.ArrayList;
import java.util.List;

@NoArgsConstructor
@Getter
@Setter
@ToString
@Entity
@Table(name = "innerIngredients")
public class InnerIngredient {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @NotBlank
    private String name;
    private int price;
    private int weight;
    @ManyToMany(mappedBy = "innerIngredients", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private List<RollInner> rollInners = new ArrayList<>();
    private String imgSource;
}