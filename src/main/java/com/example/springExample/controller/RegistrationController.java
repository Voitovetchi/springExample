package com.example.springExample.controller;

import com.example.springExample.domain.User;
import com.example.springExample.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.Map;

@Controller
public class RegistrationController {
    @Autowired
    private UserService userService;

    @GetMapping("/registration")
    public String registration() {

        return "registration";
    }

    @PostMapping("/registration")
    public String addUser(User user, Map<String, Object> model) {


        if (!userService.addUser(user)) {
            model.put("message", "User exists");
            return "registration";
        }

        model.put("message", "An email for activation is sent. Follow the link in the message to activate.");
        
        return "registration";
    }

    @GetMapping("/activate/{code}")
    public String activate(Model model, @PathVariable String code) {
        boolean isActive = userService.activateUser(code);

        if (isActive) {
            model.addAttribute("message", "Activated");
        } else {
            model.addAttribute("message", "Activation failed");
        }

        return "login";
    }
}
