package com.game.wordleeproject.bestwords;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.*;

record PairOfWords ( Word word1 , Word word2 ) {}

public class BestWords {
    Set<Word> secretWords = new HashSet<>();
    Set<Word> allWords = new HashSet<>();
    HashMap<PairOfWords, Integer> patternsMatrix = new HashMap<>();

    public static void main(String[] args) {
        Word w = new Word("ikrik");
        Word ww = new Word("kitek");
        System.out.println(Arrays.toString(w.findPattern(ww)));
        System.out.println(w.findPatternAsInt(ww));

    }

    public Set<Word> getSecretWords() {
        return secretWords;
    }

    public Set<Word> getAllWords() {
        return allWords;
    }

    public void setSecretWords(String fileName) {
        secretWords = readWordsFromFile(fileName);
    }

    public void setAllWords(String fileName) {
        allWords = readWordsFromFile(fileName);
    }

    private Set<Word> readWordsFromFile(String fileName) {
        File file = new File(fileName);
        Set<Word> set = new HashSet<>();
        try {
            Scanner scan = new Scanner(file);
            while (scan.hasNextLine()) {
                String word = scan.nextLine();
                Word w = new Word(word);
                set.add(w);
            }
        } catch (
                FileNotFoundException e) {
            throw new RuntimeException(e);
        }
        return set;
    }

    public void findPatternsMatrix() {
        for(Word w : allWords)
            for(Word ww : secretWords)
                patternsMatrix.put(new PairOfWords(w, ww), w.findPatternAsInt(ww));
    }
}
