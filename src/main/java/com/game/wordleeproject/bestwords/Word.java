package com.game.wordleeproject.bestwords;

import java.util.Objects;

public class Word {
    final static int LENGTH = 5;
    final static int MATCH = 2;
    final static int MISPLACED = 1;
    final static int WRONG = 0;
    int[] word;

    public Word(String s) {
        char[] w = s.toCharArray();
        word = new int[LENGTH];
        for (int i = 0; i < LENGTH; ++i)
            word[i] = w[i];
    }

    public int[] wordAsInts() {
        return word;
    }

    public int findPatternAsInt(Word w) {
        int[] pattern = findPattern(w);
        int p = pattern[0];
        int t = 1;
        for (int i = 1; i < LENGTH; i++) {
            t *= 3;
            p += pattern[i] * t;
        }
        return p;
    }

    // gives pattern of this.word in w
    public int[] findPattern(Word w) {
        int[] pattern;
        int[] checked1 = new int[LENGTH];
        int[] checked2 = new int[LENGTH];
        int[] ww = w.wordAsInts();

        pattern = findMatches(w);

        for (int i = 0; i < LENGTH; ++i) {
            if (pattern[i] == MATCH) continue;
            for (int j = 0; j < LENGTH; ++j) {
                if (i != j && checked1[i] == 0 && checked2[j] == 0 && word[i] == ww[j]) {
                    pattern[i] = MISPLACED;
                    checked1[i] = 1;
                    checked2[j] = 1;
                }
            }
        }

        return pattern;
    }

    // find all greens
    public int[] findMatches(Word w) {
        int[] pattern = new int[LENGTH];
        int[] ww = w.wordAsInts();
        for (int i = 0; i < LENGTH; ++i)
            if (word[i] == ww[i])
                pattern[i] = MATCH;
        return pattern;
    }

    @Override
    public String toString() {
        char[] w = new char[LENGTH];
        for (int i = 0; i < LENGTH; ++i)
            w[i] = (char) word[i];
        return String.valueOf(String.valueOf(w));
    }


    @Override
    public int hashCode () {
        int hash = word[0];
        int t = 1;
        for (int i = 1; i < LENGTH; i++) {
            t *= 3;
            hash += word[i] * t;
        }
        return hash;
    }

    @Override
    public boolean equals ( Object obj ) {
        if ( obj == this ) return true;
        if ( obj == null || obj.getClass () != this.getClass () ) return false;
        var that = ( Word ) obj;
        for (int i = 0; i < LENGTH; ++i)
            if (word[i] != that.word[i]) return false;
        return true;
    }
}
