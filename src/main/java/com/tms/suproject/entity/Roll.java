package com.tms.suproject.entity;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;

@NoArgsConstructor
@Getter
@Setter
@Entity
@ToString
@Table(name = "rolls")
public class Roll {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    /*    @Enumerated(EnumType.STRING)
        private ROLLTYPE rolltype;*/
    @NotBlank(message = "label.noName")
    private String name;
    @OneToOne(cascade = CascadeType.ALL, orphanRemoval = true)
    @JoinColumn(name = "rollInner_id")
    private RollInner inner;
    @OneToOne(cascade = CascadeType.ALL, orphanRemoval = true)
    @JoinColumn(name = "rollCover_id")
    private RollCover cover;
    private int weight;
    private int price;

    public Roll(RollInner rollInner, RollCover rollCover) {
        this.inner = rollInner;
        this.cover = rollCover;
    }

    public int getWeight() {
        weight = 0;
        return inner.getWeight() + cover.getWeight();
    }

    public int getPrice() {
        price = 0;
        return inner.getPrice() + cover.getPrice();
    }
}