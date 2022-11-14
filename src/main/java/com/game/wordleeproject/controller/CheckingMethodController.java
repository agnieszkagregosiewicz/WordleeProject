package com.game.wordleeproject.controller;

import com.game.wordleeproject.service.CheckingMethod;
import com.game.wordleeproject.service.WordGenerator;

import java.io.IOException;

public class CheckingMethodController {

    public static void main(String[] args) throws IOException {

        CheckingMethod checkingMethod = new CheckingMethod();
        String file = "5lettersWords.txt";
        String headword = WordGenerator.generateHeadword(file);
        checkingMethod.checkConsoleAttempts(headword, 6, file);
    }
}
