package com.game.wordleeproject.controller;

import com.game.wordleeproject.model.User;
import com.game.wordleeproject.service.UserService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import static org.mindrot.jbcrypt.BCrypt.hashpw;
import javax.validation.Valid;
import java.util.Optional;


@Controller
@RequestMapping("/user")
@AllArgsConstructor
public class UserController {

    private final UserService userService;

    private static final String SALT = "$2a$06$bjyVhqrhzzg592VySdTcuu";

    public static String hashPassword(String password) {
        return hashpw(password, SALT);
    }

//        @GetMapping("")
//        public String allBooks(Model model) {
//            List<Book> books = bookService.getBooks();
//            model.addAttribute("books", books);
//            return "book-list";
//        }

    @GetMapping("/{id}")
    public String readUser(@PathVariable Long id, Model model) {
        Optional<User> user = userService.get(id);
        if (user.isPresent()) {
            model.addAttribute("user", user.get());
        } else {
            return "user-dashboard";
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
            user.setPassword(hashPassword(user.getPassword()));
            userService.add(user);
            return "redirect:/user/" + user.getId();
        }
        return "user-add";
    }


    @GetMapping(value = "/delete")
    public String delete(User user) {
        userService.delete(user.getId());
        return "redirect:/user";
    }

    @GetMapping(value = "/edit")
    public String editForm(User user, Model model) {
        model.addAttribute("user", userService.get(user.getId()).get());
        return "user-edit";
    }

    @PostMapping(value = "/edit")
    public String edit(@Valid User user, BindingResult result) {
        if (!result.hasErrors()) {
            userService.update(user);
            return "redirect:/user";
        }
        return "user-edit";
    }

    @GetMapping(value = "/login")
    public String loginForm(User user, Model model) {
        model.addAttribute("user", user);
        return "login-form";
    }
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        response.setContentType("text/html;charset=utf-8");
//        request.setCharacterEncoding("utf-8");
//        String badLogin = request.getParameter("log");
//        if (badLogin != null && "bad".equals(badLogin)) {
//            request.setAttribute("badLogin", "bad");
//        }
//        getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);
//    }
//
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws
//            ServletException, IOException {
//        response.setContentType("text/html;charset=utf-8");
//        request.setCharacterEncoding("utf-8");
//        String email = request.getParameter("email");
//        String password = request.getParameter("password");
//
//        if (AdminDAO.checkLogin(email, password) == true) {
//            request.getSession().setAttribute("email", "logged");
//            request.getSession().setAttribute("email", email);
//            String name = AdminDAO.getName(email);
//            request.getSession().setAttribute("name", name);
//            response.sendRedirect("/app/dashboard");
//        } else {
//            response.sendRedirect("/login?log=bad");
//        }
//    }
//}


}
