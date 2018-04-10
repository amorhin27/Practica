package com.freesoftdev.sistemas.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import java.lang.annotation.*;

@Controller
public class HomeController {

    @Target(ElementType.METHOD)
    @Retention(RetentionPolicy.RUNTIME)
    @Documented
    public @interface Layout {
        String value() default "";
    }

    @GetMapping("/form")
    public String form(){
        return "/form";
    }

    @Layout(value = "layouts/login")
    @GetMapping("/")
    public String v2() {
        return "login";
    }

    @Layout(value = "layouts/login")
    @GetMapping("/login")
    public String login() {
        return "login";
    }

    @GetMapping("/list")
    public String list(){
        return "/list";
    }
}
