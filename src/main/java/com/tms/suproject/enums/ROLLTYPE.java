package com.tms.suproject.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum ROLLTYPE {
    HOSOMAKI(80, 2),
    NORIMAKI(130, 3),
    UROMAKI(130, 3);

    private int riceWeight;
    private int price;
}