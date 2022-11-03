package com.game.wordleeproject.model;

import lombok.Data;
import lombok.ToString;

@Data
public class JsonResponse {
    @ToString.Exclude
    String msg;

    @Override
    public String toString() {
        return msg + "";
    }

}
