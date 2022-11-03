package com.game.wordleeproject.controller;


import com.game.wordleeproject.model.JsonResponse;
import com.game.wordleeproject.model.Word;
import com.game.wordleeproject.service.CheckingMethod;
import com.game.wordleeproject.service.WordGenerator;
import lombok.AllArgsConstructor;
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
    public JsonResponse receiveWord(@RequestBody Word word, Model model) {
        System.out.println(word);
        JsonResponse response = new JsonResponse();
        response.setMsg(checkingMethod.checkOneWord(headword, word.getWord(), file));
        System.out.println(response);
        return response;
    }



}
