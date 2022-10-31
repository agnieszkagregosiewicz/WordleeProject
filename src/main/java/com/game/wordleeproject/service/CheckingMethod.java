package com.game.wordleeproject.service;

import lombok.Data;

import java.util.List;
import java.util.Scanner;

@Data
public class CheckingMethod {
    private List<String> unusedLetters;

    public CheckingMethod() {
        unusedLetters = ReadFile.makeArrayFromFile("alfabet.txt");
    }

    public void checkAttempts(String headword, int numberOfAttemps, String inputFileOfWords) {
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

    private char[] checkLettersInWord(String headword, String guessWord) {
        char[] headwordChar = headword.toCharArray();
        char[] guess = guessWord.toCharArray();
        for (char c : guess) {
            unusedLetters.remove(Character.toString(c));
        }
        for (int j = 0; j < headword.length(); j++) {
            for (int k = 0; k < headword.length(); k++) {
                if (headwordChar[j] == guess[k]) {
                    if (j == k) {
                        guess[k] = '1';
                        break;
                    } else {
                        guess[k] = '2';
                        break;
                    }
                }
            }
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
