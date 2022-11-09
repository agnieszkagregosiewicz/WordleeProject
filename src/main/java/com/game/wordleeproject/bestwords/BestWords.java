package com.game.wordleeproject.bestwords;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.*;

public class BestWords {
    final static int LENGTH = 5;

    List<Word> secretWords = new ArrayList<>();
    List<Word> allWords = new ArrayList<>();

    public static void main(String[] args) {
        Word w = new Word("ikrik");
        Word ww = new Word("kitek");
        System.out.println(Arrays.toString(w.findPattern(ww)));
        System.out.println(w.findPatternAsInt(ww));

    }

    public List<Word> getSecretWords() {
        return secretWords;
    }

    public List<Word> getAllWords() {
        return allWords;
    }

    public void setSecretWords(String fileName) {
        secretWords = readWordsFromFile(fileName);
    }

    public void setAllWords(String fileName) {
        allWords = readWordsFromFile(fileName);
    }

    private List<Word> readWordsFromFile(String fileName) {
        File file = new File(fileName);
        List<Word> list = new ArrayList<>();
        try {
            Scanner scan = new Scanner(file);
            while (scan.hasNextLine()) {
                String word = scan.nextLine();
                Word w = new Word(word);
                list.add(w);
            }
        } catch (
                FileNotFoundException e) {
            throw new RuntimeException(e);
        }
        return list;
    }
}
