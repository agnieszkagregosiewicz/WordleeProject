package com.game.wordleeproject.controller;


import com.game.wordleeproject.model.JsonResponse;
import com.game.wordleeproject.model.Word;
import com.game.wordleeproject.service.CheckingMethod;
import com.game.wordleeproject.service.ReadFile;
import com.game.wordleeproject.service.WordGenerator;
import lombok.AllArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/user")
public class GameController {
    String file = "5lettersWords.txt";
    String headword = WordGenerator.generateHeadword(file);
    CheckingMethod checkingMethod = new CheckingMethod();

    @GetMapping(value = "/game")
    public String giveWord(Model model) {
        model.addAttribute("headword", headword);
        return "game";
    }
    @PostMapping(value = "/api/word")
    @ResponseBody
    public ResponseEntity<?> receiveWord(@RequestBody Word word) {
        System.out.println(headword);
        System.out.println(word);
        JsonResponse response = new JsonResponse();
        System.out.println(word.getWord());
        if (!checkingMethod.checkIfWordExistInArray(word.getWord(), ReadFile.makeArrayFromFile(file))) {
            response.setMsg("Takie słowo nie istnieje.");
            return ResponseEntity.badRequest().body(response);

        } else if (!checkingMethod.checkIfWordLengthIsOK(headword, word.getWord())) {
            response.setMsg("Słowo powinno mieć: " + headword.length() + " liter.");
            return ResponseEntity.badRequest().body(response);
        }
        response.setMsg(String.valueOf(checkingMethod.checkLettersInWord(headword, word.getWord())));
        System.out.println(response);
        return ResponseEntity.ok(response);
    }



}
