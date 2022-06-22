package com.tms.suproject.entity;

import com.tms.suproject.enums.ROLLTYPE;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
import java.util.ArrayList;
import java.util.List;

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
    @Enumerated(EnumType.STRING)
    private ROLLTYPE rollType;
    private String imgSource;
    @Size(max = 20, message = "label.maxSize")
    @NotBlank(message = "label.noName")
    private String name;
    @OneToOne(cascade = CascadeType.ALL, orphanRemoval = true)
    @JoinColumn(name = "rollInner_id")
    private RollInner inner;
    @OneToOne(cascade = CascadeType.ALL, orphanRemoval = true)
    @JoinColumn(name = "rollCover_id")
    private RollCover cover;
    private Integer weight;
    private Integer price;
    @ManyToMany(mappedBy = "orderedRolls", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private List<Order> orders = new ArrayList<>();

    public Roll(ROLLTYPE rollType, RollInner inner, RollCover cover) {
        this.rollType = rollType;
        this.inner = inner;
        this.cover = cover;
    }

    public Integer getWeight() {
        if (weight == null) {
            return inner.getWeight() + cover.getWeight() + rollType.getRiceWeight();
        } else return weight;
    }

    public Integer getPrice() {
        if (price == null) {
            return inner.getPrice() + cover.getPrice() + rollType.getPrice();
        } else return price;
    }
}