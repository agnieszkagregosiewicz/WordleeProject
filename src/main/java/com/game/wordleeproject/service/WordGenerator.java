package com.game.wordleeproject.service;
import java.util.*;

public class WordGenerator {

    public static String generateHeadword(String inputFile) {
        List<String> arrayFromFile = ReadFile.makeArrayFromFile(inputFile);
        Random r = new Random();
        int random = r.nextInt(arrayFromFile.size());
        String headword = arrayFromFile.get(random);
        return headword;
    }
}