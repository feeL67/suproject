package com.tms.suproject.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum ROLLTYPE {
    HOSOMAKI(80, 1),
    NORIMAKI(130, 2),
    UROMAKI(130, 2);

    private int riceWeight;
    private int price;
}