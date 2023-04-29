package com.example.servingwebcontent.controller;

import com.example.servingwebcontent.UserRepository;
import com.example.servingwebcontent.domain.Role;
import com.example.servingwebcontent.domain.User;
import io.micrometer.common.util.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;
import java.util.Set;

@Controller
public class RegistrationController {
    @Autowired
    private UserRepository userRepository;

    @GetMapping("/registration")
    public String registration() {
        return "registration";
    }

    @PostMapping("/registration")
    public String addUser(User user, Map<String, Object> model) {
        User userFromDb = userRepository.findByUsername(user.getUsername());
        if (userFromDb != null) {
            model.put("massage", "Username exists!");
            return "registration";
        } else {
            user.setActive(true);
            user.setRoles(Set.of(Role.USER));
            userRepository.save(user);
        }
        return "redirect:/login";
    }
}
