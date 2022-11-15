package com.game.wordleeproject.controller;

import com.game.wordleeproject.model.CurrentUser;
import com.game.wordleeproject.model.User;
import com.game.wordleeproject.service.UserService;
import lombok.AllArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.beanvalidation.LocalValidatorFactoryBean;
import org.springframework.web.bind.annotation.*;
import javax.validation.Valid;
import javax.validation.Validator;
import java.util.List;
import java.util.Optional;


@Controller
@AllArgsConstructor
public class UserController {

    private final UserService userService;
    @Bean
    public Validator validator() {
        return new LocalValidatorFactoryBean();
    }
    @GetMapping("/admin/list")
    public String allUsers(Model model) {
        List<User> users = userService.getUsers();
        model.addAttribute("users", users);
        return "users-list";
    }

    @GetMapping("/ranking")
    public String rankingList(Model model) {
        List<User> usersR = userService.getListRanking();
        model.addAttribute("usersR", usersR);
        return "users-list-ranking";
    }

    @GetMapping("/user/ranking")
    public String rankingListU(Model model) {
        List<User> usersR = userService.getListRanking();
        model.addAttribute("usersR", usersR);
        return "users-list-ranking";
    }

    @GetMapping("/user")
    public String readUser(@AuthenticationPrincipal CurrentUser userSession, Model model) {
        Optional<User> user = userService.get(userSession.getUser().getId());
        if (user.isPresent()) {
            Long ranking = userService.getRanking(user.get().getScore());
            model.addAttribute("ranking", ranking);
            model.addAttribute("user", user.get());
        } else {
            return "oauth_login";
        }
        return "user-dashboard";
    }

    @GetMapping(value = "/add")
    public String form(Model model) {
        model.addAttribute("user", new User());
        return "user-add";
    }

    @PostMapping(value = "/add")
    public String submit(@Valid @ModelAttribute User user, BindingResult result) {
        if (!result.hasErrors()) {
            if (userService.findByEmail(user.getEmail()).isEmpty() && userService.findByLogin(user.getLogin()).isEmpty()) {
                userService.add(user);
                return "redirect:user";
            } else {
                return "redirect:/add?error=bad";
            }
        }
        return "user-add";
    }

    @GetMapping(value = "/user/delete")
    public String delete(User user) {
        userService.delete(user.getId());
        return "redirect:/logout";
    }

    @GetMapping(value = "/user/edit")
    public String editForm(User user, Model model) {
        model.addAttribute("user", userService.get(user.getId()).get());
        return "user-edit";
    }

    @PostMapping(value = "/user/edit")
    public String edit(@Valid User user, BindingResult result) {
        if (!result.hasErrors()) {
                userService.updateEdit(user);
                return "redirect:/user";
        }
        return "user-edit";
    }
}
