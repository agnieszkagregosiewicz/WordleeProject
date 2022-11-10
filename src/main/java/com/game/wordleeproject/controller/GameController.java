package com.game.wordleeproject.controller;

import com.game.wordleeproject.model.*;
import com.game.wordleeproject.service.*;
import net.minidev.json.JSONObject;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.FileWriter;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Controller
public class GameController {
    String file = "pop5.txt";
    String dictionary = "piatki.txt";
    String headword;
    boolean newgame = true;
    CheckingMethod checkingMethod = new CheckingMethod();
    int numberOfAttempts = 0;
    private final UserService userService;
    private final GamesService gamesService;

    public GameController(UserService userService, GamesService gamesService) {
        this.userService = userService;
        this.gamesService = gamesService;
    }

    @GetMapping(value = "/user/game")
    public String giveWord(Model model, @AuthenticationPrincipal CurrentUser user) {
        Long ranking = userService.getRanking(user.getUser().getScore());
        if (newgame) {
            newgame = false;
            headword = WordGenerator.generateHeadword(file);
        }
        model.addAttribute("ranking", ranking);
        model.addAttribute("user", user.getUser());
        return "game";
    }

    @PostMapping(value = "/api/word")
    @ResponseBody
    public ResponseEntity<?> receiveWord(@RequestBody Word word, @AuthenticationPrincipal CurrentUser user, Games game, Model model) {
        JsonResponse response = new JsonResponse();
        if (!checkingMethod.checkIfWordExistInArray(word.getWord(), ReadFile.makeArrayFromFile(dictionary))) {
            response.setMsg("Takie słowo nie istnieje.");
            return ResponseEntity.badRequest().body(response);

        } else if (!checkingMethod.checkIfWordLengthIsOK(headword, word.getWord())) {
            response.setMsg("Słowo powinno mieć: " + headword.length() + " liter.");
            return ResponseEntity.badRequest().body(response);
        }
        numberOfAttempts++;
        response.setMsg(String.valueOf(checkingMethod.checkLettersInWord(headword, word.getWord())));
        if (response.getMsg().equals("11111")) {
            newgame = true;
            double newScore = 8 - numberOfAttempts;
            game.setData(String.valueOf(LocalDateTime.now()));
            game.setResult(1);
            game.setNumberOfAttempt(numberOfAttempts);
            gamesService.add(game);
            user.getUser().setGamesPlayedQ(user.getUser().getGamesPlayedQ() + 1);
            user.getUser().setWinnings(user.getUser().getWinnings() + 1);
            user.getUser().setScore(user.getUser().getScore() + newScore);
            user.getUser().getGames().add(game);
            userService.update(user.getUser());
            model.addAttribute("user", user.getUser());
            numberOfAttempts = 0;
        }
        if (numberOfAttempts == 6 && !response.getMsg().equals("11111")) {
            newgame = true;
            user.getUser().setGamesPlayedQ(user.getUser().getGamesPlayedQ()+1);
            userService.update(user.getUser());
            model.addAttribute("user", user.getUser());
            game.setResult(0);
            game.setData(String.valueOf(LocalDateTime.now()));
            game.setNumberOfAttempt(7);
            gamesService.add(game);
            response.setMsg(String.valueOf(checkingMethod.checkLettersInWord(headword, word.getWord())) +": " + headword);
            numberOfAttempts = 0;
            return ResponseEntity.ok(response);
        }
        return ResponseEntity.ok(response);
    }
}
