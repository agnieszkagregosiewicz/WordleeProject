package com.game.wordleeproject.controller;

import com.game.wordleeproject.service.CheckingMethod;
import com.game.wordleeproject.service.WordGenerator;

public class CheckingMethodController {

    public static void main(String[] args) {

        CheckingMethod checkingMethod = new CheckingMethod();
        String file = "5lettersWords.txt";
        String headword = WordGenerator.generateHeadword(file);
        checkingMethod.checkAttempts(headword, 6, file);
    }
}
