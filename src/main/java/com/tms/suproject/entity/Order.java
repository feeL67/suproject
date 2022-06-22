package com.tms.suproject.entity;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.ArrayList;
import java.util.List;

@NoArgsConstructor
@Getter
@Setter
@Entity
@Table(name = "orders")
public class Order {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @NotBlank(message = "label.noCustomerName")
    private String customerName;
    @NotBlank(message = "label.noAddress")
    private String customerAddress;
    @Size(max = 12, min = 9, message = "label.incorrectNumberSize")
    @NotBlank(message = "label.noPhoneNumber")
    private String customerPhoneNumber;
    @NotEmpty(message = "label.noRolls")
    @ManyToMany
    @JoinTable(
            name = "orderedRolls",
            joinColumns = {@JoinColumn(name = "orderId")},
            inverseJoinColumns = {@JoinColumn(name = "rollId")}
    )
    private List<Roll> orderedRolls = new ArrayList<>();
    private int price;
    private String comment;
    @NotNull(message = "label.noAppliances")
    private Integer numberOfAppliances;
    private String payment;

    public int getPrice() {
        price = 0;
        orderedRolls.forEach(orderedRoll -> price += orderedRoll.getPrice());
        return price;
    }
}