package com.game.wordleeproject.service;

import lombok.Data;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

import java.io.IOException;
import java.util.List;
import java.util.Scanner;

@Data
public class CheckingMethod {
    private List<String> unusedLetters;

    private String wordToCheck;
    //@Value("/static/alfabet.txt")
    Resource resource = new ClassPathResource("/static/alfabet.txt");


    public CheckingMethod() throws IOException {
        unusedLetters = ReadFile.makeArrayFromFile(resource.getURL().getPath());
    }

    public String checkOneWord(String headword, String wordToCheck, String inputFileOfWords) {
        char[] result;
        if (checkIfWordsAreTheSame(headword, wordToCheck)) {
            return "Gratulacje!";
        } else {
            if (!checkIfWordExistInArray(wordToCheck, ReadFile.makeArrayFromFile(inputFileOfWords))) {
                return "Takie słowo nie istnieje.";
            }
            if (!checkIfWordLengthIsOK(headword, wordToCheck)) {
                return "Słowo powinno mieć: " + headword.length() + " liter.";
            }
            result = checkLettersInWord(headword, wordToCheck);
        }
        return result.toString();
    }

    public void checkConsoleAttempts(String headword, int numberOfAttemps, String inputFileOfWords) {
        for (int i = 0; i < numberOfAttemps; i++) {
            System.out.println("Letters to choose: " + unusedLetters);
            System.out.println("Zgadnij hasło: ");
            String guessWord = readWordFromConsole();
            char[] result;
            if (checkIfWordsAreTheSame(headword, guessWord)) {
                System.out.println("Gratulacje!");
                break;
            } else {
                if (!checkIfWordExistInArray(guessWord, ReadFile.makeArrayFromFile(inputFileOfWords))) {
                    System.out.println("Takie słowo nie istnieje.");
                    i--;
                    continue;
                }
                if (!checkIfWordLengthIsOK(headword, guessWord)) {
                    System.out.println("Słowo powinno mieć: " + headword.length() + " liter.");
                    i--;
                    continue;
                }
                result = checkLettersInWord(headword, guessWord);
            }
            System.out.println(result);
        }
        System.out.println("Prawidłowe hasło to: " + headword);
    }

    public char[] checkLettersInWord(String headword, String guessWord) {
        char[] headwordChar = headword.toCharArray();
        char[] guess = guessWord.toLowerCase().toCharArray();
        for (char c : guess) {
            unusedLetters.remove(Character.toString(c));
        }
        int[] checked = new int[headword.length()];
        for (int i = 0; i < 5; i++) {
            checked[i] = 0;
        }
        System.out.println(headword);
        for (int j = 0; j < headword.length(); j++) {
            System.out.println("j = " + j + " head[j] = " + headwordChar[j] + " guess[j] = " + guess[j]);
            if (headwordChar[j] == guess[j]) {
                guess[j] = '1';
                checked[j] = 1;
                System.out.println("j = " + j + " jest zielone");
                //break;
            }
        }
        for (int m = 0; m < headword.length(); m++) {
            //if ((Character.isLetter(guess[m]))) {
            for (int n = 0; n < headword.length(); n++) {
                System.out.println("m = " + m + " head[m] = " + headwordChar[m] + " n = " + n + " guess[n] = " + guess[n]);
                if (m != n && checked[m] == 0 && headwordChar[m] == guess[n]) {
                    System.out.println("m = " + m + " n = " + n + " jest żółte");
                    guess[n] = '2';
                    checked[m] = 1;
                }
            }
            //}
        }
        for (int l = 0; l < headword.length(); l++) {
            if (Character.isLetter(guess[l])) {
                guess[l] = '0';
            }
        }
        return guess;
    }


    public boolean checkIfWordExistInArray(String word, List<String> array) {
        for (String s : array) {
            if (word.equalsIgnoreCase(s)) {
                return true;
            }
        }
        return false;
    }

    public boolean checkIfWordLengthIsOK(String headword, String wordToCompare) {
        return headword.length() == wordToCompare.length();
    }

    public boolean checkIfWordsAreTheSame(String headword, String wordToCompare) {
        return headword.equalsIgnoreCase(wordToCompare);
    }

    public String readWordFromConsole() {
        Scanner sc = new Scanner(System.in);
        return sc.nextLine().toLowerCase();
    }
}
