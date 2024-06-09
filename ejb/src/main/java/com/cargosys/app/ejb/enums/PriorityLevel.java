package com.cargosys.app.ejb.enums;

import java.util.Arrays;
import java.util.List;

public enum PriorityLevel {
    URGENT,NORMAL;

    public static List<PriorityLevel> getAllPriorityLevel(){
        return Arrays.asList(PriorityLevel.values());
    }
}
