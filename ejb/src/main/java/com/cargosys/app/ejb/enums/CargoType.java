package com.cargosys.app.ejb.enums;
import java.util.*;

public enum CargoType {
    PERISHABLE,
    NON_PERISHABLE,
    HAZARDOUS,
    FRAGILE,
    LIQUID,
    DRY_BULK,
    TEMPERATURE_CONTROLLED,
    LIVE_ANIMAL,
    HIGH_VALUE;
    public static List<CargoType> getCargoTypes() {
        return Arrays.asList(CargoType.values());
    }

}

