package com.game.wordleeproject.controller;

import com.game.wordleeproject.model.User;
import com.game.wordleeproject.service.SpringDataUserDetailsService;
import com.game.wordleeproject.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.ResolvableType;
import org.springframework.security.oauth2.client.registration.ClientRegistration;
import org.springframework.security.oauth2.client.registration.ClientRegistrationRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;



@Controller
@SessionAttributes("currentUser")
public class LoginOauthController {
    private final UserService userService;

    private static String authorizationRequestBaseUri
            = "oauth2/authorization";
    Map<String, String> oauth2AuthenticationUrls
            = new HashMap<>();
    private final HttpSession session;
    @Autowired
    private ClientRegistrationRepository clientRegistrationRepository;

    public LoginOauthController(UserService userService, HttpSession session) {
        this.userService = userService;
        this.session = session;
    }

    @GetMapping("/login")
    public String getLoginPage(Model model, User user) {
        Iterable<ClientRegistration> clientRegistrations = null;
        ResolvableType type = ResolvableType.forInstance(clientRegistrationRepository)
                .as(Iterable.class);
        if (type != ResolvableType.NONE &&
                ClientRegistration.class.isAssignableFrom(type.resolveGenerics()[0])) {
            clientRegistrations = (Iterable<ClientRegistration>) clientRegistrationRepository;
        }
        clientRegistrations.forEach(registration ->
                oauth2AuthenticationUrls.put(registration.getClientName(),
                        authorizationRequestBaseUri + "/" + registration.getRegistrationId()));
        model.addAttribute("urlGoogle", oauth2AuthenticationUrls.get("Google"));
        model.addAttribute("urlFb", oauth2AuthenticationUrls.get("Facebook"));
        model.addAttribute("user", user);
        return "oauth_login";
    }

//    @PostMapping("/login")
//    public String loginUser(Model model, @RequestParam String email, @RequestParam String password) {
//        Optional<User> user = userService.findByEmail(email);
//        if (user.isPresent()) {
//            if (userService.checkPassword(user.get(), password)) {
//                SpringDataUserDetailsService sd = new SpringDataUserDetailsService(userService);
//                sd.loadUserByUsername(email);
//                session.setAttribute("user", user.get());
//                //model.addAttribute("user", user.get());
//            } else {
//                return "redirect:/login?error=badPassword";
//            }
//        } else {
//            return "redirect:/login?error=badLogin";
//        }
//        System.out.println("login" + user);
//        //return "game";
//        return "redirect:/user/"+user.get().getId();
//    }


}
