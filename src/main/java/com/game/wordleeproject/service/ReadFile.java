package com.game.wordleeproject.service;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class ReadFile {

    public static void main(String[] args) {
        File file = new File("mostPopular.txt");
        List<String> sb = new ArrayList<>();
        try {
            Scanner scan = new Scanner(file);
            while (scan.hasNextLine()) {
                String word = scan.nextLine();
                if (word.length() == 5) {
                    sb.add(word);
                }
            }
        } catch (
                FileNotFoundException e) {
            throw new RuntimeException(e);
        }
        System.out.println(sb.size());
    }


    public static List<String> makeArrayFromFile(String file) {
        File myFile = new File(file);
        List<String> arrayList = new ArrayList<>();
        try {
            Scanner scan = new Scanner(myFile);
            while (scan.hasNextLine()) {
                String word = scan.nextLine();
                arrayList.add(word);
            }
        } catch (
                FileNotFoundException e) {
            throw new RuntimeException(e);
        }
        return arrayList;
    }


    public static void selectFromFileToNewFile(String inputFile, int minNumberOfLetters, int maxNumberOfLetters, String newFileName) {
        File file = new File(inputFile);
        StringBuilder sb = new StringBuilder();

        try {
            Scanner scan = new Scanner(file);
            while (scan.hasNextLine()) {
                String word = scan.nextLine();
                if (word.length() >= minNumberOfLetters && word.length() <= maxNumberOfLetters) {
                    sb.append(word + "\n");
                }
            }
        } catch (
                FileNotFoundException e) {
            throw new RuntimeException(e);
        }
        //write to new file
        try {
            PrintWriter printWriter = new PrintWriter(newFileName);
            printWriter.println(sb);
        } catch (FileNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

}
